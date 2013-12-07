class MakeupArtistsController < ApplicationController
	def edit
		@makeup_artist = MakeupArtist.find(params[:id])
	end

	def update
		makeup_artist = MakeupArtist.find(params[:id])
		if makeup_artist.update_attributes(makeup_artist_params)
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

	def makeup_artist_params
      params.require(:makeup_artist).permit(:model_mayhem, :bio, :website)
    end
end