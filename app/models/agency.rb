class Agency < ActiveRecord::Base
  has_one :user, as: :user_type
  validates :bio, presence: true,
    on: :update
  validates :bio, length: { minimum: 25 },
    on: :update
end
