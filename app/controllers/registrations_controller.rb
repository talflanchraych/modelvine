class RegistrationsController < Devise::RegistrationsController

	def create
    build_resource(sign_up_params)
    access_code = params[:access_code][:code]

    # Mostly copied from Devise::RegistrationsController#create
    if code = AccessCode.find_by_code(access_code)
    	unless code.used?
		    if resource.save
		      yield resource if block_given?
		      code.mark_as_used(resource)
		      if resource.active_for_authentication?
		        set_flash_message :notice, :signed_up if is_flashing_format?
		        sign_up(resource_name, resource)
		        respond_with resource, :location => after_sign_up_path_for(resource)
		      else
		        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
		        expire_data_after_sign_in!
		        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
		      end
		    else
		      clean_up_passwords resource
		      respond_with resource
		    end
		  else
		  	flash[:alert] = "Invite code already used."
				redirect_to :back
		  end
		else
			flash[:alert] = "Invite code does not exist."
			redirect_to :back
		end
  end
  
  protected

  #Redirect users to Settings page after initial login
  def after_sign_up_path_for(resource)
    edit_user_path(current_user)
  end

end