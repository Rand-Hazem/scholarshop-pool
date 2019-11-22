function showUserCard() {
    $(".user-card").hover(function () {
            $(".user-details").stop(true, true).fadeIn();
        }
        , function () {
            $(".user-details").stop(true, true).fadeOut();
        });
}

function autocompleteSearch() {
    var searchBy = ["ahmad", "basem", "khaled"];
    //This part will be changed when we build Database 

    $('#searchAutocomplete').autocomplete({
        lookup: searchBy
    });
}


$(document).ready(function () {
    autocompleteSearch();
    showUserCard();
});
