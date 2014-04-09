# This is the master controller for all different types of users

class BaseUserTypeController < ApplicationController

  before_filter :authenticate_user!

  def edit
    # Whenever we need to set @model, we use the folling line to create it
    instance_variable_set("@#{params[:controller].singularize}".to_sym, current_user.user_type)
    @user_photo = current_user.user_photos.build
    @user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])
  end

  def update
    # Create a new variable for the base user = find the current user as in Model.find or Business.find
    ## Notice that Model and Business are capitalized
    @base_user_type = current_user.user_type
    instance_variable_set("@#{params[:controller].singularize}".to_sym, @base_user_type)
    # instance_variable_set(:@)
    #Find the user_photo and user_photo_feed instances
    @user_photo = current_user.user_photos.build
    @user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])

    ##Update based on strong parameters in the controller actions
    if @base_user_type.update_attributes(user_type_params)
      redirect_to current_user
    else
      render 'edit'
    end 
  end

  def index
    ## Second part here finds for example: Model.all
    @base_user_types = current_user.user_type.constantize.all
  end

end