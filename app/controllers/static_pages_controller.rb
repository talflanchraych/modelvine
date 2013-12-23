class StaticPagesController < ApplicationController
  def home
    @users = User.approved.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def developer
  end

  def waitlist
  end

end
