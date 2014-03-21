class UserPhoto < ActiveRecord::Base
	belongs_to :user

	has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "200x200#" }, :default_url => "assets/images/:style/missing.png"

	validates :user_id, presence: true
	validates :caption, length: { maximum: 140 }
	validates :photo_width, presence: true
	validates :photo_height, presence: true

	# Validations for Photo's
	validates :photo, presence: true
	# Don't let people upload Giant phot's and charge alot of out AWS account
	validates_attachment_size :photo, :less_than => 5.megabytes
 	# Only let people uplad a photo
 	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

 	# The default way the phot's will be listed
	default_scope -> { order('created_at DESC') }

	scope :default_photo, -> { where(default_photo: true )}
	

	after_post_process :save_image_dimensions

	def save_image_dimensions
		geo = Paperclip::Geometry.from_file(photo.queued_for_write[:original])
	    self.photo_width = geo.width.to_i
	    self.photo_height = geo.height.to_i
	end
	
end
