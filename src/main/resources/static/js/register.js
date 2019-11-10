
function showToolip() {
    $('[data-toggle="tooltip"]').tooltip();
}

// reset smart wizard to first step 
function resetSW(){
  
    var sw = $('#smartwizard');
    if (sw) {
        $(sw).smartWizard("reset");
        $(sw).smartWizard().data('smartWizard')._showStep(0);
    }
}

/**
 * find the maximun step-content height and set all other steps to that height
 */
function setFixedHightStepContent() {
    var maxHeight = -999;
    var steps = $('.step-content');
    $(steps).each(function () {
        var height = $(this).height();
        maxHeight = (height > maxHeight) ? height : maxHeight;
    });
    $(steps).each(function () {
        $(this).css("min-height",maxHeight);
    });
}

/**
 * Change the final msg before register to the user in finish-step
 * @param {type} stuRegistration  indicate if it student or advertiser register
 */
function changeFinishStepContent(stuRegistration) {
    if (stuRegistration) {
        $("#finishStepText").text("We almost done, after you click register go \n\
            to your profile and edit you academic information, this is very imortant, \n\
            because it help us show scholarships that matches you");
    } else {
        $("#finishStepText").text("Thank you for choosing our website to help \n\
            students, after you hit register, we will process your request and send you an \n\
            email. our best regards");
    }
}

/**
 *  change the vissibility of oragnization-tab on smartwizard
 * @param {type} setVisible either true of false
 */
function organizationTabVisibility(setVisible) {
    var orgTab = $("#organazationTab");
    if (setVisible) {
        $(orgTab).removeClass("d-none hidden");
    } else {
        $(orgTab).addClass("d-none hidden");
    }
}

/**
 * 
 * if advertserRegisterAnchor clicked, it will show additional tab 'organization info tab'
 * if studentRegisterAnchor clicked it will hide 'organization info tab'
 * in both case it will directly after click move to next step
 */
function registerAsAnchorHandelEvent() {

    $("#registerAsAdvertiserAnchor").on("click", function () {
        organizationTabVisibility(true);
        changeFinishStepContent(false);
        $("#registerAsAdvertiser").val(true);
        $("#registerAsStudent").val(false);
        $('#smartwizard').smartWizard("next");
    });
    $("#registerAsStudentAnchor").on("click", function () {
        organizationTabVisibility(false);
        changeFinishStepContent(true);
        $("#registerAsAdvertiser").val(false);
        $("#registerAsStudent").val(true);
        $('#smartwizard').smartWizard("next");
    });
}

/**
 * This function depends on the visibility of organization tab 
 * @returns {Boolean} ture if currnt registration if for student, false otherwise
 */
function studentRegistration() {
    return !$("#organazationTab").is(":visible");
}

/**
 * custom smartwizard button toolbar
 * if setVisible true it will show toolbar, otherwise hide 
 * @param {boolean} setVisible 
 */
function swButtonToolbarVisibility(setVisible) {
    if (setVisible) {
        $(".sw-toolbar").show();
    } else {
        $(".sw-toolbar").hide();
    }
}

/**
 * Organizaion list user change selection listener,
 * if selected option = "other", an input will be shown to 
 * let user organiation name
 */
function organizationListSelectEvent() {
    $("#organizationsList").on("change", function () {
        if ($(this).val() == "other") {
            $("#otherOrganizationInput").prop("disabled", false);
        } else {
            $("#otherOrganizationInput").prop("disabled", true);
        }
    });
}

/**
 * Redirect user to main page
 * tis funtion invoked when user confirm-cancel-registration
 */
function moveToMainPage() {
    $(location).attr({"href": "main.html"});
}

/**
 * show sweet aleart, if user confirm delete, move to ain page
 * if user click canle, sweetaleart will be closed, and this 
 * already implemente in swal
 */
function cancelRegBtnClickEvent() {
// show sweetaleart 
    // noinspection BadExpressionStatementJS
    swal({
        title: "Are you sure!",
        text: "You want to cancel registration",
        icon: "warning",
        dangerMode: true,
        buttons: ["No", "Yes"]
    }).then((value) => {
        // if value=true > confirm cancle registration > move  to main page
        if (value) {
            moveToMainPage();
        }
    });
}

/**
 * set rule for validator
 * Validator is jQuery plugin
 */
function formValidator() {

    // Define notEqual function
    jQuery.validator.addMethod("notEqual", function (value, element, param) {
        return this.optional(element) || value != $(param).val();
    }, "Please specify a different value");

    $("#regForm").validate({
        debug: true,
        rules: {
            fName: {required: true, minlength: 3},
            lName: {required: true, minlength: 3, notEqual: "#fName"},
            email: {required: true, email: true},
            password: {required: true, minlength: 6},
            confirmPass: {required: true, minlength: 6, equalTo: "#password"},
            mobileNumber: {required: true, minlength: 5, number: true},
            workEmail: {required: true, email: true},
            birthday: "required",
            orgLocation: "required"
        },
        messages: {
            lName: {
                notEqual: "Last name musn't match first name"
            },
            email: {
                email: "Please input a valid email address, we need it to contact you"
            },
            workEmail: {
                email: "Please input a valid email address, we need it to contact you"
            },
            password: {
                minlength: "Your password must be at least 10 digits"
            },
            confirmPass: {
                minlength: "Your password must be at least 6 digits",
                equalTo: "Dosn't match password"
            },
            mobileNumber: {
                minlength: "Incorrect mobile number"
            }
        }
    });
}


