class HomeController < ApplicationController
  def index
    @searches = SocialInfo.all.count
  end

  def find_by_email
    @social_info = SocialInfo.new
  end

  def find_by_info
  end
end
