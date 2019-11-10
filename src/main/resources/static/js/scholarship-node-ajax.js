
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


$(document).ready(function () {
    wishRemoveBtnAction();

});