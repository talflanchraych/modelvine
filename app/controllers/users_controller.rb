class UsersController < ApplicationController
  #Limit before filteres here
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
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
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
    #Paginiate all the user with the default per page
    @users = User.paginate(page: params[:page])
  end

  def edit
  end

  #Update a user
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #Admin users are the only one's who can do this
  #Create admin users through heroku console
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
