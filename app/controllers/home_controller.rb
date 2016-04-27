class HomeController < ApplicationController
  def index
    @contact = Contact.new
    @searches = Contact.all.count
  end
end
