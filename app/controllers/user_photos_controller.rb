class UserPhotosController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	#Signed in users can create or destory photo's
	#Anyone is allow to index (list all) of the photo's

	# GET /user_photos
	def index
		@user_photo = UserPhoto.all
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
		# Create a instance of photos, fidn the current user and build a new photo
		# build the user_photo with params without default_photo value
		@user_photo = current_user.user_photos.build(user_photo_params)
		
		if @user_photo.save
			current_user.touch
			# if the photo was saved successfully and user does want to set it as default
			if params[:default_photo] == "1" || current_user.user_photos.size == 1
				current_user.update_attributes(default_photo_id: @user_photo.id)
			end
			flash[:success] = "Photo successfully added!"
			# This needs to be updated to reflect Asset PipeLine
			redirect_to :back
		else
			@user_photo_feed_items = []
			flash[:alert] = "Photo not added!"
			# render action: "new"
			redirect_to :back
		end
	end

	# DELETE /user_photos/1
	def destroy
		@user_photo.destroy
		#redirec to the current page
		redirect_to :back
	end


	private

		# STRONG PARAMATERS, Rails 4; This allows the database colum caption to be uploaded through the web
		# This is the replacement for attribute assesible in Rails 3.2 
		def user_photo_params
			params.require(:user_photo).permit(:caption, :photo)
		end

		# Relates to the destroy action 
		def correct_user
			@user_photo = current_user.user_photos.find_by(id: params[:id])
			redirect_to root_url if @user_photo.nil?
		end
end
