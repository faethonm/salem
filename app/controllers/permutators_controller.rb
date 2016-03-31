
require 'validator'
class PermutatorsController < ApplicationController

  def search_by_info
    permutator = Permutator.new
    results = permutator.generate_emails(params)
    validator = Validator.new
    valid_results = validator.find_valid_emails(results)
    debugger
    valid_results.first
    debugger
    @possible_social_info = valid_results.each do |result|
      SocialInfo.create(email: result.email, information: result)
    end
    redirect_to view_permutated_path
  end

  def view_permutated
    debugger
    params
  end

end
