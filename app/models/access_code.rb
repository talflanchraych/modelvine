class AccessCode < ActiveRecord::Base
	belongs_to :user

	before_validation do
		self.access_code = SecureRandom.hex
	end

	validates :access_code, presence: true
end