<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>edit profile</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <%@include file="parts/links.html" %>
    <script src="${contextPath}/resources/static/js/edit-profile.js"></script>
</head>
<body>
<jsp:include page="parts/navbar.jsp"/>
<div class="edit-profile mb-5">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-11 col-lg-10 tabs-container">

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item ">

                        <a class="nav-link active" data-toggle="tab" href="#personalTab">
                            <i class="fa fa-user"></i>
                            <span class="d-none d-md-inline">Personal</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#aboutTab">
                            <i class="fa fa-pencil"></i>
                            <span class="d-none d-md-inline">Bio</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#linksTab">
                            <i class="fa fa-globe"></i>
                            <span class="d-none d-md-inline">Links</span>
                        </a>
                    </li>
                    <c:if test="${user.type == 'ADVERTISER'}">
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#accountTab">
                                <i class="fa fa-home"></i>
                                <span class="d-none d-md-inline">Account</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#passwordTab">
                            <i class="fa fa-shield"></i>
                            <span class="d-none d-md-inline">Change Password</span>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <!-- Tab1 : Personal -->
                    <div id="personalTab" class="tab-pane active">
                        <h5 class="title">Personal information</h5>
                        <div class="alert mx-3" role="alert" style="display: none"></div>
                        <form id="personalForm" role="form" class="div-form" data-toggle="validator" method="post" enctype="multipart/form-data">
                            <div class="form-group col-sm-2 upload-profile-pic">
                                <div class="img-shape">
                                <button type="button" class="btn delete-button">&Chi;</button>
                                    <img id="profilePic" src="${contextPath}/resources/static/img/user-icon.png"
                                         alt="username">
                                </div>
                                <div>
                                    <input name="profileImg" type="file" accept="image/png, image/jpg, image/jpeg" class="file-upload"/>
                                    <span class="upload-button">Change</span>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>First Name</label>
                                    <input id="firstName" name="firstName" type="text" class="form-control"
                                           value="${user.firstName}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label> Last Name</label>
                                    <input id="lastName" name="lastName" type="text" class="form-control"
                                           value="${user.lastName}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Birthday</label>
                                    <input id="birthday" name="birthday" type="date" class="form-control"
                                           value="${user.birthday}"
                                           onkeydown="return false">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Gender</label>
                                    <select id="gender" name="gender" class="form-control custom-select" data-selected="${user.gender}" required>
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Nationality</label>
                                    <select name="nationality" class="form-control custom-select" data-selected="${optional.NATIONALITY.data}" required>
                                        <%@include file="parts/countries.html" %>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Where do you live</label>
                                    <input id="city" name="livingCity" type="tel" class="form-control" placeholder="Miami, America"
                                           title="Country, city for where you currently live" value="${optional.LIVEING_CITY.data}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email">
                                    Email
                                    <small id="emailHelp" class="form-text text-muted">We'll share your email with other users</small>
                                </label>
                                <input id="email" name="email" type="email" class="form-control" style="max-width: 576px;"
                                       value="${user.email}">
                            </div>
                            <div class="form-group">
                                <label class="d-block">
                                    Mobile number
                                    <small class="form-text text-muted">We'll share your phone number with other users</small>
                                </label>
                                <div class="d-inline-block  w-100 w-md-50 align-top mb-3">
                                    <select id="countriesCode" name="countryCode" class="form-control custom-select" data-selected="${fn:split(optional.MOBILE.data," ")[0]}">
                                        <%@include file="parts/country-international-phone-code.html" %>
                                    </select>
                                </div>
                                <div class="d-inline-block w-100 w-md-50  align-top mb-3 ">
                                    <input id="mobileNumber" name="mobileNumber" type="tel" class="form-control" placeholder="Mobile number"
                                           value="${fn:split(optional.MOBILE.data," ")[1]}" title="please enter your personal mobile number. only disgts">
                                </div>
                            </div>
                            <hr>
                            <div class="footer-btns">
                                <button type="button" id="save" class="btn save-btn ">Save</button>
                                <button type="button" class="btn cancle-btn">Cancel</button>
                            </div>
                        </form>

                    </div>

                    <!-- Tab : About -->
                    <div id="aboutTab" class="tab-pane ">
                        <h5 class="title">Biography</h5>
                        <div class="alert mx-3" role="alert" style="display: none"></div>
                        <form id="aboutForm" class="div-form" data-toggle="validator" method="post" accept-charset="utf-8">
                            <h6>Tell others a little about your self </h6>
                            <textarea name="bio" class="form-control" rows="2">${optional.BIO.data}</textarea>
                            <div class="container">
                                <h5 class="mt-4">Add Workplace:</h5>
                                <div class="row ">
                                    <label id="wokplaceResponeMsg" class="col-12"></label>
                                    <div id="wokrspaceFields" class="col-md-6">
                                        <div class="form-group ">
                                            <label>Company/Organization Name *</label>
                                            <input name="companyName" id="companyName" type="text" class="form-control">
                                        </div>
                                        <div class="form-group ">
                                            <label>Position *</label>
                                            <input name="position" id="position" type="text" class="form-control">
                                        </div>
                                        <div class="form-group ">
                                            <label>Start date *</label>
                                            <input name="startDate" id="startDate" type="date" class="form-control"
                                                   data-changed="true">
                                        </div>
                                        <div class="form-group ">
                                            <label>End date <small>leave it empty if you still in this position</small></label>
                                            <input name="endDate" id="endDate" type="date" class="form-control"
                                                   data-changed="true">
                                        </div>
                                        <div class="form-group ">
                                            <button type="button" id="saveWorkplace" class="btn save-btn">Save</button>
                                        </div>
                                    </div>
                                    <div class="list-history col-md-6">
                                        <ul id="workHistoryList" class="list-group">
                                            <c:forEach var="item" items="${user.workHistoryList}">
                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                        <span class="description">
                                                            <span>${item.position}</span>
                                                            <span>at</span>
                                                            <span>${item.companyName}</span>
                                                            <br>
                                                            <span class="date"> ${item.startDate}-
                                                                    ${item.endDate != null ? item.endDate : "current"}</span>
                                                        </span>
                                                    <button type="button" class="btn delete-btn" data-id="${item.id}">
                                                        <i class="fa fa-times" aria-hidden="true"></i>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>

                                <h5 class="mt-4">Add Education</h5>
                                <div class="row">
                                    <label id="educationResponeMsg" class="col-12"></label>
                                    <div id="educationFields" class="col-md-6">
                                        <div class="form-group ">
                                            <label>University/School Name</label>
                                            <input name="university" id="university" type="text" class="form-control">
                                        </div>
                                        <div class="form-group ">
                                            <label>Description</label>
                                            <input name="description" id="description" type="text" class="form-control"
                                                   placeholder="ex: Master of Computer Science">
                                        </div>
                                        <div class="form-group ">
                                            <label>Start date *</label>
                                            <input name="startDate" id="startDate" type="date" class="form-control"
                                                   data-changed="true">
                                        </div>
                                        <div class="form-group ">
                                            <label>End date <small>leave if empty if you still int this
                                                university</small></label>
                                            <input name="endDate" id="endDate" type="date" class="form-control"
                                                   data-changed="true">
                                        </div>
                                        <div class="form-group ">
                                            <button type="button" id="saveEducation" class="btn save-btn">Save</button>
                                        </div>
                                    </div>
                                    <div class="col-md-6 list-history">
                                        <ul id="educationHistoryList" class="list-group">
                                            <c:forEach var="item" items="${user.educationHistoryList}">
                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                        <span class="description">
                                                            <span>${item.university}</span><br>
                                                            <span style="font-size: 0.83rem;color: cornflowerblue;">${item.description}</span>
                                                            <br>
                                                            <span class="date">
                                                                    ${item.startDate}-
                                                                ${item.endDate != null ? item.endDate : "current"}
                                                            </span>
                                                        </span>
                                                    <button type="button" class="btn delete-btn" data-id="${item.id}">
                                                        <i class="fa fa-times" aria-hidden="true"></i>
                                                    </button>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="footer-btns">
                                <button type="button" id="save" class="btn save-btn ">Save</button>
                                <button type="button" class="btn cancle-btn">Cancel</button>
                            </div>
                        </form>
                    </div>

                    <!-- Tab : Links -->
                    <div id="linksTab" class="tab-pane ">
                        <h5 class="title">Social Links</h5>
                        <div class="alert mx-3" role="alert" style="display: none"></div>
                        <form id="socialLinksForm" name="socialLinksForm" role="form" class="div-form"
                              data-toggle="validator">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Facebook</label>
                                <div class="col-sm-9">
                                    <input type="text" name="facebook" class="form-control" placeholder="http://facebook.com/"
                                           value="${optional.FACEBOOK_LINK.data}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Twitter</label>
                                <div class="col-sm-9">
                                    <input type="text" name="twitter" class="form-control" placeholder="http://twitter.com/"
                                           value="${optional.TWITTER_LINK.data}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Linkedin</label>
                                <div class="col-sm-9">
                                    <input type="text" name="linkedin" class="form-control" placeholder="http://linkedin.com/"
                                           value="${optional.LINKEDIN_LINK.data}">
                                </div>
                            </div>
                            <div class="form-group pb-4">
                                <label class="col-sm-2 control-label">Website</label>
                                <div class="col-sm-9">
                                    <input type="text" name="ownwebsite" class="form-control" placeholder="http://ownweb.com/"
                                           value="${optional.WEBSITE_LINK.data}">
                                </div>
                            </div>
                            <hr>
                            <div class="footer-btns">
                                <button type="button" id="save" class="btn save-btn">Save</button>
                                <button type="button" class="btn cancle-btn">Cancel</button>
                            </div>
                        </form>
                    </div>

                    <c:if test="${user.type == 'ADVERTISER'}">
                        <!-- Tab : Account -->
                        <div id="accountTab" class="tab-pane">
                            <h5 class="title">Account</h5>
                            <div class="alert mx-3" role="alert" style="display: none"></div>
                            <form id="accountForm" role='form' class='div-form' data-toggle="validator">
                                <p class='text-muted'>
                                    Note that your account will be pending until verified the organization<br>
                                    Binding means that you can access your account, but you can't share an opportunity
                                </p>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="organizationsList">Organization *</label>
                                        <select id="organizationsList" name="organizationList" class="form-control custom-select" aria-invalid="false">
                                            <jsp:include page="parts/organization-list.jsp"/>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 mt-auto">
                                        <input id="otherOrganizationInput" name="otherOrganization" class="form-control" type="text" placeholder="Other..">
                                        <input id="organization" name="organization.name" type="hidden" class="form-control"
                                               value="${user.advertiser.organization.name}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="d-inline-block w-100 w-md-50  align-top mb-3">
                                        <!-- Nooooooooooooote .. this list must be in file and included , file already exists (Rand) -->
                                        <select id="countriesCodeOrg" name="countryCode" class="custom-select"
                                                required="" data-selected="${fn:split(user.advertiser.mobileNum," ")[0]}">
                                            <%@include file="parts/country-international-phone-code.html" %>
                                        </select>
                                    </div>
                                    <div class="d-inline-block w-100 w-md-50  align-top mb-3">
                                        <input id="mobileNumberOrg" name="mobileNumber" type="tel" class="form-control" placeholder="Mobile number"
                                               title="please enter your personal mobile number. only disgts" required=""
                                               value="${fn:split(user.advertiser.mobileNum," ")[1]}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="workEmail">Work Email *</label>
                                    <input id="workEmail" name="workEmail" type="email" class="form-control overflow-hidden"
                                           value="${user.advertiser.workEmail}" placeholder="Work Email" required="">
                                </div>
                                <div class="form-group">
                                    <label for="location">Location *</label>
                                    <input id="location" name="organization.location" type="text" class="form-control overflow-hidden"
                                           placeholder="street, bulding num, city, counry" required=""
                                           value="${user.advertiser.organization.location}">
                                </div>
                                <div class="form-group">
                                    <label for="fax">Fax</label>
                                    <input id="fax" name="organization.fax" type="text" class="form-control overflow-hidden"
                                           placeholder="+1 323 555 123" value="${user.advertiser.organization.fax}">
                                </div>
                                <hr>
                                <div class="footer-btns">
                                    <button type="button" id="save" class="btn save-btn ">Save</button>
                                    <button type="button" class="btn cancle-btn">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </c:if>

                    <!--  Tab : password  -->
                    <div id="passwordTab" class="tab-pane ">
                        <h5 class="title">Change Your Password</h5>
                        <div class="alert mx-3" role="alert" style="display: none"></div>
                        <form id="passwordForm" role="form" class="div-form">
                            <div class="form-group col-sm-8">
                                <label>Current password</label>
                                <input id="oldPass" name="oldPass" type="password" class="form-control">
                            </div>
                            <div class="form-group col-sm-8">
                                <label>New password</label>
                                <input id="password" name="password" type="password" class="form-control">
                            </div>
                            <div class="form-group col-sm-8 pb-4">
                                <label>Confirm password</label>
                                <input id="confirmPass" name="confirmPass" type="password" class="form-control">
                            </div>
                            <hr>
                            <div class="footer-btns">
                                <button type="button" id="save" class="btn save-btn ">Save</button>
                                <button type="button" id="cancel" class="btn cancle-btn">Cancel</button>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="parts/footer.html" %>
</body>
</html>
