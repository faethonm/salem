class Contact < ActiveRecord::Base
  serialize :contact_info
  serialize :demographics
  serialize :social_profiles
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_one :umim

  def validate_social_information(information)
    info_hash = {}
    info_hash[:contact_info] = information[:contact_info]
    info_hash[:demographics] = information[:demographics]
    info_hash[:social_profiles] = information[:social_profiles].map do |sp|
      photo = type_photos(information) && type_photos(information)[sp[:type_id]]
      {
        social_profile: sp,
        photo: photo && photo.first[:url]
      }
    end
    info_hash[:primary_photo] = information[:photos] && information[:photos].find { |p| p[:is_primary] }[:url]
    info_hash
  end

  def type_photos(information)
    information[:photos] && information[:photos].group_by { |t| t[:type_id] }
  end
end
