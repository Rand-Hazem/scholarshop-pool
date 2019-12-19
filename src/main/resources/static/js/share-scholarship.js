function oppTypeListListener() {
    var val = $("#opportunityTypeList").val();

    var showTraning = function () {
        $('.opportunity-scholsrship').addClass('d-none hidden');
        $('.opportunity-training').removeClass('d-none hidden');
    };

    var showScolarship = function () {
        $('.opportunity-training').addClass('d-none hidden');
        $('.opportunity-scholsrship').removeClass('d-none hidden')
    };

    // for reloade, first uplade etc
    if (val == 'Internships') {
        showTraning();
    } else {
        showScolarship();
    }

    $("#opportunityTypeList").on("change", function () {
        if ($(this).val() == 'Scholarships' || $(this).val() == 'Exchange') {
            showScolarship();
        } else {
            showTraning();
        }
    });

}

/**
 * Hide Applying Deadline field if 'open closing date' is checked
 */
function deadlineCheckboxListener() {
    $("#deadlineCheckbox").on("change", function () {
        var dateDiv = $('#deadlineDiv');
        if (this.checked) {
            $(dateDiv).hide("slow");
            $(dateDiv).find("input").val("");
        } else {
            $(dateDiv).show("slow")
        }

    });
}

/**
 * fund type list selected change listener
 */
function fundTypeListListener() {
    $("#opportunityFund").on("change", function () {
        if ($(this).val() == "NO") {
            $("#amount").val("0");
            $("#fundCover input").prop('disabled', true).prop("checked", false);
        } else {
            $("#fundCover input").prop('disabled', false);
        }
    });
}

/**
 * show input-other-org field if selected organization is other,
 * and move the value of selected org to hiddend input
 */
function organizationListListener() {
    $("#providerOrgList").on("change", function () {
        if ($(this).val() == "other") {
            $("#otherProviderOrg").prop('disabled', false);
            $("#providerOrg").val($("#otherProviderOrg").val());
        } else {
            $("#otherProviderOrg").prop('disabled', true);
            $("#providerOrg").val($(this).val());
        }

    });
}

function organizationOtherListener() {
    // for the first uploade of page
    var listVal = $("#providerOrgList").val();
    if (listVal == null || listVal == "undefined" || listVal == "other") {
        $("#otherProviderOrg").prop('disabled', false);
    } else {
        $("#otherProviderOrg").prop('disabled', true);
    }

    // set input listener, move the text to providerOrg-hidden-field
    $("#otherProviderOrg").on("focusout", function () {
        $("#providerOrg").val($(this).val());
    });
}


/**
 * show input-other-program field if selected program is other,
 * and move the value of selected prog to hiddend input
 */
function specialProgramListListener() {
    $("#specialProgramList").on("change", function () {
        if ($(this).val() == "other") {
            $("#otherSpecialProgram").prop('disabled', false);
            $("#specialProgram").val($("#otherSpecialProgram").val());
        } else {
            $("#otherSpecialProgram").prop('disabled', true);
            $("#specialProgram").val($(this).val());
        }

    });
}

function specialProgramOtherListener() {
    // for the first uploade of page
    var listVal = $("#specialProgramList").val();
    if (listVal == null || listVal == "undefined" || listVal == "other") {
        $("#otherSpecialProgram").prop('disabled', false);
    } else {
        $("#otherSpecialProgram").prop('disabled', true);
    }

    // set input listener, move the text to specialProgram-hidden-field
    $("#otherSpecialProgram").on("focusout", function () {
        $("#specialProgram").val($(this).val());
    });
}


/**
 * Check if application is through our website or provider website
 */
function applyThroughRadioBtnCheckListener() {
    if ($('#throughOur').is(':checked')) {
        $('.oppLink').removeClass("d-block").addClass("d-none");
    }
    if ($('#throughProvider').is(':checked')) {
        $('.oppLink').removeClass("d-none").addClass("d-block");
    }
    $("input[name='detail.applyThroughProviderWebsite']").on("change", function () {

        if ($(this).val() == 'false') {
            $('.oppLink').removeClass("d-block").addClass("d-none");
        } else {
            $('.oppLink').removeClass("d-none").addClass("d-block");
        }


    });
}


