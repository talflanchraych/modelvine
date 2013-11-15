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
#  zip_code        :string(255)
#  type_of_user    :string(255)
#  user_website    :string(255)
#

class User < ActiveRecord::Base
	has_many :user_photos, :dependent => :destroy

  #ensure uniquess by downcasing the email attribute
	before_save { self.email = email.downcase }
	before_create :create_remember_token

  #This validation is only important with the update action
	#validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6, allow_nil: true }

  default_scope -> { order('created_at DESC') }

  #Only Show Users on the User Index page, who have updated a name
  scope :with_name, where("name <> ''")

  #Only Show users that have been approved
  scope :approved, where(approved: true)

  #Breaks!! the :with_name scope when impleneted
  scope :type_of_user_model, where(:type_of_user == "Model")

  # Sign in user
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  #Keep user signed in
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def user_photo_feed
    # This is preliminary. See "Following users" for the full implementation.
    UserPhoto.where("user_id = ?", id)
    # The ? ensures that the id is properly escaped before being included in underlying SQL query
    # This prevents SQL injection
  end

  def get_default_photo
    # Look at the current user, then their photos, then scoping the default_photo in in user_photo model
    self.user_photos.default_photo.first
  end

  private

    # Automatically keep users signed in
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
