

class SocialInfo < ActiveRecord::Base
  serialize :information
  validates :email , presence:true
  validates :information , presence:true

 
end
