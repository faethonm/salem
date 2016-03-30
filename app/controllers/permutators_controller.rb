require 'permutator'
require 'validator'
class PermutatorsController < ApplicationController

  def search_by_info
    permutator = Permutator.new
    results = permutator.generate_emails(params)
    validator = Validator.new
    valid_results = validator.find_valid_emails(results)
    debugger
    valid_results
    redirect_to create_social_info_path(email: valid_results.first)
  end
end
