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
    @social_info = SocialInfo.find_by(email: info_params[:email])
    if @social_info
      redirect_to @social_info
      return
    else
      @social_info = SocialInfo.new(info_params)
      if @social_info.save
        redirect_to @social_info
      else
        render 'home/index'
      end
    end
  end

  private

  def info_params
    params.require(:social_info).permit(:email)
  end

  def find_emails(emails)
    Validator.new.find_valid_emails(emails)
end
