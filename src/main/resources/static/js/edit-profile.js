function showToolip() {
    $('[data-toggle="tooltip"]').tooltip();
}

function userChangeDataEvent() {
    $("input, select, textarea").on("change", function () {
        $(this).attr("data-changed", true);
    });
}

/*
* take the value of organization name form select-list or otherOrgField and,
* put it in a hidden input [name='organization.name'] to submit it with form
* */
function organaizationSelectedOrTyped() {
    $("#otherOrganizationInput").prop("disabled", true);
    $("#otherOrganizationInput, #organizationsList").on("change", function () {
        if ($(this).attr("id") == "organizationsList" && $(this).val() == "other") {
            $("#otherOrganizationInput").prop("disabled", false);
        } else {
            $("#otherOrganizationInput").prop("disabled", true);
        }
        $("#organization").val($(this).val());
    });
}

function handelUploadImage() {
    $(".upload-profile-pic .file-upload").on('change', function () {
        readImage(this);
        uploadeProfileImgAjax();
    });
    $(".upload-profile-pic .upload-button").on('click', function () {
        $(".file-upload").click();
    });
    $(".upload-profile-pic .delete-button").on('click', function () {
        uploadeProfileImgAjax();
    });
}

function readImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#profilePic').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function clearField() {
    for (var i = 0; i < arguments.length; i++) {
        $(arguments[i]).val("");
    }
}

function showMsgForFewSec(elemId, msg, success) {
    $(elemId).text(msg)
        .removeClass("text-success text-danger")
        .addClass(success === true ? "text-success" : "text-danger")
        .show("fast").delay(4000).hide("slow");
}

/**
 * @param {boolean} success
 * @param {string} msg
 */
function saveWorkplaceResponseMsg(success, msg) {
    showMsgForFewSec("#wokplaceResponeMsg", msg, success);
}

/**
 * @param {boolean} success
 * @param {string} msg
 */
function saveEducationResponseMsg(success, msg) {
    showMsgForFewSec("#educationResponeMsg", msg, success);
}

function addWorkspaceToList(id) {
    var companyName = $("#wokrspaceFields #companyName");
    var position = $("#wokrspaceFields #position");
    var startDate = $("#wokrspaceFields #startDate");
    var endDate = $("#wokrspaceFields #endDate");
    var endDateVal = $(endDate).val() == '' ? "current" : $(endDate).val();


    $("#workHistoryList").append("<li class='list-group-item d-flex justify-content-between align-items-center' data-id='" + id + "'>" +
        "<span class='description'>" +
        "<span>" + $(position).val() + "</span>" +
        "<span> at </span>" +
        "<span>" + $(companyName).val() + "</span>" +
        "<br>" +
        "<span class='date'>" + $(startDate).val() + "-" + endDateVal + "</span>" +
        "</span>" +
        "<button class='btn delete-btn'>" +
        "<i class='fa fa-times' aria-hidden='true'></i>" +
        "</button>" +
        "</li>"
    );
    clearField(companyName, position, startDate, endDate);
}

function addEducationToList(id) {

    var university = $("#educationFields #university");
    var description = $("#educationFields #description");
    var startDate = $("#educationFields #startDate");
    var endDate = $("#educationFields #endDate");

    var endDateVal = $(endDate).val() == '' ? "current" : $(endDate).val();

    $("#educationHistoryList").append("<li class='list-group-item d-flex justify-content-between align-items-center' data-id='" + id + "'>" +
        "<span class='description'>" +
        "<span>" + $(university).val() + "</span>" +
        "<span> " + $(description).val() + " </span>" +
        "<br>" +
        "<span class='date'>" + $(startDate).val() + "-" + endDateVal + "</span>" +
        "</span>" +
        "<button class='btn delete-btn'>" +
        "<i class='fa fa-times' aria-hidden='true'></i>" +
        "</button>" +
        "</li>"
    );
    clearField(university, description, startDate, endDate);
}

function validEducation() {
    var conainer = $("#educationFields");
    return $.trim($(conainer).find("#university").val()) != '' &&
        $.trim($(conainer).find("#description").val()) != '' &&
        $.trim($(conainer).find("#startDate").val()) != '';
}

function validWorkspace() {
    var conainer = $("#wokrspaceFields");
    return $.trim($(conainer).find("#companyName").val()) != '' &&
        $.trim($(conainer).find("#position").val()) != '' &&
        $.trim($(conainer).find("#startDate").val()) != '';
}

