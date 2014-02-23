# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	wall = new freewall(".grid")
	wall.reset
	  selector: ".brick"
	  animate: true
	  cellW: "100"
	  cellH: "auto"
	  gutterX: 0
	  gutterY: 0
	  onResize: ->
	    wall.fitWidth()
	    return
	setTimeout (->
	  wall.fitWidth()
	  return
	), 500