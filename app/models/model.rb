# == Schema Information
#
# Table name: models
#
#  id           :integer          not null, primary key
#  birth_date   :date
#  gender       :string(255)
#  height       :integer
#  weight       :integer
#  ethnicity    :string(255)
#  eye_color    :string(255)
#  hair_color   :string(255)
#  model_mayhem :string(255)
#  bio          :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Model < ActiveRecord::Base
	has_one :user, as: :user_type

  validates :birth_date, :gender, :height, :weight, :ethnicity,
    :eye_color, :hair_color, :bio, presence: true,
    on: :update
  validates :bio, length: { minimum: 100 },
    on: :update

end
