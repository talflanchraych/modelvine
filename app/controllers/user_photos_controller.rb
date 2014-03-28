class UserPhotosController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	#Signed in users can create or destory photo's
	#Anyone is allow to index (list all) of the photo's

	# GET /user_photos
	def index
		@user_photos = UserPhoto.all
	end

	def show
		@user_photo = UserPhoto.find(params[:id])
	end

	# GET /user_photos_new
	## This method isn't always needed, bevause the create method uses the build method
	def new
		@user_photo = UserPhoto.new
	end

	# POST /user_photos
	def create
		@user_photo = current_user.user_photos.build(user_photo_params)
		
		if @user_photo.save
			#Write the name of the file to the screen
			current_user.touch
			if params[:default_photo] == "1" || current_user.user_photos.size == 1
				current_user.update_attributes(default_photo_id: @user_photo.id)
			end
			flash[:success] = "Photo successfully added!"
			redirect_to edit_model_path(current_user)
		else
			@user_photo_feed_items = []
			flash[:alert] = "Photo not added!"
			redirect_to edit_model_path(current_user)
		end
	end

	# DELETE /user_photos/1
	def destroy
		@user_photo.destroy
		redirect_to edit_model_path(current_user)
	end


	private

		def user_photo_params
			params.require(:user_photo).permit(:caption, :photo, :photo_width, :photo_height)
		end

		# Relates to the destroy action 
		def correct_user
			@user_photo = current_user.user_photos.find_by(id: params[:id])
			redirect_to root_url if @user_photo.nil?
		end
end
