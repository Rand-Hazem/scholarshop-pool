
function saveOpportunity() {
    $('.save-opportunity').on('click', function (event) {
        $(this).toggleClass("save-opportunity-red");
    });
}

$(document).ready(function () {
    saveOpportunity();
});
