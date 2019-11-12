/**
 * find the maximun step-content height and set all other steps to that height
 */
function setFixedHightStepContent() {
    // if it small or ex-small devices, don't set fixed width
    var viewPortW = $(window).width();
    if (viewPortW <= 576) {
        return;
    }
    var maxHeight = -999;
    var steps = $('.step-content');
    $(steps).each(function () {
        var height = $(this).height();
        maxHeight = (height > maxHeight) ? height : maxHeight;
    });
    $(steps).each(function () {
       // $(this).height(maxHeight);
        $(this).css('min-height', maxHeight+"px");
    });
}

/**
 * set rule for validator
 * Validator is jQuery plugin
 */
function formValidator() {
    var imgRule = {extension: "png|jpg"};
    var imgErrorMsg = "Invalid img, only png & jpg accepted";
    $("#storyForm").validate({
        debug: true,
        rules: {
            title: {required: true, minlength: 10},
            city: {required: true, minlength: 3},
            dateFrom: "required",
            dateTo: "required",
            countryList: "required",
            fieldsList: "required",
            storyInShort: "required",
            aboutOpportunity: "required",
            aboutInstitution : "required",
            providerOrg: {minlength: 5},
            "img-1": imgRule,
            "img-2": imgRule,
            "img-3": imgRule
        },
        messages: {
            title: {
                minlength: "Please entar a valid title with at least 10 charater"
            },
            city: {
                minlength: "Please entar a valid city name with at least 3 charater"
            },
            providerOrg: {
                minlength: "Please entar a valid city name with at least 3 charater"
            },
            "img-1": imgErrorMsg,
            "img-2": imgErrorMsg,
            "img-3": imgErrorMsg
        }
    });
}


function swInit() {

// Toolbar extra buttons
    var btnShare = $('<button></button>').text('Share')
            .addClass('btn btn-share d-none')
            .on('click', function () {
                console.log("clicccccccced")
               $("#storyForm")[0].submit();
            });
    var btnCancel = $('<button></button>').text('Cancel')
            .attr({type: "button"})
            .addClass('btn mr-auto')
            .on("click", function () {
                cancelShareBtnClickEvent();
            })
            .hover(
                    function () {
                        $(this).css({"color": "#ff0000"});
                    },
                    function () {
                        $(this).css({"color": "#000"});
                    }
            )
            ;
    // Smart Wizard
    $('#smartwizard').smartWizard({
        selected: 0,
        theme: 'circles',
        transitionEffect: 'fade',
        autoAdjustHeight: false,
        toolbarSettings: {toolbarPosition: 'bottom'
        },
        anchorSettings: {
            markDoneStep: true, // add done css
            markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
            removeDoneStepOnNavigateBack: true, // While navigate back done step after active step will be cleared
            enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
        }
    });
    $(".sw-toolbar").prepend(btnCancel);
    $(".sw-toolbar").append(btnShare);
}



function swOnLeavStepEvent() {
    $('#smartwizard').on("leaveStep", function (e, anchorObject, stepNumber, stepDirection) {
        if (stepDirection == "forward" && !$("#storyForm").valid()) {
            return false;
        }
        return true;
    });
}


function swOnShowStepEvent() {
    $('#smartwizard').on("showStep", function (e, anchorObject, stepNumber, stepDirection) {
        // if it is last step, show share btn, and delete next-btn
        swToolbarBtnDiffView(stepNumber);
    });
}

/* ---------------------------------------------------------------------------------------------------------------------------- */
/**
 * 
 * @param {Int} stepNum if stepNum=5 then show share-btn, hide next-btn
 */
function swToolbarBtnDiffView(stepNum) {
    if (stepNum == 6) {
        $('.sw-toolbar .sw-btn-next').addClass('d-none');
        $('.sw-toolbar .sw-btn-prev').addClass('border-all');
        $('.sw-toolbar .btn-share').removeClass('d-none');
    } else {
        $('.sw-toolbar .sw-btn-next').removeClass('d-none');
        $('.sw-toolbar .sw-btn-prev').removeClass('border-all');
        $('.sw-toolbar .btn-share').addClass('d-none');
    }
}


/**
 * If its scholarship-story > visible talk about-university-div in step-4
 * If its internship-story > visible talk about-internship-div
 */
function setOnUserCheckStoryType() {
    $('input[type=radio][name=storyType]').on("change", function () {
        if ($(this).val() == 'internship') {
            $('#aboutInternshipDiv').removeClass("d-none");
            $('#aboutUniversityDiv').addClass("d-none");
            $('#aboutUnivTrainTab a i').removeClass("fa-university").addClass("fa-briefcase");
        } else {
            $('#aboutInternshipDiv').addClass("d-none");
            $('#aboutUniversityDiv').removeClass("d-none");
            $('#aboutUnivTrainTab a i').removeClass("fa-briefcase").addClass("fa-university");
        }
    });
}

/**
 * Write the city-name user enternd in header of step 7 (Life in city-name)
 */
function onCityFocuseoutEvent() {
    // In case that page load and data was saved in the form
    var city = $("#city").val();
    $('#cityNameInStepHeader').text(city);
    $('#city').on('focusout', function () {
        var city = $(this).val();
        $('#cityNameInStepHeader').text(city);
    });
}

/**
 * show sweet aleart, if user confirm delete, move to search-scholarship page
 * if user click cancle, sweetaleart will be closed, and this 
 * already implemente in swal
 */
function cancelShareBtnClickEvent() {
// show sweetaleart 
    swal({
        title: "Are you sure!",
        text: "You want to cancel sharing",
        icon: "warning",
        dangerMode: true,
        buttons: ["No", "Yes"]
    }).then((value) => {
        // if value=true > confirm cancle registration > move  search-scholrship
        if (value) {
            $(location).attr({"href": "search-scholarship.html"});
        }
    });
}


