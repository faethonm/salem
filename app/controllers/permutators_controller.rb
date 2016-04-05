
require 'validator'
class PermutatorsController < ApplicationController

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
      valid_results = validator.find_valid_emails(results)
      @contacts = valid_results.map do |result|
        @contact = Contact.new()
        info_hash = @contact.validate_social_information(result[:information]).merge!({permutator_id: @permutator.id,email: result[:email]})
        @contact.update_attributes(info_hash)
        @contact if @contact.save
      end
      
      redirect_to @permutator
    else
      render 'new'
    end
  end

  

  private

  def permutator_params
    params.require(:permutator).permit(:first_name, :last_name, :middle_name, :company_name, :company_domain)
  end

end
