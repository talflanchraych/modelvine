class PhotographersController < ApplicationController
	def edit
		binding.pry
		@photographer = Photographer.find(params[:id])
	end

	def update
		photographer = Photographer.find(params[:id])
		if photographer.update_attributes(photographer_params)
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

	def photographer_params
      params.require(:photographer).permit(:model_mayhem_url, :bio, :website)
    end
end