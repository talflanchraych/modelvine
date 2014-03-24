# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	# Bind the change event on radio buttons(with set_default_photo class)
	$('.set_default_photo').bind
	# when event triggered, execute setDefaultPhoto function
  	change: setDefaultPhoto

  	setDefaultPhoto= ->
  		$('.notice').html("")
  		# do a ajax post to url /users/1/set_default_photo with params[:photo_id]
  		# get user id from li data-user-id=1 on _feed_item view
	  	$.post '/users/' + $(this).closest('li').data('user-id')+ '/set_default_photo/',
	  		photo_id: $(this).closest('li').attr('id')
	  		# on success return a messgae
	  		(data) -> $('.notice').html "Sucessfully set as default photo"