# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	container = document.querySelector('.photo-grid')
	imgLoad = imagesLoaded( container )
	imgLoad.on "done", (instance) ->
	  for image in instance.images
	  	height = image.img.height
	  	$(image.img).parent().height(height)
	  msnry = new Masonry(container,
	    columnWidth: 300
	    itemSelector: ".photo-brick"
	    gutter: 1
	  )
	  return