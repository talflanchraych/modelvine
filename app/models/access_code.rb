class AccessCode < ActiveRecord::Base
	belongs_to :user

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