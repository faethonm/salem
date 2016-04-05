require 'validator'
class ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])

    @demographics = @contact.demographics
    @primary_photo = @contact.primary_photo
    @permutator = Permutator.find(@contact.permutator_id)
    @by_email = params[:by_email]
  end

  def new
    @contact = Contact.new
  end

  def create
    generated_info = email_params[:information] || find_info(email_params[:email])
    @contact = Contact.find_by(email: email_params[:email])
    if @contact
      redirect_to contact_path(@contact, by_email: true)
      return
    else
      @contact = Contact.new
      contact_params = { email: email_params[:email] }.merge(@contact.validate_social_information(generated_info))
      @contact.update_attributes(contact_params)
      if @contact.save
        redirect_to contact_path(@contact, by_email: true)
      else
        render 'new'
      end
    end
  end

  private

  def email_params
    params.require(:contact).permit(:email, :information)
  end

  def find_info(email)
    Validator.new.find_contact(email)
  end
end
