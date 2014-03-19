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


end
