FactoryGirl.define do
  factory :social_info do
    email { FFaker::Internet.email }
    information { FFaker::Lorem.sentence }
  end
end
