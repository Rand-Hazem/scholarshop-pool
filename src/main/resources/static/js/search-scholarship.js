
function sidebarToggleFunc() {
    $('#sidebarToggleBtn').on('click', function () {
        var wrapper = $('#wrapper');
        $(wrapper).toggleClass('sidebar-toggle');
        $("body").toggleClass("noscroll");
        if ($(wrapper).hasClass('sidebar-toggle')) {
            $(wrapper).css('z-index', '10');
        }else{
            $(wrapper).css('z-index', '0');
        }
    });
}

function openList() {
    $('.list-link, .list-sub-link').on('click', function () {
        $(this).toggleClass('active');
        $(this).next('.list-hidden').slideToggle('slow');
    });
}
$(document).ready(function () {
    sidebarToggleFunc();
    openList();

});
