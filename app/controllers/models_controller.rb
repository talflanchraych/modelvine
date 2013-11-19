class ModelsController < ApplicationController

	before_filter :authenticate_user!

	def edit
		@model = Model.find(params[:id])
		@user_photo = current_user.user_photos.build
    	@user_photo_feed_items = current_user.user_photo_feed.paginate(page: params[:page])
	end

	def update
		model = Model.find(params[:id])

		if model.update_attributes(model_params)
			if current_user.approved == false
				redirect_to waitlist_path 
			else
				redirect_to current_user
			end
		else
			render 'edit'
		end 
	end

	def index
		@models = Model.all
	end

	private
	def model_params
      params.require(:model).permit(:birth_date, :gender, :height, :bio,
                                   :weight, :ethnicity, :eye_color, :hair_color)
    end
end
