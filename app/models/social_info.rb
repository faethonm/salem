class SocialInfo < ActiveRecord::Base
  serialize :information
  serialize :contact_info
  serialize :demographics
  serialize :social_profiles
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_create :validate_social_information

  def validate_social_information
    validator = Validator.new
    self.information = validator.find_social_info(email)
    if information
      self.contact_info = information.contact_info
      self.demographics = information.demographics
      self.social_profiles = information.social_profiles.map do |sp|
        photo = type_photos && type_photos[sp.type_id]
        {
          social_profile: sp,
          photo: photo && photo.first.url
        }
      end
      self.primary_photo = information.photos && information.photos.find { |p| p.is_primary }.url
    end
  end

  private

  def type_photos
    information.photos && information.photos.group_by { |p| p.type_id }
  end
end
