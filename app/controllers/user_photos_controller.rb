class UserPhotosController < ApplicationController
	# See signed_in_user method in the helpers/sessions controller
	before_action :signed_in_user, only: [:create, :destroy]
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
		@user_photo = current_user.user_photos.build(user_photo_params)
		if @user_photo.save
			flash[:success] = "Photo Caption successfully added!"
			# Since the User is logged in, the Root URL is changed
			redirect_to root_url
		else
			@feed_items = []
			render action: "new"
		end
	end

	# DELETE /user_photos/1
	def destroy
		@user_photo.destroy
		redirect_to root_url
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
