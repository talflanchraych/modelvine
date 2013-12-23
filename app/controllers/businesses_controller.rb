class BusinessesController < BaseUserTypeController
  
  # before_filter :authenticate_user!

  # def edit
  #   @business = Business.find(params[:id])
  # end

  # def update
  #   business = Business.find(params[:id])
  #   #Find the user_photo and user_photo_feed instances
  #   @user_photo = current_user.user_photos.build
  #   @user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])

  #   if business.update_attributes(business_params)
  #     if current_user.approved == false
  #       redirect_to waitlist_path 
  #     else
  #       redirect_to current_user
  #     end
  #   else
  #     render 'edit'
  #   end 
  # end

  private

  ## The parameters are set from teh base_user_type controller
  def user_type_params
      params.require(:business).permit(:bio, :website)
    end
end