function swToolbarBtnDiffView(stepNum) {
// if it is last step (finish step)
    if (stepNum == 3) {
        $('.btn-register').removeClass('d-none'); // enable annd show register-btn
        $('.sw-btn-next').addClass('d-none'); // hide next-btn
        $('.sw-btn-prev').addClass('border-all'); // add border to right-top, right-bottom on prev-btn
    } else {
        $('.btn-register').addClass('d-none');
        $('.sw-btn-next').removeClass('d-none');
        $('.sw-btn-prev').removeClass('border-all');
    }
}


/**
 * Initialize smartwizard and set proparities
 */
function swInit() {

// Toolbar extra buttons
    var btnRegister = $('<button></button>').text('Register')
            .addClass('btn btn-register d-none')
            .on('click', function () {
                console.log("before sunmoit");
                $("#regForm")[0].submit();
                console.log("before sunmoit");
            });
    var btnCancel = $('<button></button>').text('Cancel')
            .attr({type: "button", "data-toggle": "modal"})
            .addClass('btn mr-auto')
            .on("click", function () {
                cancelRegBtnClickEvent();
            })
            .hover(
                    function () {
                        $(this).css({"color": "#ff0000"});
                    },
                    function () {
                        $(this).css({"color": "#000"});
                    }
            );
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
    $(".sw-toolbar").append(btnRegister);
}


function swOnLeavStepEvent() {
    $('#smartwizard').on("leaveStep", function (e, anchorObject, stepNumber, stepDirection) {
        if (stepDirection == "forward" && !$("#regForm").valid()) {
           return false;
        }
        return true;
    });
}


function swOnShowStepEvent() {
    $('#smartwizard').on("showStep", function (e, anchorObject, stepNumber, stepDirection) {

        swToolbarBtnDiffView(stepNumber);
        if (stepNumber == 0) {
            swButtonToolbarVisibility(false);
            organizationTabVisibility(false);
        } else {
            swButtonToolbarVisibility(true);
        }
    });
}

/**
 * prevent form from submiting when Enter-key-presed because user may hit enter before last step
 */
function preventSubmitOnEnter() {
    $('#regForm').on('keyup keypress', function (e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });
}

/** ------------------------------- Google Map -------------------------------------------- **/

var LATITUDE_ELEMENT_ID = "#lat";
var LONGITUDE_ELEMENT_ID = "#lng";
var MAP_DIV_ELEMENT_ID = "#googleMap";

var DEFAULT_ZOOM_WHEN_NO_COORDINATE_EXISTS = 1;
var DEFAULT_CENTER_LATITUDE = 31.952162;
var DEFAULT_CENTER_LONGITUDE = 35.233154;
var DEFAULT_ZOOM_WHEN_COORDINATE_EXISTS = 20;

// This is the zoom level required to position the marker
var REQUIRED_ZOOM = 15;

google.load("maps", "2.x");

// The google map variable
var map = null;

// The marker variable, when it is null no marker has been added
var marker = null;

function initializeGoogleMap() {

    map = new google.maps.Map2($(MAP_DIV_ELEMENT_ID)[0]);
    map.addControl(new GLargeMapControl());
    map.addControl(new GMapTypeControl());

    map.setMapType(G_NORMAL_MAP);

    var latitude = $(LATITUDE_ELEMENT_ID).val();
    var longitude = $(LONGITUDE_ELEMENT_ID).val();

    if (latitude != 0 && longitude != 0) {
        //We have some sort of starting position, set map center and marker
        map.setCenter(new google.maps.LatLng(latitude, longitude), DEFAULT_ZOOM_WHEN_COORDINATE_EXISTS);
        var point = new GLatLng(latitude, longitude);
        marker = new GMarker(point, {draggable: false});
        map.addOverlay(marker);
    } else {
        // Just set the default center, do not add a marker
        map.setCenter(new google.maps.LatLng(DEFAULT_CENTER_LATITUDE, DEFAULT_CENTER_LONGITUDE), DEFAULT_ZOOM_WHEN_NO_COORDINATE_EXISTS);
    }

    GEvent.addListener(map, "click", googleMapClickHandler);
}

function googleMapClickHandler(overlay, latlng, overlaylatlng) {

    if (map.getZoom() < REQUIRED_ZOOM) {
        alert("<%= :you_must_zoom_in_closer_to_position_the_course_accurately.l %>");
        return;
    }
    if (marker == null) {
        marker = new GMarker(latlng, {draggable: false});
        map.addOverlay(marker);
    } else {
        marker.setLatLng(latlng);
    }

    $(LATITUDE_ELEMENT_ID).value = latlng.lat();
    $(LONGITUDE_ELEMENT_ID).value = latlng.lng();

}

function displayGoogleMap() {
    // $('#location').on("click", function () {
    //     $('.location-picker-reg').addClass("d-flex");
    //     console.log("map moa");
    // });
    //
    // $(".location-picker-reg").on("click", "", function (e) {
    //     if($(e.target).closest('.overlay').length > 0) return;
    //     $('.location-picker-reg').removeClass("d-flex");
    // });
}

/* ----------------------------------------------------------------------------- */

$(document).ready(function () {
    swInit();
    swOnLeavStepEvent();
    swOnShowStepEvent();
    
    if ($("#step-1").is(":visible")) {
        swButtonToolbarVisibility(false);
    }
    if ($("#step-4").is(":visible")) {
        swToolbarBtnDiffView(3);
    }

    showToolip();
    registerAsAnchorHandelEvent();
    organizationListSelectEvent();
    setFixedHightStepContent();

    formValidator();
    preventSubmitOnEnter();

    // Google Map
    google.setOnLoadCallback(initializeGoogleMap);
    displayGoogleMap();
    initializeGoogleMap();
});

$(document).load(function(){
   resetSW(); 
});