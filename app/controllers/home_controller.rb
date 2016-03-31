class HomeController < ApplicationController
  def index
    @searches = SocialInfo.all.count
  end
end