function multiselectList() {

    $("#opportunityMajorList, #majorsRequiredList")
        .find("option[value='']").remove();

    $("#requiredDocumentList, #applicantNationalityList").multiselect({
        columns: 1,
        placeholder: 'Select',
        maxHeight: "50vh",
        numberDisplayed: 5,
//                includeResetOption: true,
        enableCaseInsensitiveFiltering: true,
        enableFiltering: true,
        expanded: false,
        buttonWidth: "100%",
        onChange: function (option, checked, select) {
            if (checked) {
                $(option).attr("selected", "selected");
            } else {
                $(option).removeAttr("selected");
            }
        }
    });

    var setMultiselectForExpandedList = function (list) {
        $(list).multiselect({
            columns: 1,
            placeholder: 'Select',
            maxHeight: "50vh",
            numberDisplayed: 2,
//                includeResetOption: true,
            enableCaseInsensitiveFiltering: true,
            enableCollapsibleOptGroups: true,
            enableFiltering: true,
            expanded: true,
            buttonContainer: '<div class="position-relative" />',
            buttonWidth: "100%",
            onChange: function (option, checked) {
                console.log($(this));
                if (checked) {
                    if ($(option).val() == "any") {
                        $(list).find("option:selected").removeAttr("selected");
                        $(list).val("");
                        $(list).val("any");
                    } else {
                        $(list).find("option[value='any']").removeAttr("selected");
                    }
                    $(option).attr("selected", "selected");
                    $(list).multiselect('refresh');
                } else {
                    $(option).removeAttr("selected");
                }
            }
        });
    };

    setMultiselectForExpandedList("#majorsRequiredList");
    setMultiselectForExpandedList("#opportunityMajorList");
}


/**
 * Validate upload file extension
 */
function fileValidation() {
    var fileInput = $('#illustrationFile');
    var fileType = $(fileInput)[0].files[0].type;
    if (fileType != "application/pdf") {
        $('#fileError').text("Please upload pdf file.");
        $(fileInput).val("");
        //   console.log("not valid");
        return false;
    } else {
        $('#fileError').text("");
        //   console.log("valid*");
        return true;
    }
}

function uploadeFile() {
    $("#illustrationFile").on("change", function () {
        if (fileValidation()) {
            // To let the name of the file appear on select
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").text(fileName);
        }
    });

}

function addCertificatesBtnEvent() {

    $("#addCertificate").on("click", function () {

        var node = $('<div class="certificate mb-2"></div>');

        var cretificateName = $('<div class="d-inline-block col-5 mb-1 align-top p-0"></div>')
            .append($('<input id="certificate1" name="certificate" type="text" class="form-control" data-rule-required="true" placeholder="certificate" required>'));

        var score = $('<div class="d-inline-block col-5 mb-1 ml-1 align-top p-0"></div>')
            .append($('<input id="score" name="score" type="number" class="form-control d-inline-block score" ' +
                'data-rule-max="10" data-rule-min="1" placeholder="Score 1-10" required>'));

        var deleteBtn = $('<div class="d-inline-block col-1 p-0">')
            .append($('<button class="btn delete-current" type="button"><i class="fa fa-times-circle" aria-hidden="true"></i></button>'));

        node.append(cretificateName, score, deleteBtn);
        $(".certificate-div").append(node);
    });
}

function deleteCertifiateBtnEvent() {
    $(".certificate-div").on("click", " .certificate .delete-current", function () {
        $(this).parent("div").parent(".certificate").remove();
    });
}

// this function will take each certificate and create a hidden input and insert it to form
function insertHiddenCertificate() {
    var div = $(".certificate-div");

    $(".certificate").each(function (index) {
        var inputName = "applicantRequirement.specialCertificateScoreList[" + index + "].certificate";
        var inputValue = $(this).find("input[name='certificate']:first").val();

        var scoreName = "applicantRequirement.specialCertificateScoreList[" + index + "].score";
        var scoreValue = $(this).find("input[name='score']:first").val();

        var name = $("<input type='hidden' name='" + inputName + "' value='" + inputValue + "'/>");
        var score = $("<input type='hidden' name='" + scoreName + "' value='" + scoreValue + "'/>");

        if(inputName != '' && inputValue!=''){
            $(div).append(name);
            $(div).append(score);
        }
    });
}