function displayPageContent() {
    $('footer').addClass('d-none');
    // Display welcome-text-section
    var welcomeSection = $('.welcome-section');
    setTimeout(function () {
        $(welcomeSection).fadeIn('slow');
    }, 500);
    // Display Text & image in welcome-text-section
    setTimeout(function () {
        $(welcomeSection).find('p').addClass('text-focus-in').removeClass('d-none');
        $(welcomeSection).find('img').addClass('slide-in-bl').removeClass('d-none');
    }, 1000);
    // Hide welcome-text-sectoin
    setTimeout(function () {
        $(welcomeSection).fadeOut('slow');
    }, 4000);
    // Display stepper-section
    setTimeout(function () {
        $('.stepper-section').fadeIn('slow');
        setFixedHightStepContent();
        $('footer').removeClass('d-none');
        // if reload page with laststep (step-7) show share-btn
        if ($("#step-7").is(":visible")) {
            swToolbarBtnDiffView(5);
        }
        $('.life-preview').fadeIn("fast");
    }, 6000);

}


/* ---------------------------------------------          Image uploade with preview         ---------------------------------------------- */

function initImageUpload(box) {
    var uploadField = $(box).find('.input-image')[0];

    $(uploadField).on('change', getFile);

    function getFile(e) {
        var file = e.currentTarget.files[0];
        checkType(file);
    }

    function checkType(file) {
        let imageType = /image.*/;
        if (file && file.type.match(imageType)) {
            previewImage(file);
        }
    }

    function previewImage(file) {
        var prevDiv = $(box).find('.image-preview')[0];
        var reader = new FileReader();

        reader.onload = function () {
            $(prevDiv).css({backgroundImage: 'url(' + reader.result + ')'});
        }
        reader.readAsDataURL(file);
        $(prevDiv).addClass(' no-default');
    }
}

function initImageDrop(box) {
    var btnDelete = $(box).find('.btnc-delete')[0];

    $(btnDelete).on("click", function () {
        $(box).find('.image-preview')
                .css({backgroundImage: ''})
                .removeClass(' no-default');
        $(box).find('.input-image').val("");
    });
}
/* -------------------------------------------         Life Preview                 ---------------------------------------------- */
function implementLifePreview() {
    
    onFocuseOut("#title", "#title", "#title");
    onFocuseOut("#city", "#city");
    onFocuseOut("#providerOrg", "#providerOrg", "#type"); // #type header for providerOrg, to not display scholarship in first the load
    onFocuseOut("#storyInshort", "#storyInshort");
    onFocuseOut("#aboutOpportunity", "#opportunity", "#opportunityHeader");
    onFocuseOut("#aboutInstitution", "#institution", "#institutionHeader");
    onFocuseOut("#aboutAccommodation", "#accommodation", "#accommodationHeader");
    onFocuseOut("#lifeInCity", "#lifeInCity", "#lifrInCityHeader");
    onFocuseOut("#transportation", "#transportation", "#transportationHeader");
    onFocuseOut("#culture", "#culture", "#cultureHeader");
    onFocuseOut("#advices", "#advices", "#adviceHeader");

    onSelectedOptionChange("#countryList", "#country", "", "/", "");
    onSelectedOptionChange("#dateFrom", "#dateFrom");
    onSelectedOptionChange("#dateTo", "#dateTo", "", " - ");
    onSelectedOptionChange("input[name='storyType']", "#type", "", "", " provided by");
    onSelectedOptionChange("#fieldsList", "#field", "", "In field of ");
}


function onFocuseOut(idElm, idElmPrev, idHeader) {
    idElm = ".stepper-section " + idElm;
    idElmPrev = ".life-preview " + idElmPrev;
    console.log(idElm);
    // On first load, if data is saved in from
    if ($(idElm).val().trim() != "") {
        $(idElmPrev).text($(idElm).val().trim());
        showLifePrevHeader(idHeader);
    }

    $(idElm).on("focusout", function () {
        $(idElmPrev).text($(this).val().trim());
        console.log(idHeader)
        showLifePrevHeader(idHeader);
    });
}


function onSelectedOptionChange(idElm, idElmPrev, idHeader, txtPrev, txtAfter) {
    txtPrev = typeof txtPrev == "undefined" ? "" : txtPrev;
    txtAfter = typeof txtAfter == "undefined" ? "" : txtAfter;
    idElm = ".stepper-section " + idElm;
    idElmPrev = ".life-preview " + idElmPrev;

    // On first load, if data is saved in from
    var txt = $(idElm).find("option:selected:not([value=''])").text() || $(idElm).val();
    if (txt){
        $(idElmPrev).text(txtPrev + txt + txtAfter);
        showLifePrevHeader(idHeader);
    }

    $(idElm).on("change", function () {
        var txt = $(this).find("option:selected").text() || $(this).val(); // selected-list, date  || radio-btn
        $(idElmPrev).text(txtPrev + txt + txtAfter);
        showLifePrevHeader(idHeader);
    });
}


function showLifePrevHeader(idHeader) {
    if (!idHeader) {
        return;
    }
    idHeader = ".life-preview " + idHeader;
    if (idHeader && !$(idHeader).is(":visible")) {
        $(idHeader).show();
    }
}


/* ---------------------------------------------------------------------------------------------------------------------------- */


$(document).ready(function () {
    swInit();
    swOnLeavStepEvent();
    swOnShowStepEvent();
    formValidator();

    setOnUserCheckStoryType();
    onCityFocuseoutEvent();
    displayPageContent();
    implementLifePreview();

    // uplaode images - last step
    var boxes = $('.uploade-img-box')
            .each(function () {
                initImageUpload($(this));
                initImageDrop($(this));
            });

});

