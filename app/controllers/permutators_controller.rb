require 'validator'
class PermutatorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @permutator = Permutator.new
  end

  def show
    @permutator = Permutator.find(params[:id])
    @contacts = @permutator.contacts
  end

  def create
    @permutator = Permutator.new(permutator_params)
    if @permutator.save
      results = @permutator.generate_emails(permutator_params)
      validator = Validator.new
      validator.find_valid_emails(results,@permutator)
      redirect_to @permutator
    else
      render 'new'
    end
  end

  def fullcontact_information_received
    result = params['result']
    email = params['webhookId']
    @permutator = Permutator.find(params['id'])
    if result['status'] != 404
      @contact = Contact.new
      info_hash = @contact.validate_social_information(result)
      info_params = info_hash.merge!(
        permutator_id: @permutator.id,
        email: email
      )
      @contact.update_attributes(info_params)

      @contact if @contact.save

    end
    sync_update @permutator
    redirect_to @permutator
  end

  private

  def permutator_params
    params.require(:permutator).permit(:first_name, :last_name, :middle_name, :company_name, :company_domain)
  end
end
