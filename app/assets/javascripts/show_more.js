$(document).ready(function () {
    var numberOfClick = 0;
    $('.more_about_restaurant').hide()
    $('.show_more_about_restaurant').click(function () {
        $('.more_about_restaurant').slideToggle()
        if (numberOfClick % 2 == 0) {
            $('.show_more_about_restaurant').hide().text("Zwiń...").fadeIn(500);
        } else {
            $('.show_more_about_restaurant').hide().text("Rozwiń...").fadeIn(500);
        }
        numberOfClick++;
    })
});