/* -------------------------------------------------------------------------------------------------- */


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
 * show sweet aleart, if user confirm delete, move to ain page
 * if user click canle, sweetaleart will be closed, and this
 * already implemente in swal
 */
function cancelBtnClickEvent() {
// show sweetaleart 
    swal({
        title: "Are you sure!",
        text: "Do you want to cancel adding the opportunity?",
        icon: "warning",
        dangerMode: true,
        buttons: ["No", "Yes"]
    }).then((value) => {
        // if value=true > confirm cancle registration > move  to adverted-scholarships
        if (value) {
            $(location).attr({"href": "adverted-scholarships.html"});
        }
    });
}

/**
 * set rule for validator
 * Validator is jQuery plugin
 */
function formValidator() {

    jQuery.validator.addMethod("providerOrgOther", function (value, element) {
        var selectedFromList = $("#providerOrgList").val();
        if (selectedFromList != 'undefined' && selectedFromList != "other") {
            return true;
        } else if (value == 'undefined' || $.trim(value).length < 3) {
            return false;
        }
        return true;
    }, "this field is required");


    jQuery.validator.addMethod("specialProgOther", function (value, element) {
        var selectedFromList = $("#specialProgramList").val();

        if (selectedFromList != 'undefined' && selectedFromList != "other") {
            return true;
        } else if (value == 'undefined' || $.trim(value).length < 3) {
            return false;
        }
        return true;
    }, "this field is required");


    jQuery.validator.addMethod("applicationLink", function (value, element) {
        var througProvider = $("#throughProvider").is(":checked");
        if (!througProvider) {
            return true;
        }
        return /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/.test(value);
    }, "this field required with valid url");


    jQuery.validator.addMethod("fundAmount", function (value, element) {
        var fundType = $("#opportunityFund").val();
        if (fundType == 'NO') {
            return true;
        }
        return value > 0;
    }, "must be compatible with fund type");


    jQuery.validator.addClassRules("score", {
        required: true,
        min: 1,
        max: 10
    });


    jQuery.validator.addMethod("future", function (value, element) {
        var current = new Date();
        var val = new Date(value);
        return this.optional(element) || val > current;
    }, "must be future date");


    jQuery.validator.addMethod("greaterThan", function (value, element, param) {
        var val = parseInt($(param).val());
        return this.optional(element) || isNaN(val) || value >= val;
    }, "must be greater than min-age");


    jQuery.validator.addMethod("lessThan", function (value, element, param) {
        var val = parseInt($(param).val());
        return this.optional(element) || isNaN(val) || value <= val;
    }, "must be less than max-age");

    $("#shareShForm").validate({
        debug: true,
        rules: {
            "scholarship.title": {required: true, minlength: 10},
            "scholarship.type": "required",
            "scholarship.description": {required: true, minlength: 10},
            "scholarship.country": "required",
            "scholarship.city": "required",
            "scholarship.durationFrom": {required: true, future: true},
            "scholarship.durationTo": {required: true, future: true},
            "scholarship.fundType": "required",
            "scholarship.fundAmount": {number: true, required: true, min: 0, fundAmount: true},
            "scholarship.seats": {number: true, required: true, min: 1},

            providerOrgList: "required",
            otherProviderOrg: {required: true},
            specialProgramList: "required",
            otherSpecialProgram: {specialProgOther: true},
            "trainingInformation.companyName": "required",
            "trainingInformation.product": "required",
            "trainingInformation.companyWebsite": {url: true},
            "scholarship.officialWebsite": {url: true},
         //   oppLocation: "required",
            "academicInformation.hostUniversity": "required",
            "scholarship.degree": "required",
            "academicInformation.major": {required: true, multiple: true},
            "academicInformation.teachingLanguage": "required",
            "trainingInformation.trainingLanguage": "required",
            "trainingInformation.workEnvironment": "required",
            "trainingInformation.responsibility": "required",
            "trainingInformation.weekOffered": {number: true, required: true, min: 1},
            "trainingInformation.workDayPerWeek": {number: true, required: true, min: 1, max: 6},
            "trainingInformation.workHourPerDay": {number: true, required: true, min: 1, max: 12},

            "applicantRequirement.nationality": {required: true},
            "applicantRequirement.residenceIn": {required: true},
            "applicantRequirement.gender": "required",
            "applicantRequirement.minAge": {number: true, required: true, min: 10, lessThan: "#applicantAgeTo"},
            "applicantRequirement.maxAge": {number: true, required: true, greaterThan: "#applicantAgeFrom"},
            "applicantRequirement.minDegree": "required",
            "applicantRequirement.major": {required: true, multiple: true},
            "tranningApplReq.knowledgeAndExperience": "required",
            "applicantRequirement.englishLevel": "required",
            "applicantRequirement.minSchoolGPA": {min: 0, max: 4},
            "applicantRequirement.minUnivGPA": {min: 0, max: 4},
            "detail.howToApply": "required",
            "detail.requiredDocumentList": "required",
            "detail.applyThroughProviderWebsite": "required",
            "detail.urlProviderApplyForm": "applicationLink"

        },
        messages: {
            "scholarship.title": {
                minlength: "Please entar a valid title with at least 10 charaters"
            },
            "scholarship.description": {
                minlength: "Please entar a valid description with at least 10 charaters"
            }
        }
    });
}


