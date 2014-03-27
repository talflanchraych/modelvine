class Model < ActiveRecord::Base
	has_one :user, as: :user_type

  validates :birth_date, :gender, :height, :ethnicity,
    :eye_color, :hair_color, presence: true,
    on: :update

  delegate :username, to: :user, :allow_nil => true

  extend FriendlyId
  friendly_id :username

end
