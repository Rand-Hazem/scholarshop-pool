

function likeStoryAction() {
    //toggle like button
    $('.button-like').on('click', function (event) {

        // send json request

        // if request sucess, do toogle
        $(this).toggleClass("liked");
    });
}


function starMouseAction() {
    $('#stars li').on('mouseover', function () {
        // The star currently mouse on
        var onStar = parseInt($(this).data('value'), 10);

        // Now highlight all the stars before the current hovered star
        $(this).parent().children('li.star').each(function (e) {
            if (e < onStar) {
                $(this).addClass('hover');
            } else {
                $(this).removeClass('hover');
            }
        });

    }).on('mouseout', function () {
        $(this).parent().children('li.star').each(function (e) {
            $(this).removeClass('hover');
        });
    });
}


function rateAction() {
    $('#stars li').on('click', function () {
        // The star currently selected
        var onStar = parseInt($(this).data('value'), 10);
        var stars = $(this).parent().children('li.star');

        // send json request

        // if response success do 
        for (i = 0; i < stars.length; i++) {
            $(stars[i]).removeClass('selected');
        }
        for (i = 0; i < onStar; i++) {
            $(stars[i]).addClass('selected');
        }
        
    });
}


$(document).ready(function () {

    likeStoryAction();
    starMouseAction();
    rateAction();

});
