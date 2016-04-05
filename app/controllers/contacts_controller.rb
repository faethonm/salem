require 'validator'
class ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
    @contact_info = @contact.contact_info
    @demographics = @contact.demographics
    @social_profiles = @contact.social_profiles
    @primary_photo = @contact.primary_photo
  end

  def new
    @contact = Contact.new
  end

  def create
    generated_info = email_params[:information] || find_info(email_params[:email])
    @contact = Contact.find_by(email: email_params[:email])
    if @contact
      redirect_to @contact
      return
    else
      @contact = Contact.new
      contact_params = {email: email_params[:email]}.merge(@contact.validate_social_information(generated_info))
      @contact.update_attributes(contact_params)
      if @contact.save
        redirect_to @contact
      else
        render 'new'
      end
    end
  end

  private

  def email_params
    params.require(:contact).permit(:email,:information)
  end

  def find_info(email)
    Validator.new.find_contact(email)
  end

  # def validate_contact_information(information)

  #   info_hash = {}
  #   info_hash[:contact_info] = information.contact_info
  #   info_hash[:demographics] = information.demographics
  #   info_hash[:social_profiles] = information.social_profiles.map do |sp|
  #     photo = type_photos(information) && type_photos(information)[sp.type_id]
  #     {
  #       social_profile: sp,
  #       photo: photo && photo.first.url
  #     }
  #   end
  #   info_hash[:primary_photo] = information.photos && information.photos.find(&:is_primary).url
  #   info_hash
  # end

  # def type_photos(information)
  #   information.photos && information.photos.group_by(&:type_id)
  # end

  # def find_info(email)
  #   Validator.new.find_valid_emails([email])
  #   validator = Validator.new
  #   info_hash = {}
  #   @information =  validator.find_contact(email)
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
