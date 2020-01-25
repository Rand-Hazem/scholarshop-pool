function setValidation() {
    $("#submitApplicationForm").validate({
        debug: true,
        rules: {
            age: {required: true, number: true},
            degree: "required",
            major: "required",
            nationality: "required",
            resident: "required",
            completeYearOfStudy: {required: true, number: true},
            schoolGpa: {required: true, number: true, min: 0, max: 4},
            universityGpa: {required: true, number: true, min: 0, max: 4},
            englishLevel: "required",
            driveLink: "required"
        }
    });
}

function onSubmitBtnClick() {
    $("#submitApplicationForm input[type='submit']").on("click", function () {
        var form = $("#submitApplicationForm");
        if ($(form).valid()) {
            $(form)[0].submit();
        }
    });
}

function setTooltip() {
    $('[data-toggle="tooltip"]').tooltip();
}

$(document).ready(function () {
    setValidation();
    onSubmitBtnClick();
    setTooltip();
});