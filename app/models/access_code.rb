class AccessCode < ActiveRecord::Base
	belongs_to :user

	before_validation do
		self.code = SecureRandom.hex
	end

	validates :code, presence: true

	def mark_as_used(user = nil)
		self.used_by = user.id
		self.used = true
		self.save
	end
end