$(document).ready(function() {
  $(window).scroll(function () {
    if ($(window).scrollTop() > $(window).height() - $('nav').height() && $(window).width() > 900) {
      $('nav').addClass('navbar-fixed');
     $('#o_restauracji').addClass('add_margin_to_section');
    }
    if ($(window).scrollTop() < $(window).height() - $('nav').height() + 1) {
      $('nav').removeClass('navbar-fixed');
     $('#o_restauracji').removeClass('add_margin_to_section');
    }
  });
});

$('.menu_button').click(function() {
    $('nav').animate({
      left: "0px"
    }, 500);

    $('nav').css({
      display: "block"
      // position: "fixed"
    });
    $('body').animate({
      left: "285px"
    }, 500);
    $('.menu_button').animate({
      left: '-60px'
    });
    $.fn.animatescroll.defaults = {        
        easing:"swing",
        scrollSpeed:800,
        padding:0,
        element:"html,body"
    };
});

$('.close_nav').click(function() {
    $('nav').animate({
      left: "-285px"
    }, 500);
    $('nav').css({
      display: "none"
    });
    $('body').animate({
      left: "0px"
    }, 500);
    $('.navbar-fixed').css({
      left: "0px"
    });
    $('.menu_button').animate({
      left: '15px'
    });
});

$('li').click(function() {
  if($(window).width() <= 900){
      $('nav').animate({
        left: "-285px"
      }, 500);
      $('body').animate({
        left: "0px"
      }, 500);
      $('.menu_button').animate({
        left: '15px'
      });
  }else{
    $('nav').css({
        left: "0px"
      });
    $.fn.animatescroll.defaults = {        
        easing:"swing",
        scrollSpeed:800,
        padding:61,
        element:"html,body"
    };
  }
});
$(window).resize(function() {
  if($(window).width() > 900){
    $('nav').css({
        left: "0px"
      });
    $.fn.animatescroll.defaults = {        
        easing:"swing",
        scrollSpeed:800,
        padding:61,
        element:"html,body"
    };
  }else{
    $('nav').css({
        left: "-285px"
      });
    $.fn.animatescroll.defaults = {        
        easing:"swing",
        scrollSpeed:800,
        padding:0,
        element:"html,body"
    };
  }
});