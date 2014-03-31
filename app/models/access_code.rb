class AccessCode < ActiveRecord::Base
	belongs_to :user

	# Before validating the presense of a code create the code
	before_validation do
		self.code = self.generate_code
	end

  # Validate that a code has been 
	validates :code, presence: true

	def generate_code
		SecureRandom.hex
	end

	def mark_as_used(user = nil)
		self.used_by = user.id
		self.used = true
		self.save
	end
end