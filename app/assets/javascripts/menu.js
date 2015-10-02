var position;

$('.jedzenie').click(function(){
	position = $(window).scrollTop();
	$('section:not(#custom_menu), nav, footer').hide();
	$('#custom_menu').fadeIn("slow");
});

$('.napoje').click(function(){
	position = $(window).scrollTop();
	$('section:not(#custom_drinks), nav, footer').hide();
	$('#custom_drinks').fadeIn("slow");
});

$(document).keyup(function(e){
	if (e.keyCode == 27){
		closeMenu();
	}
});

$('.close').click(function(){
	closeMenu();
});

$('.showDrinks').click(function(){
	$('#custom_menu').hide();
	$('#custom_drinks').fadeIn("slow");
});

$('.showMenu').click(function(){
	$('#custom_drinks').hide();
	$('#custom_menu').fadeIn("slow");
});

$(document).keyup(function(e) {
	if(e.keyCode == 27){
		closeMenu();
	}
});

function closeMenu(){
	$('section:not(#custom_menu, #custom_drinks), nav, footer').fadeIn("slow");
	$('#custom_menu, #custom_drinks').hide();
	$(window).scrollTop(position);
}