class Model < ActiveRecord::Base
	has_one :user, as: :user_type

  validates :gender, :height, :ethnicity,
    :eye_color, :hair_color, presence: true,
    on: :update

  validate :has_uploaded_a_photo, on: :update
  
  def has_uploaded_a_photo
    if self.user.user_photos.count < 1
      errors.add(:base, "Please Upload a Photo to Join this Site")
    end
  end  

  delegate :username, to: :user, :allow_nil => true

  extend FriendlyId
  friendly_id :username

end
