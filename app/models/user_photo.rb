class UserPhoto < ActiveRecord::Base
	belongs_to :user
	has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
	# The default way the phot's will be listed
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :caption, length: { maximum: 140 }
	validates :photo, presence: true
end
