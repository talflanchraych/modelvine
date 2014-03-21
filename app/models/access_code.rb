class AccessCode < ActiveRecord::Base
	belongs_to :user

	before_validation do
		self.code
	end

	validates :code, presence: true

	def code
		SecureRandom.hex
	end

	def mark_as_used(user = nil)
		self.used_by = user.id
		self.used = true
		self.save
	end
end