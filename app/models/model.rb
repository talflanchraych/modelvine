class Model < ActiveRecord::Base
	has_one :user, as: :user_type

  validates :birth_date, :gender, :height, :ethnicity,
    :eye_color, :hair_color, presence: true,
    on: :update

  validate :has_uploaded_a_photo, on: :update
  
  def has_uploaded_a_photo
    if self.user.user_photos.count < 1
      errors.add(:base, "Please upload at least 1 photo to continue")
    end
  end  

  delegate :username, to: :user, :allow_nil => true

  extend FriendlyId
  friendly_id :username

end
