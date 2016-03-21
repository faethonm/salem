require 'validator'
class SocialInfosController < ApplicationController

  def show
    @social_info = SocialInfo.find(params[:id])
    information = @social_info.information
    if information
      @contact_info = information.contact_info
      @demographics = information.demographics
      type_photos = information.photos && information.photos.group_by{|p| p.type_id}
      @social_profiles = information.social_profiles.map do |sp|
        photo = type_photos && type_photos[sp.type_id]
        {
          social_profile: sp,
          photo: photo && photo.first.url
        }
      end
      @primary_photo = information.photos && information.photos.find{|p| p.is_primary}.url
    else
      flash['success'] = 'Not enough info available'
      render 'new'
    end
  end

  def new
    @social_info = SocialInfo.new
  end

  def create
    @social_info = SocialInfo.find_by(email: info_params[:email])
    if @social_info
      redirect_to @social_info
      return
    else
      @social_info = SocialInfo.create(info_params)
      validator = Validator.new
      information = validator.find_social_info(info_params[:email])
      @social_info.update_attribute(:information, information)
      if @social_info.save
        flash[:sucess] = 'Found social information'
        redirect_to @social_info
      else
        flash[:sucess] = 'Couldnt find info'
        render 'new'
      end
    end
  end

  private

  def info_params
    params.require(:social_info).permit(:email, :information)
  end
end