function formValidator() {
    jQuery.validator.addMethod("notEqual", function (value, element, param) {
        return this.optional(element) || value != $(param).val();
    }, "Please specify a different value");

    jQuery.validator.addMethod("urlvalidation", function (value, element, param) {
            var reg = ""
            if (param === "facebook") {
                reg = new RegExp("(?:(?:http|https):\\/\\/)?(?:www.)?facebook.com\\/(?:(?:\\w)*#!\\/)?(?:pages\\/)?" +
                    "(?:[?\\w\\-]*\\/)?(?:profile.php\\?id=(?=\\d.*))?([\\w\\-]*)?");
            } else if (param === "twitter") {
                reg = new RegExp("http(?:s)?:\/\/(?:www\.)?twitter\.com\/([a-zA-Z0-9_]+)");
            } else if (param === "linkedin") {
                reg = new RegExp("((https?:\\/\\/)?((www|\\w\\w)\\.)?linkedin\\.com\\/)((([\\w]{2,3})?)|([^\\/]+\\/" +
                    "(([\\w|\\d-&#?=])+\\/?){1,}))$");
            } else {
                reg = new RegExp("^(http(s)?:\\/\\/)?(www\\.)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$");
            }

            return this.optional(element) ||
                reg.test(value);
        }
        ,
        "URL is not valid"
    )
    ;
    $("#personalForm").validate({
        debug: true,
        rules: {
            profileImg: {extension: "png|jpg"},
            fName: {required: true, minlength: 3},
            lName: {required: true, minlength: 3, notEqual: "#fName"},
            email: {required: true, email: true},
            mobileNumber: {minlength: 5},
            birthday: "required"
        },
        messages: {
            lName: {
                notEqual: "Last name musn't match first name"
            },
            email: {
                email: "Please input a valid email address, we need it to contact you"
            },
            mobileNumber: {
                minlength: "Incorrect mobile number"
            }
        }
    });

    $("#socialLinksForm").validate({
        debug: true,
        rules: {
            facebook: {url: true, urlvalidation: "facebook"},
            twitter: {url: true, urlvalidation: "twitter"},
            linkedin: {url: true, urlvalidation: "linkedin"},
            ownwebsite: {url: true}
        }
    });

    $("#accountForm").validate({
        debug: true,
        rules: {
            mobileNumber: {required: true, minlength: 5},
            workEmail: {required: true, email: true},
            location: "required"
        },
        messages: {

            mobileNumber: {
                minlength: "Incorrect mobile number"
            },
            workEmail: {
                email: "Please input a valid email address, we need it to contact you"
            }

        }
    });

    $("#passwordForm").validate({
        debug: true,
        rules: {
            oldPass: {required: true, minlength: 6},
            password: {required: true, minlength: 6},
            confirmPass: {required: true, minlength: 6, equalTo: "#password"}

        },
        messages: {
            password: {
                minlength: "Your password must be at least 6 digits"
            },
            confirmPass: {
                minlength: "Your password must be at least 6 digits",
                equalTo: "Dosn't match password"
            }
        }
    });
}

function setActionsForSaveCancleBtns() {
    $("#personalTab #save").on("click", savePersonalTab);
    $("#aboutTab #save").on("click", saveAboutTab);
    $("#linksTab #save").on("click", saveLinksTab);
    $("#accountTab #save").on("click", saveAccountTab);
    $("#passwordTab #save").on("click", savePasswordTab);

    $("#personalTab .footer-btns .cancle-btn").on("click", savePersonalAjax);
    $("#aboutTab .footer-btns .cancle-btn").on("click", saveAboutAjax);
    $("#linksTab .footer-btns .cancle-btn").on("click", saveLinkAjax);
    $("#accountTab .footer-btns .cancle-btn").on("click", saveAccountAjax);
    $("#passwordTab .footer-btns .cancle-btn").on("click", savePasswordAjax);


}

/**
 *
 * @param btn id, selector or element
 */
function disableButton(btn) {
    $(btn).prop('disabled', true);
}

/**
 *
 * @param btn id, selector or element
 */
function enableButton(btn) {
    $(btn).prop('disabled', false);
}

function showAlert(success, tabId, msg) {
    var type = success == true ? "alert-success" : "alert-danger";
    $(tabId + " .alert").text(msg).removeClass("alert-danger alert-success")
        .addClass(type).show("slow").delay(4000).hide("slow");
}

function getFormChangedData(formId) {
    var formData = new FormData();
    var count = 0;
    $(formId).find("input[data-changed='true'], select[data-changed='true'], textarea[data-changed='true']")
        .each(function () {
            formData.append($(this).attr("name"), $(this).val());
            count++;
        });
    if (count == 0) {
        formData.append("isEmpty", "true");
    }
    return formData;
}

function removeDataChangedAtrr(formId, formData) {
    for (atrName of formData.keys()) {
        $(formId + " input[name='" + atrName + "']").removeData("changed");
        $(formId + " input[name='" + atrName + "']").removeAttr("data-changed");
    }
}

