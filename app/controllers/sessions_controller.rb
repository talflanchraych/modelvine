class SessionsController < ApplicationController
	#Used to create a new session

  def new
	end

  #log IN
	def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	# Check if correct user
    if user && user.authenticate(params[:session][:password])
    	sign_in user
      # Friendly forwarding, so users know where they are going
    	redirect_back_or user
  	else
    	flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'  	
    end
	end

	def destroy
    sign_out
    redirect_to root_url
  end
end
