
function dropdownMoreItemDifferentView() {
    selector = $(".student-navbar #dropdownMoreItem");
    // add bootsrtap dropdown list class
    if ($(window).width() >= 992) {
        $(selector).addClass("dropdown-menu dropdown-menu-right");
        $(selector).find("li a").each(function(){
            $(this).addClass("dropdown-item").removeClass("nav-link");
        });
    } else {
        $(selector).removeClass("dropdown-menu dropdown-menu-right");
          $(selector).find("li a").each(function(){
            $(this).removeClass("dropdown-item").addClass("nav-link");
        });
    }
}

$(document).ready(function () {
    dropdownMoreItemDifferentView();
});


$(window).resize(function () {
    dropdownMoreItemDifferentView();
});