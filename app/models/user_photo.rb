class UserPhoto < ActiveRecord::Base
	belongs_to :user
	# The default way the phot's will be listed
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :caption, length: { maximum: 140 }
	validates :caption, presence: true
end
