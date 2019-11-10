

function sidebarVisibility() {
//    if ($(window).width() >= 768) {
//        $("#wrapper").addClass("toggled");
//        $("#btnMenuToggle").hide();
//    } else {
//        $("#wrapper").removeClass("toggled");
//        $("#btnMenuToggle").show();
//    }
}

function sidebarToggleEvent() {
    $("#btnMenuToggle").click(function (e) {
        e.preventDefault();
        $(this).toggleClass("rotatex-180-pos");
        $("#wrapper").toggleClass("toggled");
    });
}

/**
 * 
 * @param {boolean} visible
 */
function setNoContentVisibility(visible){
    if(visible){
        $(".students-section #no-content").show();
    }else{
       $(".students-section #no-content").hide(); 
    }
}


function setMaxCharacterForParagraph(selector, maxLength){
    $(selector).each(function(f){
       length = $(this).text().length;
       if(length > maxLength){
           $(this).text($(this).text().substring(0, maxLength)+"..."); 
       }
    });
}

/* ------------------------------------------------------------------------------------------ */
$(document).ready(function () {
//    sidebarVisibility();
    sidebarToggleEvent();
//    $(".sidebar").nanoScroller();
    
    // maximum character for student study field
    setMaxCharacterForParagraph(".student-entity .text", 90);
    // maximum character for scholarship title
    setMaxCharacterForParagraph(".scholarship-entity h5", 45);
});


