function setMaxCharacterForParagraph(selector, maxLength) {
    $(selector).each(function (f) {
        length = $(this).text().length;
        if (length > maxLength) {
            $(this).text($(this).text().substring(0, maxLength) + "...");
        }
    });
}


/**
 * Reomve node from view
 * @param selector btn-delete
 */
function deleteSuceessCallback(selector) {
    $(selector).parents(".adverted-scholarship-node").remove();
}

function setDeleteScholarshipAction() {
    $(".adverted-scholarship-node .dropdown-menu").on("click", ".delete-sh", function () {
        var btn = $(this);
        var id = $(this).data("id");
        swal({
            title: "Are you sure!",
            text: "You want to delete this scholarship",
            icon: "warning",
            dangerMode: true,
            buttons: ["No", "Yes"]
        }).then((value) => {
            if (value) {
                deleteScholarshipAction(btn, id, deleteSuceessCallback);
            }
        });

    });
}


$(document).ready(function () {
    setMaxCharacterForParagraph($(".adverted-scholarship-node .title"), 30);
    setDeleteScholarshipAction();
});