class Model < ActiveRecord::Base
	has_one :user, as: :user_type

  validates :birth_date, :gender, :height, :ethnicity,
    :eye_color, :hair_color, presence: true,
    on: :update

end
