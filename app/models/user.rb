# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  remember_token         :string(255)
#  admin                  :boolean          default(FALSE)
#  zip_code               :string(255)
#  type_of_user           :string(255)
#  user_website           :string(255)
#  approved               :boolean          default(FALSE)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  user_type_id           :integer
#  user_type_type         :string(255)
#  default_photo_id       :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :user_photos, :dependent => :destroy
  belongs_to :user_type, polymorphic: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #Valudations on the Update page
  validates_presence_of :name, :zip_code, on: :update
  validates_format_of :zip_code, 
    with: /\A\d{5}-\d{4}|\A\d{5}\z/,
    message: "should be in the form 12345 or 12345-1234",
    on: :update

  ###########
  ##SCOPING##
  ###########

  default_scope -> { order('created_at DESC') }

  ## in the controller action add .with_name or .approved to scope

  #Only Show Users on the User Index page, who have updated a name
  scope :with_name, -> { where("name <> ''") }

  #Only Show users that have been approved
  scope :approved,  -> { where(approved: true) }

  #Breaks!! the :with_name scope when impleneted
  scope :type_of_user_model, -> { where(:type_of_user == "Model") }

  scope :recently_updated, -> { unscoped.order('updated_at DESC') }

  ################
  ##User Methods##
  ################

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
    self.user_photos.find_by_id(default_photo_id)
  end

  def get_regular_photo
    self.user_photos.reject{|x| x.id == self.default_photo_id}.sort_by(&:created_at).reverse!.first(3)
  end

  private

    # Automatically keep users signed in
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