function emptyFormData(formData) {
    return formData.get("isEmpty") == "true";
}

var savePersonalAjax;
var saveAboutAjax;
var saveLinkAjax;
var saveAccountAjax;
var savePasswordAjax;

function cancelAjax(cancelBtn, ajax) {
    $(cancelBtn).on("click", function () {
        alert(ajax)
        console.log(ajax.readyState)

        if (ajax != null && ajax.readyState < 3) {
            ajax.abort();
        }
    });
}

function deleteWorkHistoryItemAction() {
    $("#workHistoryList").on("click", ".delete-btn", function () {
        var id = $(this).data("id");
        var btn = $(this);

        if (id == undefined || id < 1) {
            return;
        }
        var formData = new FormData();
        formData.append("id", id);
        $.ajax({
                method: "put",
                url: "/user/delete-workhistory",
                data: formData,
                cashe: false, processData: false, contentType: false,
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton($(btn));
                },
                success: function (data, textStatus, reques) {
                    $(btn).parent().remove();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    enableButton($(btn));
                }
            }
        );
    });
}

function deleteEducationHistoryItemAction() {
    $("#educationHistoryList").on("click", ".delete-btn", function () {
        var id = $(this).data("id");
        var btn = $(this);

        if (id == undefined || id < 1) {
            return;
        }
        var formData = new FormData();
        formData.append("id", id);
        $.ajax({
                method: "put",
                url: "/user/delete-education",
                data: formData,
                cashe: false, processData: false, contentType: false,
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton($(btn));
                },
                success: function (data, textStatus, reques) {
                    $(btn).parent().remove();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    enableButton($(btn));
                }
            }
        );
    });
}

function saveEducationAction() {
    $("#saveEducation").on("click", function (event) {
        event.preventDefault();
        var formData = getFormChangedData("#educationFields");
        //check if data valid
        if (!validEducation() || emptyFormData(formData)) {
            saveEducationResponseMsg(false, "Invalid data");
            return;
        }
        $.ajax({
                method: "put",
                url: "/user/add-education",
                data: formData,
                cashe: false, processData: false, contentType: false,
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton("#educationFields");
                },
                success: function (data, textStatus, reques) {
                    saveEducationResponseMsg(true, "added successfully");
                    addEducationToList((JSON.parse(data)).id);
                    removeDataChangedAtrr("#educationFields", formData);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    saveEducationResponseMsg(false, "failed to save, invalid data");
                }
                ,
                complete: function (jqXHR, textStatus) {
                    enableButton("#saveEducation");
                }
            }
        );
    });
}

function saveWorkplaceAction() {
    $("#saveWorkplace").on("click", function (event) {
        event.preventDefault();
        var formData = getFormChangedData("#wokrspaceFields");
        // check if data valid
        if (!validWorkspace() || emptyFormData(formData)) {
            saveWorkplaceResponseMsg(false, "Invalid data");
            return;
        }
        $.ajax({
                method: "put",
                url: "/user/add-workhistory",
                data: formData,
                cashe: false, processData: false, contentType: false,
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                    disableButton("#wokrspaceFields");
                },
                success: function (data) {
                    saveWorkplaceResponseMsg(true, "added successfully");
                    addWorkspaceToList((JSON.parse(data)).id);
                    removeDataChangedAtrr("#wokrspaceFields", formData);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    saveWorkplaceResponseMsg(false, "failed to save, invalid data");
                }
                ,
                complete: function (jqXHR, textStatus) {
                    enableButton("#saveWorkplace");
                }
            }
        );
    });
}

function savePersonalTab() {
    if (!$("#personalForm").valid() || $("#personalForm").find("input[data-changed='true'], select[data-changed='true']").length <= 0) {
        return;
    }
    $.ajax({
            method: "put",
            url: "/user/update-personal",
            data: $("#personalForm").serialize(),
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton("#personalTab #save");
            },
            success: function (data) {
                showAlert(true, "#personalTab", data);
                console.log(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showAlert(false, "#personalTab", "fail to update, invalid data");
            },
            complete: function (jqXHR, textStatus) {
                enableButton("#personalTab #save");
            }
        }
    );
}

