class UserPhotosController < ApplicationController
	# See signed_in_user method in the helpers/sessions controller
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
		#Signed in users can create or destory photo's
		#Anyone is allow to index (list all) of the photo's

	def index
	end

	def create
		# Create a instance of photos, fidn the current user and build a new photo
		@user_photo = current_user.user_photos.build(user_photo_params)
		if @user_photo.save
			flash[:success] = "Photo Caption successfully added!"
			# Since the User is logged in, the Root URL is changed
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@user_photo.destroy
		redirect_to root_url
	end

	private

		# STRONG PARAMATERS, Rails 4; This allows the database colum caption to be uploaded through the web
		# This is the replacement for attribute assesible in Rails 3.2 
		def user_photo_params
			params.require(:user_photo).permit(:caption)
		end

		# Relates to the destroy action 
		def correct_user
			@user_photo = current_user.user_photo.find_by(id: params[:id])
			redirect_to root_url if @user_photo.nil?
		end
end
