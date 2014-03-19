class Model < ActiveRecord::Base
	has_one :user, as: :user_type

  validates :birth_date, :gender, :height, :ethnicity,
    :eye_color, :hair_color, :bio, presence: true,
    on: :update
  validates :bio, length: { minimum: 100 },
   on: :update

end
