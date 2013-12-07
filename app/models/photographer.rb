# == Schema Information
#
# Table name: photographers
#
#  id           :integer          not null, primary key
#  model_mayhem :string(255)
#  website      :string(255)
#  bio          :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Photographer < ActiveRecord::Base
  has_one :user, as: :user_type
end
