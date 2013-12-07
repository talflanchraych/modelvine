class AgenciesController < ApplicationController
	
	before_filter :authenticate_user!

	def edit
		@agency = Agency.find(params[:id])
	end

	def update
		agency = Agency.find(params[:id])
		if agency.update_attributes(agency_params)
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

	def agency_params
      params.require(:agency).permit(:bio, :website)
    end
end