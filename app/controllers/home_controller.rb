class HomeController < ApplicationController
  def index
    @social_info = SocialInfo.new
    @searches = SocialInfo.all.count
  end

  def contact
  end
end
