$('#menu .wrapper div figure').hover(function(){
	$(this).children("img").addClass("figcaption_hover");
	$(this).children("figcaption").addClass("figcaption_hover");
}, function() {
	$(this).children("img").removeClass("figcaption_hover");
	$(this).children("figcaption").removeClass("figcaption_hover");
});