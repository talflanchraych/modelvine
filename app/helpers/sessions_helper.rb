module SessionsHelper

  def current_user?(user)
    user == current_user
  end

  #Friendly forwarding
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #User with Friendly forwarding
  def store_location
    session[:return_to] = request.url if request.get?
  end


  ##Lots of old Code here from Pre Devise
	
 # def sign_in(user)
 #    remember_token = User.new_remember_token
 #    cookies.permanent[:remember_token] = remember_token
 #    user.update_attribute(:remember_token, User.encrypt(remember_token))
 #    self.current_user = user
 #  end

  #check if user is signed in
  # def signed_in?
  #   !current_user.nil?
  # end

  #find the current user
  # def current_user=(user)
  #   @current_user = user
  # end

  # def current_user
  #   remember_token = User.encrypt(cookies[:remember_token])
  #   @current_user ||= User.find_by(remember_token: remember_token)
  # end



  # before Filter to check if User is signed in
  # def signed_in_user
  #   unless signed_in?
  #     store_location
  #     redirect_to signin_url, notice: "Please sign in."
  #   end
  # end


  # def sign_out
  #   self.current_user = nil
  #   cookies.delete(:remember_token)
  # end

end
