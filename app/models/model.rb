# == Schema Information
#
# Table name: models
#
#  id         :integer          not null, primary key
#  birth_date :date
#  gender     :string(255)
#  height     :integer
#  weight     :integer
#  ethnicity  :string(255)
#  eye_color  :string(255)
#  hair_color :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#

class Model < ActiveRecord::Base
	has_one :user, as: :user_type

end
