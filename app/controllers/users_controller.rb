class UsersController < ApplicationController
  #Limit before filteres here
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    #Paginiate all the user with the default per page
    @users = User.with_name.paginate(page: params[:page])
  end

  #create a new user, but not save
  def new
  	@user = User.new
  end

  #Save to new user
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
    	flash[:success] = "Welcome to Model Vine!"
      redirect_to edit_user_path(current_user)
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
    @user_photos = @user.user_photos
  end

  def edit
  end

  #Update a user
  def update
    # Allows update of user without re-entering a password
    params[:user].delete(:password) if params[:user][:password].blank?
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to "/manage_photos"
    else
      render 'edit'
    end
  end

  def manage_photos
    if signed_in?
      # Allow users to add photo's if they are logged in, through the home page. 
      # This action may need to be moved to another controller
      @user_photo = current_user.user_photos.build
      @user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])
    end
  end

  #Admin users are the only one's who can do this
  #Create admin users through heroku console
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def set_default_photo
    # find the photo to be updated as default
    photo = UserPhoto.find(params[:photo_id])
    # if there is currently a default photo unset it
    if photo.user.get_default_photo
      photo.user.get_default_photo.update_attributes(default_photo: false)
    end
    # set the new default photo
    photo.update_attributes(default_photo: true)
    render text: "Default photo set successfully"
  end

  private

    #Rails 4.0 Strong Paramaters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :zip_code, :type_of_user, :user_website)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
