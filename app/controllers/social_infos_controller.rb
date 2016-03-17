require 'validator'
class SocialInfosController < ApplicationController

  def show
    @social_info = SocialInfo.find(params[:id])
    information = @social_info.information
    @contact_info = information.contact_info
    @demographics = information.demographics
    @social_profiles = information.social_profiles
    @primary_photo = information.photos.find{ |p| p.is_primary}.url
  end

  def new
    @social_info = SocialInfo.new
  end

  def create
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

  private

  def info_params
    params.require(:social_info).permit(:email, :information)
  end
end
