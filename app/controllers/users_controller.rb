class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :invite]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.friendly.find(params[:id])
    @user_photos = @user.user_photos
    @user_type_attributes = @user.user_type.attributes.reject {|x| x.include?("_at") || x.include?("id") }
    @model = ModelDecorator.decorate(@user.user_type)
  end

  def conversation
    @user = User.friendly.where("users.id != ?", current_user.id).find(params[:id])
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update_without_password(user_params)
      # create a new model(talent) instance for current user
      user_type = @user.user_type || params[:user][:user_type_type].constantize.create
      @user.user_type = user_type
      @user.save
      flash[:success] = "Profile updated"
      redirect_to send("edit_#{params[:user][:user_type_type].underscore}_path", @user.user_type)
    else
      render 'edit'
    end
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def invite
    @access_codes = AccessCodeDecorator.decorate_collection(current_user.access_codes)
  end

  # Don't let users create their own access codes. 
  # def generate_invites
  #   number_of_invites = params[:number_of_invites][:number_of_invites].to_i
  #   number_of_invites.times do
  #     current_user.access_codes << AccessCode.create
  #   end
  #   redirect_to invite_users_path(current_user)
  # end

  def search
    user_type = params[:search][:user_type]
    zip_code = params[:search][:zip_code]
    if user_type == "All"
      @users = User.approved
    else
      @users = user_type.constantize.all.collect{|x| x.user}.approved
    end
    if zip_code.blank?
      @users = @users.paginate(:page => 1)
    else
      @users = @users.reject{|x| x.zip_code != zip_code }.paginate(:page => 1)
    end
    render 'index'
  end

  def manage_photos
    if user_signed_in?
      @user_photo = current_user.user_photos.build
      @user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])
    end
  end

  def set_default_photo
    # find the photo to be updated as default
    photo = UserPhoto.find(params[:photo_id])
    user = User.find(params[:id])
    # if there is currently a default photo unset it
    if photo
      user.update_attributes(default_photo_id: photo.id)
    end
    render text: "Default photo set successfully"
  end


  private

    #Rails 4.0 Strong Paramaters
    def user_params
      params.require(:user).permit(:name, :email, :code_used, :password,
                                   :password_confirmation, :zip_code, :username,
                                   :type_of_user, :user_website)
    end

    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless current_user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
