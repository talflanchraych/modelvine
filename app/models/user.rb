class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :user_photos, :dependent => :destroy
  has_many :access_codes
  belongs_to :user_type, polymorphic: true

  after_create :give_user_invites
  after_create :mark_code_as_used_by

  def give_user_invites
    10.times do
      self.access_codes << AccessCode.create(code: self.generate_code, user_id: self.id)
    end
  end

  def generate_code
    SecureRandom.hex
  end

  # I am doing to same find twice, See validates access code. This code can be cleaned up to speed up the application. 
  def mark_code_as_used_by
    current_code = AccessCode.find_by(code: code_used)
    current_code.used_by = self.id
    current_code.save
  end

  ###############
  # Validations #
  ###############

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true

  validate :validates_accesss_code, on: :create

  def validates_accesss_code
    current_code = AccessCode.find_by(code: code_used)
    if current_code == nil
      errors.add(:code_used, "This is not a valid access code")
    elsif current_code.used == true
      errors.add(:code_used, "This access code has already been used")
    else
      current_code.used = true
      current_code.save
    end
  end

  validates_presence_of :name, :zip_code, :username, on: :update
  validates_format_of :zip_code, 
    with: /\A\d{5}-\d{4}|\A\d{5}\z/,
    message: "should be in the form 12345 or 12345-1234",
    on: :update
  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, on: :update

  # URL Helper #

  extend FriendlyId
  friendly_id :username


  ###########
  # SCOPING #
  ###########

  default_scope -> { order('created_at DESC') }

  #Only Show users that have been approved
  scope :approved,  -> { where(approved: true) }

  #Breaks!! the :with_name scope when impleneted
  scope :type_of_user_model, -> { where(:type_of_user == "Model") }

  scope :recently_updated, -> { unscoped.order('updated_at DESC') }

  ###########
  # Methods #
  ###########

  def user_photo_feed
    UserPhoto.where("user_id = ?", id)
  end

  def get_default_photo
    self.user_photos.find_by_id(default_photo_id)
  end

  def get_regular_photo
    self.user_photos.reject{|x| x.id == self.default_photo_id}.sort_by(&:created_at).reverse!.first(3)
  end

  def age
    dob = user_type.birth_date
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

end