function swToolbarBtnDiffView(stepNum) {
// if it is last step (finish step)

    if (stepNum === 5) {
        $('.btn-add').removeClass('d-none'); // show add btn
        $('.sw-btn-next').addClass('d-none'); // hide next-btn
        $('.sw-btn-prev').addClass('border-all'); // add border to right-top, right-bottom on prev-btn
    } else {
        $('.btn-add').addClass('d-none'); // hide add btn
        $('.sw-btn-next').removeClass('d-none');
        $('.sw-btn-prev').removeClass('border-all');
    }
}


/**
 * Initialize smartwizard and set proparities
 */
function swInit() {

// Toolbar extra buttons
    var btnAdd = $('<button type="submit"></button>').text('Share Opportunity')
        .addClass('btn btn-add d-none')
        .on('click', function () {
            // make hidden input with certificate
            insertHiddenCertificate();
            $("#shareShForm")[0].submit();
        });
    var btnCancel = $('<button></button>').text('Cancel')
        .attr({type: "button", "data-toggle": "modal", "data-target": "#cancleRegModle"})
        .addClass('btn btn-cancel mr-auto')
        .on("click", function () {
            cancelBtnClickEvent();
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
        toolbarSettings: {
            toolbarPosition: 'bottom'
        },
        anchorSettings: {
            markDoneStep: true, // add done css
            markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
            removeDoneStepOnNavigateBack: true, // While navigate back done step after active step will be cleared
            enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
        }
    });
    $(".sw-toolbar").prepend(btnCancel);
    $(".sw-toolbar").append(btnAdd);

}


function swOnLeavStepEvent() {
    $('#smartwizard').on("leaveStep", function (e, anchorObject, stepNumber, stepDirection) {
        if (stepDirection == "forward" && !$("#shareShForm").valid()) {
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
        } else {
            $('.btn-cancel').removeClass('d-none');
            swButtonToolbarVisibility(true);
        }
    });
}

/* ----------------------------------------------------------------------------- */

$(document).ready(function () {
//    $('select').selectpicker();
    swInit();
    swOnLeavStepEvent();
    swOnShowStepEvent();

    oppTypeListListener();
    deadlineCheckboxListener();
    fundTypeListListener();
    organizationListListener();
    organizationOtherListener();
    specialProgramListListener();
    specialProgramOtherListener();
    multiselectList();
    applyThroughRadioBtnCheckListener();
    uploadeFile();
    addCertificatesBtnEvent();
    deleteCertifiateBtnEvent();

    formValidator();

    universityAutoComplete($("#hostUniversity"));

});


