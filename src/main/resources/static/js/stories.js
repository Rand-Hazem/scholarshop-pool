
function autocompleteSearch() {
    var searchBy = ["ahmad", "basem", "khaled"];
    //This part will be changed when we build Database 

    $('#searchAutocomplete').autocomplete({
        lookup: searchBy
    });
}

$(document).ready(function () {
    autocompleteSearch();
});