// this will save only bio
function saveAboutTab() {
    if (!$("#aboutForm").valid()) {
        return;
    }

    var formData = new FormData();
    var bio = $("#aboutForm textarea[name='bio']");

    if ($(bio).attr("data-changed") === 'true') {
        formData.append("bio", $(bio).val());
    }
    if (formData == null || emptyFormData(formData)) {
        return;
    }
    $.ajax({
            method: "put",
            url: "/user/update-about",
            data: formData,
            cashe: false,
            processData: false,
            contentType: false,
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton("#aboutTab #save");
            },
            success: function (data) {
                showAlert(true, "#aboutTab", "updated successfully");
                $("#aboutForm textarea[name='bio']").removeData("changed");
                $("#aboutForm textarea[name='bio']").removeAttr("data-changed");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showAlert(false, "#aboutTab", "fail to update, invalid data");
            },
            complete: function (jqXHR, textStatus) {
                enableButton("#aboutTab #save");
            }
        }
    );
}

function saveLinksTab() {
    var formData = getFormChangedData("#socialLinksForm");
    if (!$("#socialLinksForm").valid() || formData == null || emptyFormData(formData)) {
        return;
    }
    $.ajax({
            method: "put",
            url: "/user/update-social-link",
            data: formData,
            cashe: false,
            processData: false,
            contentType: false,
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton("#linksTab #save");
            },
            success: function (data) {
                showAlert(true, "#linksTab", "updated successfully");
                removeDataChangedAtrr("#socialLinksForm", formData);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showAlert(false, "#linksTab", "fail to update, invalid data");
            }
            ,
            complete: function (jqXHR, textStatus) {
                enableButton("#linksTab #save");
            }
        }
    );
}

function saveAccountTab() {
    if (!$("#accountForm").valid() ||
        $("#accountForm").find("input[data-changed='true'], select[data-changed='true']").length <= 0) {
        return;
    }
    $.ajax({
            method: "put",
            url: "/advertiser/update-account",
            data: $("#accountForm").serialize(),
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton("#accountTab #save");
            },
            success: function (data) {
                showAlert(true, "#accountTab", "updated successfully");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 403) {
                    showAlert(false, "#accountTab", "operation not supported");
                } else {
                    showAlert(false, "#accountTab", jqXHR.responseText);
                }
            },
            complete: function (jqXHR, textStatus) {
                enableButton("#accountTab #save");
            }
        }
    );
}

function savePasswordTab() {
    var formData = getFormChangedData("#passwordTab");
    if (!$("#passwordForm").valid() || formData == null || emptyFormData(formData)) {
        return;
    }
    $.ajax({
            method: "put",
            url: "/user/update-password",
            data: formData,
            cashe: false,
            processData: false,
            contentType: false,
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken());
                disableButton("#passwordTab #save");
            },
            success: function (data) {
                showAlert(true, "#passwordTab", "updated successfully");
                clearField("#passwordForm password", "#passwordForm confirmPass");
                removeDataChangedAtrr("#passwordTab", formData);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showAlert(false, "#passwordTab", "fail to update, invalid data");
            },
            complete: function (jqXHR, textStatus) {
                enableButton("#passwordTab #save");
            }
        }
    );

}

function uploadeProfileImgAjax() {
    var formData = new FormData();
    var fileInput = $("input[name='profileImg']");
    var deleteImg = false;
    if ($(fileInput)[0].files.length === 0) {
        formData.append("profileImg", null);
        deleteImg = true;
    }else {
        formData.append("profileImg", $(fileInput)[0].files[0]);
    }
    $.ajax({
            method: "put",
            enctype: 'multipart/form-data',
            url: "/user/update-profileimg",
            data: formData,
            contentType: false,
            processData:false, cache:false,
            beforeSend: function (jqXHR, settings) {
                jqXHR.setRequestHeader(getCSRFHeader(), getCSRFToken()); //uploade-opacity-anim
                disableButton("#personalTa .upload-profile-pic .upload-button");
                disableButton("#personalTa .upload-profile-pic .delete-button");
                $(".upload-profile-pic #profilePic").addClass("uploade-opacity-anim")
            },
            success: function (data) {
                $(".upload-profile-pic #profilePic").css("opacity", "1");
                $(fileInput).val("");
                if(deleteImg){
                    $("#profilePic").attr("src", "/resources/static/img/user-icon.png");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $(".upload-profile-pic #profilePic").css("opacity", "0.5");
            },
            complete: function (jqXHR, textStatus) {
                enableButton("#personalTa .upload-profile-pic .upload-button");
                enableButton("#personalTa .upload-profile-pic .delete-button");
                $(".upload-profile-pic #profilePic").removeClass("uploade-opacity-anim")
            }
        }
    );
}

$(document).ready(function () {
    userChangeDataEvent();
    handelUploadImage();
    showToolip();
    formValidator();
    organaizationSelectedOrTyped();

    saveWorkplaceAction();
    saveEducationAction();
    deleteWorkHistoryItemAction();
    deleteEducationHistoryItemAction();
    setActionsForSaveCancleBtns();

});
