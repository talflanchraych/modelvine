class UserPhoto < ActiveRecord::Base
	belongs_to :user

	has_attached_file :photo, :styles => { :medium => "300>x300", :thumb => "200x200#", :micro => "40x40#" }, :default_url => "assets/images/:style/missing.png"

	validates :user_id, presence: true
	validates :caption, length: { maximum: 140 }
	validates :photo_width, presence: true
	validates :photo_height, presence: true
	validates :photo, presence: true
	validates_attachment_size :photo, :less_than => 10.megabytes
 	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/tif']

	default_scope -> { order('created_at DESC')}

	scope :approved_users, -> { joins(:user).where('users.approved = true').limit(10) }
	
	after_post_process :save_image_dimensions

	def save_image_dimensions
		geo = Paperclip::Geometry.from_file(photo.queued_for_write[:original])
	    self.photo_width = geo.width.to_i
	    self.photo_height = geo.height.to_i
	end

	def relative_time(start_time)
	  diff_seconds = (Time.now - start_time).to_i
	  case diff_seconds
	    when 0 .. 59
	      "#{diff_seconds} seconds ago"
	    when 60 .. (3600-1)
	      "#{diff_seconds/60} minutes ago"
	    when 3600 .. (3600*24-1)
	      "#{diff_seconds/3600} hours ago"
	    when (3600*24) .. (3600*24*30) 
	      "#{diff_seconds/(3600*24)} days ago"
	    else
	       start_time.strftime("%m/%d/%Y")
	  end
	end

	
end
