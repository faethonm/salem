require 'rails_helper'

RSpec.describe Umim, type: :model do
  before { @umim = FactoryGirl.build(:umim) }

  subject { @umim }

  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:company_name) }
  it { should respond_to(:company_domain) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should be_valid }
end
