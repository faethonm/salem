require 'validator'
class SocialInfosController < ApplicationController
  def show
    @social_info = SocialInfo.find(params[:id])
    @information = @social_info.information
    @contact_info = @social_info.contact_info
    @demographics = @social_info.demographics
    @social_profiles = @social_info.social_profiles
    @primary_photo = @social_info.primary_photo
  end

  def new
    @social_info = SocialInfo.new
  end

  def create
    generated_info = email_params[:information] || find_info(email_params[:email])
    debugger
    @social_info = SocialInfo.find_by(email: email_params[:email])
    if @social_info
      redirect_to @social_info
      return
    else
      social_info_params = {email: email_params[:email]}.merge(validate_social_information(generated_info))
      @social_info = @social_info = SocialInfo.new(social_info_params)
      if @social_info.save
        redirect_to @social_info
      else
        render 'home/index'
      end
    end
  end

  private

  def email_params
    params.require(:social_info).permit(:email,:information)
  end

  def find_info(email)
    Validator.new.find_social_info(email)
  end

  def validate_social_information(information)
    info_hash = {}
    info_hash[:contact_info] = information.contact_info
    info_hash[:demographics] = information.demographics
    info_hash[:social_profiles] = information.social_profiles.map do |sp|
      photo = type_photos(information) && type_photos(information)[sp.type_id]
      {
        social_profile: sp,
        photo: photo && photo.first.url
      }
    end
    info_hash[:primary_photo] = information.photos && information.photos.find(&:is_primary).url
    info_hash
  end

  def type_photos(information)
    information.photos && information.photos.group_by(&:type_id)
  end

  # def find_info(email)
  #   Validator.new.find_valid_emails([email])
  #   validator = Validator.new
  #   info_hash = {}
  #   @information =  validator.find_social_info(email)
  #   if @information
  #     info_hash[:contact_info] = @information.contact_info
  #     info_hash[:demographics] = @information.demographics
  #     info_hash[:social_profiles] = @information.social_profiles.map do |sp|
  #       photo = type_photos && type_photos[sp.type_id]
  #       {
  #         social_profile: sp,
  #         photo: photo && photo.first.url
  #       }
  #     end
  #     info_hash[:primary_photo] = @information.photos && @information.photos.find(&:is_primary).url
  #   end
  #   info_hash
  # end


end
