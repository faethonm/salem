class Contact < ActiveRecord::Base
  serialize :contact_info
  serialize :demographics
  serialize :social_profiles
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_one :permutator

  def validate_social_information(information)
    info_hash = {}
    info_hash[:contact_info] = information['contactInfo']
    info_hash[:demographics] = information['demographics']
    info_hash[:social_profiles] = information['socialProfiles'].map do |sp|
      photo = type_photos(information) && type_photos(information)[sp['typeId']]
      {
        social_profile: sp,
        photo: photo && photo.first['url']
      }
    end
    info_hash[:primary_photo] = information['photos'] && information['photos'].find { |p| p['isPrimary'] }['url']
    info_hash
  end

  def type_photos(information)
    information['photos'] && information['photos'].group_by { |t| t['typeId'] }
  end
end
