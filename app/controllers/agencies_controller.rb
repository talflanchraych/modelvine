class AgenciesController < BaseUserTypeController
	
	# before_filter :authenticate_user!

	# def edit
	# 	@agency = Agency.find(params[:id])
	# end

	# def update
	# 	agency = Agency.find(params[:id])
	# 	#Find the user_photo and user_photo_feed instances
	# 	@user_photo = current_user.user_photos.build
	# 	@user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])
		
	# 	if agency.update_attributes(agency_params)
	# 		if current_user.approved == false
	# 			redirect_to waitlist_path 
	# 		else
	# 			redirect_to current_user
	# 		end
	# 	else
	# 		render 'edit'
	# 	end 
	# end

	private

	## The parameters are set from teh base_user_type controller
	def user_type_params
      params.require(:agency).permit(:bio, :website)
    end
end