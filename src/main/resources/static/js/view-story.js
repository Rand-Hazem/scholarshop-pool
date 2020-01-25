function setLikeStoryAction() {

    var btnLike = $('button.button-like');
    var successCallbackFun = function () {
        $(btnLike).toggleClass("liked");
    };

    $(btnLike).on('click', function (event) {
        likeStoryAction($(this), $("input[name='storyId']").val(), successCallbackFun);
    });
}

function starMouseAction() {
    $('#stars li').on('mouseover', function () {
        // The star currently mouse on
        var onStar = parseInt($(this).data('value'));
        console.log(onStar);

        // Now highlight all the stars before the current hovered star
        $(this).parent().children('li.star').each(function (index, value) {
            if (onStar > index) {
                $(this).addClass('hover');
            } else {
                $(this).removeClass('hover');
            }
        });

    }).on('mouseout', function () {
        $(this).parent().children('li.star:not(.selected)').each(function (e) {
            $(this).removeClass('hover');
        });
    });
}


function rateAction() {
    $('#stars li').on('click', function () {
        // The star currently selected
        var value = parseInt($(this).data('value'));
        var stars = $(this).parent().children('li.star');
        var ajaxData = {
            "storyId": $("input[name='storyId']").val(),
            "rateValue": value
        };

        // send json request
        $.ajax({
                method: "put",
                url: "/story/rate",
                data: ajaxData,
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton("#stars li");
                },
                success: function () {
                    for (i = 0; i < stars.length; i++) {
                        if (i + 1 <= value) {
                            $(stars[i]).addClass('selected');
                        } else {
                            $(stars[i]).removeClass('selected');
                        }
                    }
                },
                complete: function (jqXHR, textStatus) {
                    enableButton("#stars li");
                }
            }
        );
    });
}

function setReportStoryAction() {

    var msgBox = $("#reportModal #reportResponseMsgDiv");
    var errorCallbackFun = function () {
        $(msgBox).removeClass("d-none alert-success");
        $(msgBox).text("falid to send report, please try agin");
        $(msgBox).addClass(" alert-danger").show("slow").delay(5000).hide("slow");
    }

    var successCallbackFun = function () {
        $(msgBox).removeClass("d-none alert-danger");
        $(msgBox).text("report send successfully, we will progress it, thank you");
        $(msgBox).addClass(" alert-success").show("slow").delay(5000).hide("slow");
    }

    $("#reportModal #btnSave").on("click", function () {
        reportStoryAction($(this), "#reportModal #reportForm", errorCallbackFun, successCallbackFun);
    });
}

function setDeleteStoryAction() {

    var deleteBtn = $("#mainDropDownMenu #deleteStory");
    if ($(deleteBtn).length < 1) {
        return;
    }
    var successCallbackFun = function (location) {
        window.location = location;
    };

    var errorCallbackFun = function () {
        // nothing to do, stay in the same page
    };
    deletStoryAction(deleteBtn, $("input[name='storyId']").val(), successCallbackFun, errorCallbackFun);
}


$(document).ready(function () {

    starMouseAction();
    rateAction();
    // these function in story-ajax.js file
    setLikeStoryAction();
    setReportStoryAction();
    setDeleteStoryAction();
});
