

class SocialInfo < ActiveRecord::Base
  validates :email , presence:true
  validates :information , presence:true

 
end
