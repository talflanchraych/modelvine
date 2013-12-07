class BusinessesController < ApplicationController
  
  before_filter :authenticate_user!

  def edit
    @business = Business.find(params[:id])
  end

  def update
    business = Business.find(params[:id])
    if business.update_attributes(business_params)
      if current_user.approved == false
        redirect_to waitlist_path 
      else
        redirect_to current_user
      end
    else
      render 'edit'
    end 
  end


  private

  def business_params
      params.require(:business).permit(:bio, :website)
    end
end