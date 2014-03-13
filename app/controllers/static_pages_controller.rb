class StaticPagesController < ApplicationController
  def home
    @users = User.recently_updated.approved.paginate(page: params[:page])
    render "home",layout:"landingpage"
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
