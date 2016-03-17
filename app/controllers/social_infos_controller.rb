class SocialInfosController < ApplicationController

  def show
    @social_info = SocialInfo.find(params[:id])
  end

  def new
    @social_info = SocialInfo.new
  end

  def create
    @social_info = SocialInfo.create(info_params)
    @social_info.update_attribute(:information, 'hello')
    if @social_info.save
      flash[:sucess]= 'Found social information'
      redirect_to @social_info
    else
      flash[:sucess]= 'Couldnt find info'
      render 'new'
    end
  end

  private

  def info_params
    params.require(:social_info).permit(:email, :information)

  end
end
