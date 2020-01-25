function saveOpportunity() {
    $('.save-opportunity').on('click', function (event) {
        var doUnsave = $(this).hasClass("save-opportunity-red");
        var url = doUnsave ? "/student/scholarship/save" : "/student/scholarship/unsave";
        var btnSelector = $(this);

        var tooggleSave = function () {
            $(btnSelector).toggleClass("save-opportunity-red");
        };
        console.log("clicked")
        if (doUnsave) {
            console.log("unsave"+ $(btnSelector).data("scholarship-id"))
            unsaveScholarshipAction(btnSelector, $(btnSelector).data("scholarship-id"), tooggleSave);
        } else {
            console.log("save"+ $(btnSelector).data("scholarship-id"))
            saveScholarshipAction(btnSelector, $(btnSelector).data("scholarship-id"), tooggleSave);
        }
    });
}

$(document).ready(function () {
    saveOpportunity();
});
