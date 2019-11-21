function likeStoryAction() {
    //toggle like button
    $('.button-like').on('click', function (event) {
        var isLiked = $(this).hasClass("liked");
        var ajaxUrl = isLiked ? "/story/unlike" : "/story/like";


        $.ajax({
                method: "put",
                url: ajaxUrl,
                dataType: "json",
                contentType: 'application/json',
                data: {"storyId": $("input[name='storyId']").val()},
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton("#personalTab #save");
                },
                success: function (data) {
                    showAlert(true, "#personalTab", data);
                    console.log(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    showAlert(false, "#personalTab", "fail to update, invalid data");
                },
                complete: function (jqXHR, textStatus) {
                    enableButton("#personalTab #save");
                }
            }
        );

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
