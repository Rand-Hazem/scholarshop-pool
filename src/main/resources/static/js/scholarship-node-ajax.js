
/**
 * Action for btn-wish, btn-remove which add/remove scholarship to wish list 
 */
function wishRemoveBtnAction() {
    $(".scholarship-node").on("click", ".btn-wish:not(.active)", function () {
        // Do add sh to wish list
        addScholarshipToWishList($(this));
    });

    $(".scholarship-node").on("click", ".btn-wish.active , .btn-remove", function () {
        // Do remove sh to wish list
        removeScholarshipFromWishList($(this));
    });
}


function addScholarshipToWishList(btnElement) {
    $(btnElement).prop("disabled", true);
    // Do send resonse

    // if success
    $(btnElement).addClass("active");
    
    // after json finnished
    $(btnElement).prop("disabled", false);
}



function removeScholarshipFromWishList(btnElement) {
    $(btnElement).prop("disabled", true);
    // Do send resonse


    // if success
    $(btnElement).removeClass("active");
    $(btnElement).prop("disabled", false);
    
    // after json finished
    removeScholarshipNodeFromView(btnElement);


}



/** 
 * if this action happend in wish-list page, remove node from view
 * note that in wish-list page the button has class btn-remove, but in other pages 
 * it has class btn-wish
 */
function removeScholarshipNodeFromView(btnElement) {
    if ($(btnElement).hasClass("btn-remove")) {
        $(btnElement).closest(".scholarship-node")
                .fadeOut(300, function () {
                    $(this).remove()
                });
    }
}




/* ------------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------------ */

/* ------------------------------------------------------------------------------------------------------------------ */


/**
 *
 * @param btnElement
 */
function deleteScholarshipAction(btnSelector, id, sucessCallback) {
    $.ajax({
            method: "DELETE",
            url: "/advertiser/scholarship/",
            data: {"id": id},
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton(btnSelector);
            },
            success: function () {
                sucessCallback(btnSelector);
            },
            complete: function (jqXHR, textStatus) {
                enableButton(btnSelector);
            }
        }
    );
}


function saveScholarshipAction(btnSelector, scholarshipId, sucessCallback) {
    $.ajax({
            method: "put",
            url: "/student/scholarship/save",
            data: {"id": scholarshipId},
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton(btnSelector);
            },
            success: function () {
                sucessCallback();
            },
            complete: function (jqXHR, textStatus) {
                enableButton(btnSelector);
            }
        }
    );
}
function unsaveScholarshipAction(btnSelector, scholarshipId, sucessCallback) {
    $.ajax({
            method: "put",
            url: "/student/scholarship/unsave",
            data: {"id": scholarshipId},
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton(btnSelector);
            },
            success: function () {
                sucessCallback();
            },
            complete: function (jqXHR, textStatus) {
                enableButton(btnSelector);
            }
        }
    );
}