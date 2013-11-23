class UsersController < ApplicationController
  #Limit before filteres here
  before_filter :authenticate_user!, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    #Paginiate all the user with the default per page
    #@users= User.all.paginate(page: params[:page])
    @users = User.approved.paginate(page: params[:page])
  end

  ##Registation Contoller and Devise, handles singing up new users

  def show
  	@user = User.find(params[:id])
    @user_photos = @user.user_photos
    @user_type_attributes = @user.user_type.attributes.reject {|x| x.include?("_at") || x.include?("id") }
  end

  def edit
  end

  #Update a user
  def update
    @user = current_user
    if @user.update_without_password(user_params)
      # create a new model(talent) instance for current user
      user_type = @user.user_type || params[:user][:user_type_type].constantize.create
      @user.user_type = user_type
      @user.save
      flash[:success] = "Profile updated"
      #type = user_type.class.name.underscore
      #if current_user.user_type
      redirect_to edit_model_path(@user.user_type)
      #else
      #  redirect_to "/manage_photos"
      #end
    else
      render 'edit'
    end
  end

  def manage_photos
    if user_signed_in?
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
    user = User.find(params[:id])
    # if there is currently a default photo unset it
    if photo
      user.update_attributes(default_photo_id: photo.id)
    end
    # set the new default photo
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
      redirect_to(root_url) unless current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
