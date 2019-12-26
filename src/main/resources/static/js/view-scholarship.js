
function saveOpportunity() {
    $('.save-opportunity').on('click', function (event) {
        var doSave = $(this).hasClass("save-opportunity-red");
        var url = doSave ? "/student/scholarship/save" : "/student/scholarship/unsave";
        var btnSelector = $(this);

        $.ajax({
                method: "put",
                url: url,
                data: {"id": $(btnSelector).data("scholarship-id")},
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton(btnSelector);
                },
                success: function () {
                    $(this).toggleClass("save-opportunity-red");
                },
                complete: function (jqXHR, textStatus) {
                    enableButton(btnSelector);
                }
            }
        );
    });
}

$(document).ready(function () {
    saveOpportunity();
});
