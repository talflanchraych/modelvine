# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
	#ensure uniquess by downcasing the email attribute
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  # Sign in user
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  #Keep user signed in
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    # Automatically keep users signed in
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
