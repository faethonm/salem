
require 'validator'
class PermutatorsController < ApplicationController

  def new
    @permutator = Permutator.new
  end

  def show
    @permutator = Permutator.find(params[:id])
    @permutator.permutated_accounts
  end

  def create
    @permutator = Permutator.new
    permutator = Permutator.new
    results = permutator.generate_emails(params)
    validator = Validator.new
    valid_results = validator.find_valid_emails(results)
    @possible_social_info = valid_results.map do |result|
      SocialInfo.create(email: result.email, information: result)
    end
  end

  private

  def permutator_params
    params.require(:permutator).permit(:first_name, :last_name, :middle_name, :company_name, :company_domain)
  end

end
