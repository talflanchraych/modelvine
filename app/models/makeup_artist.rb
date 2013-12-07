# == Schema Information
#
# Table name: makeup_artists
#
#  id           :integer          not null, primary key
#  model_mayhem :string(255)
#  website      :string(255)
#  bio          :text
#  created_at   :datetime
#  updated_at   :datetime
#

class MakeupArtist < ActiveRecord::Base
  has_one :user, as: :user_type
  validates :bio, presence: true,
    on: :update
  validates :bio, length: { minimum: 50 },
    on: :update
end
