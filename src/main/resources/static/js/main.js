
/**
 * 
 * @param {string} value one of display probarity values block, inline, none ..etc
 * @param {type} selectors elemnt selector. valid for selector that return ine element 
 */
function setDisplay(value, ...selectors) {
    for (var selector of selectors) {
        $(selector).css({"display": value});
    }
}

/**
 * This func check if the element in view or not
 * @param {type} selector
 */
function  isInViewPort(selector) {
    var element = $(selector);
    var top = element.offset().top;
    var bottom = top + element.height();

    return (top >= $(window).scrollTop()) //|| (top >= $(window).scrollTop()+(element.height()/3)) 
            || (bottom >= $(window).scrollTop() + $(window).height());
}


/**
 * when hover it set animation(class) to the image inside the btn
 * when mouseup it remove that class
 * @returns non
 */
function setEventHoverToTopScrollTopBtn() {
    $("#footerScrollUpBtn").hover(
            function () {
                $(this).children("img").addClass("shake-horizontal");
            },
            function () {
                $(this).children("img").removeClass("shake-horizontal");
            });
}
/**
 * scroll to the top if the page
 */
function setEventClickToTopScrollTopBtn(){
    $("#footerScrollUpBtn").on("click", function(){
      $("body, html").animate({scrollTop:0}, 800) ;
    });
}


$(document).on("scroll", function () {
    // make main navbar fixed top
    var headerTop = $("#mainTopHeader").height();
    var scrollTop = $(document).scrollTop();
    var navbar = $("#mainNavbar");
    if (scrollTop >= headerTop) {
        $(navbar).attr("style", "top : 0px !important").fadeIn("sllow");
        $(navbar).addClass("navbar-onscroll-style");
    } else {
        $(navbar).attr("style", "top :" + (headerTop - scrollTop) + "px !important").fadeIn("sllow");
        $(navbar).removeClass("navbar-onscroll-style");
    }

    // display of remove welcome text in slider background if it is in the viewport
    if (isInViewPort("#slider")) {
        setDisplay("block", "#mainWelcomTextHeading", "#subWelcomTextHeading");
    } else {
        setDisplay("none", "#mainWelcomTextHeading", "#subWelcomTextHeading");
    }


});


$(window).on("load", function () {
    if ($(document).scrollTop() >= $("#mainTopHeader").height()) {
        $("#mainNavbar").css("style", "top: 0px !important;");
    }

    // Edit text in wecome heading > make it shorter
    if (!window.matchMedia('(min-width:991px)').matches) {
        $("#subWelcomTextHeading").text("“Don’t wait until everything is just right. Get started now“");
    }
});

function loginRequest(){
    if($('.login-model').data('open') == true){
        $('#btnLoginAnchor').click();
    }
}

function submitLogin(){
    $("#logInBtn").on("click", function () {
        $("#loginForm").submit();
    });
}

$(document).ready(function () {
    setDisplay("block", "#mainWelcomTextHeading", "#subWelcomTextHeading");
    setEventHoverToTopScrollTopBtn();
    setEventClickToTopScrollTopBtn();
    loginRequest();
    submitLogin();

});