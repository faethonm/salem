class HomeController < ApplicationController
  def index
    @searches = Contact.all.count
  end
end
