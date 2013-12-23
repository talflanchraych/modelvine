class ModelsController < BaseUserTypeController

	# before_filter :authenticate_user!

	# def edit
	# 	@model = current_user.user_type
	# 	@user_photo = current_user.user_photos.build
 #    @user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])
	# end

	# def update
	# 	@model = Model.find(params[:id])
	# 	#Find the user_photo and user_photo_feed instances
	# 	@user_photo = current_user.user_photos.build
	# 	@user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])

	# 	##PLEASE COMMENT - What are these if else statements doing
	# 	if @model.update_attributes(model_params)
	# 		if current_user.approved == false
	# 			redirect_to waitlist_path 
	# 		else
	# 			redirect_to current_user
	# 		end
	# 	else
	# 		render 'edit'
	# 	end 
	# end

	# def index
	# 	@models = Model.all
	# end

	private

	## The parameters are set from teh base_user_type controller
	def user_type_params
      params.require(:model).permit(:birth_date, :gender, :height, :bio,
                                   :weight, :ethnicity, :eye_color, :hair_color)
  end
end
