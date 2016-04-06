require 'thummim'
class UmimsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @umim = Umim.new
  end

  def show
    @umim = Umim.find(params[:id])
    @contacts = @umim.contacts
  end

  def create
    @umim = Umim.new(umim_params)
    if @umim.save
      results = @umim.generate_emails(umim_params)
      Thummim.new.find_valid_emails(results, @umim)
      redirect_to @umim
    else
      render 'new'
    end
  end

  def fullcontact_information_received
    result = params['result']
    email = params['webhookId']
    @umim = Umim.find(params['id'])
    if result['status'] != 404
      @contact = Contact.new
      info_hash = @contact.validate_social_information(result)
      info_params = info_hash.merge!(
        umim_id: @umim.id,
        email: email
      )
      @contact.update_attributes(info_params)

      @contact if @contact.save

    end
    sync_update @umim
    redirect_to @umim
  end

  private

  def umim_params
    params.require(:umim).permit(:first_name, :last_name, :middle_name, :company_name, :company_domain)
  end
end
