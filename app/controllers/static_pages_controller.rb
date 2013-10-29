class StaticPagesController < ApplicationController
  def home
  	if signed_in?
	  	# Allow users to add photo's if they are logged in, through the home page. 
	  	# This logic should really be moved somewhere else
	  	@user_photo = current_user.user_photos.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def developer
  end

end
