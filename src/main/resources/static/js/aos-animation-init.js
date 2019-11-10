$(document).ready(function () {
    AOS.init({
        disable: 'phone',
        duration: 2000
    });
    var scrollRef = 0;
    window.addEventListener('scroll', function () {
        scrollRef <= 30 ? scrollRef++ : AOS.refresh();
    });
});
