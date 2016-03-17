class HomeController < ApplicationController
  def index
    @social_info = SocialInfo.new
  end

  def contact
  end
end
