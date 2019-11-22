/**
 * this for like story in stories.jsp page, it differ from like story in view-story.jsp page
 */
function likeStoryNodeAction() {
    $('.story-node .like').click(function () {

        // send json request

        // if json response success, update view
        $(this).toggleClass("liked")
        $(this).find("i").toggleClass("fa-thumbs-up fa-thumbs-o-up");
        var likeCountSpan = $(this).find("span.likes-count");
        var state = $(this).hasClass("liked") ? 1 : -1
        var likeCount = parseInt($(likeCountSpan).text(), 0) + state;
        $(likeCountSpan).text(likeCount);
    });
}

function ajaxDeleteStory(btnID) {
    // get the story node
    var storyNode = $(btnID).parents(".story-node");

    // send json request & update these variable
    var msg = "story deleted successfully"; // something went wrong, try agin
    var resClass = "text-success"; // text-danger


    // if ajsax success, update view
    var msg = $(
        "<div class='alert alert-dismissible fade show w-75 mx-auto " + resClass + "'>" +
        "<strong>Success!</strong> " + msg +
        "</div>")
        .fadeTo(2000, 500).slideUp(1000, function () {
            $(this).remove();
        });
    $(storyNode).replaceWith(msg);
}


function deletStoryAction() {
    $('.story-node .dropdown .dropdown-item[data-option-name="deleteStory"]').on("click", function (event) {
        event.preventDefault();
        swal({
            title: "Are you sure!",
            text: "You want to cancel registration",
            icon: "warning",
            dangerMode: true,
            buttons: ["No", "Yes"]
        }).then((value) => {
            if (value) {
                ajaxDeleteStory($(this));
            }
        });

    });
}

function saveStoryAction() {
    $('.story-node .dropdown .dropdown-item[data-option-name="saveStory"]').on("click", function (event) {
        event.preventDefault();

    });
}

function reportStoryAction(btnSendSelector, formId, errorCallBack, successCallBack) {
        $.ajax({
                method: "post",
                url: "/story/report",
                data: $(formId).serialize(),
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton(btnSendSelector);
                },
                success: function () {
                    successCallBack();

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    errorCallBack();
                },
                complete: function (jqXHR, textStatus) {
                    enableButton(btnSendSelector);
                }
            }
        );
}

$(document).ready(function () {
    likeStoryNodeAction();
    deletStoryAction();
    saveStoryAction();

});

