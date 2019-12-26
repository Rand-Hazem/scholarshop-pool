function setValidation() {
    $("#submitApplicationForm").validate({
        debug: true,
        rules: {
            fname: "required",
            lname: "required",
            email: {required: true, email: true},
            age: {required: true, number: true},
            degree: "required",
            major: "required",
            nationality: "required",
            resident: "required",
            completeYearOfStudy: {required: true, number: true},
            schoolGpa: {required: true, number: true, min: 0, max: 4},
            universityGpa: {required: true, number: true, min: 0, max: 4},
            englishLevel: "required",
            RequiredCertification: "required",
            driveLink: "required",


        }
    });
}

function setTooltip() {
    $('[data-toggle="tooltip"]').tooltip();
}

$(function () {
    setTooltip();
    setValidation();
});