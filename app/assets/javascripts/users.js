// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// <div class="cell" style="width: 188.57px; height: 188.57px; 
// background-image: url(http://vnjs.net/www/project/freewall/example/i/photo/49.jpg); 
// position: absolute; opacity: 1; top: 1221.43px; left: 1221.43px;
//  -webkit-transition: top 0.5s, left 0.5s, width 0.5s, height 0.5s, opacity 0.5s;
//   transition: top 0.5s, left 0.5s, width 0.5s, height 0.5s, opacity 0.5s;"
//    data-delay="49" data-height="200" data-width="200" data-state="move" id="49-2"></div>

// var temp = "<div class='brick' style='width:{width}px; height: {height}px; background-image: '<%= image_tag user_photo.photo.url (:medium) %>'></div>";
// var w = 1, html = '', limitItem = 49;
// for (var i = 0; i < limitItem; ++i) {
// 	w = 200 +  200 * Math.random() << 0;
// 	html += temp.replace(/\{height\}/g, 200).replace(/\{width\}/g, w).replace("{index}", i + 1);
// }

// $(".grid").html(html);

// var wall = new freewall(".grid");
// wall.reset({
// 	selector: '.brick',
// 	animate: true,
// 	cellW: 20,
// 	cellH: 200,
// 	onResize: function() {
// 		wall.fitWidth();
// 	}
// });
// wall.fitWidth();
// // for scroll bar appear;
// $(window).trigger("resize");



// # $(document).ready ->
// # 	wall = new freewall(".grid")
// # 	wall.reset
// # 	  selector: ".brick"
// # 	  animate: true
// # 	  cellW: "100"
// # 	  cellH: "auto"
// # 	  gutterX: 0
// # 	  gutterY: 0
// # 	  onResize: ->
// # 	    wall.fitWidth()
// # 	    return
// # 	setTimeout (->
// # 	  wall.fitWidth()
// # 	  return
// # 	), 500


 // http://vnjs.net/www/project/freewall/