require 'rails_helper'

RSpec.describe SocialInfo, type: :model do
  before { @social_info = FactoryGirl.build(:social_info) }

  subject { @social_info }

    it { should respond_to(:email) }
    it { should respond_to(:information) }
    it { should respond_to(:contact_info) }
    it { should respond_to(:demographics) }
    it { should respond_to(:social_profiles) }
    it { should respond_to(:primary_photo) }
    it { should validate_presence_of(:email) 
    it { should be_valid }
end
