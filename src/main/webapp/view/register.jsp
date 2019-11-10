<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WebName Regestire</title>
    <%@include file="parts/links.html" %>
    <!-- Google map location -->
    <script type="text/javascript" src="http://www.google.com/jsapi?key=AIzaSyCcnnjqf-cHW4K7FdQTxAY-01uUlPfiMiY"></script>
    <!--Include SmartWizard JavaScript source-->
    <script type="text/javascript" src="${contextPath}/resources/static/js/jquery.smartWizard.min.js"></script>
    <script src="${contextPath}/resources/static/js/register.js"></script>
</head>

<body>
<section class="registration"><!-- Root -->

    <div id="regContainer" class="container d-flex justify-content-center">
        <div class="stepper">
            <form:form id="regForm" action="/register" method="post" role="form" data-toggle="validator"
                       modelAttribute="user">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <!-- SmartWizard html -->
                <div id="smartwizard" class="sw-main sw-theme-circles">
                    <ul id="stepsNav">
                        <li>
                            <a href="#step-1"><i class="fa fa-question step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-2"><i class="fa fa-user step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li id="organazationTab" class="d-none hidden">
                            <a href="#step-3"><i class="fa  fa-briefcase step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-4"><i class="fa fa-check step-icon" aria-hidden="true"></i></a>
                        </li>
                    </ul>

                    <div>
                        <div id="step-1"><!-- Register as -->
                            <h4>Tell us about yourself ${test}</h4>
                            <div id="form-step-0" role="form">
                                <div class="container">
                                    <div class="row d-flex justify-content-center">
                                        <a id="registerAsAdvertiserAnchor" class='register-as-anchor m-auto'>
                                            <img src="${contextPath}/resources/static/img/reg-icon-advertiser.png">
                                            <span class="d-block text-center">I'm  Advertiser</span>
                                        </a>
                                        <input id="registerAsAdvertiser" name="registerAsAdvertiser" type="hidden"
                                               value="false"/>
                                        <a id="registerAsStudentAnchor" class='register-as-anchor m-auto'>
                                            <img src="${contextPath}/resources/static/img/reg-icon-student.png">
                                            <span class="d-block text-center">I'm  Student</span>
                                        </a>
                                        <input id="registerAsStudent" name="registerAsStudent" type="hidden"
                                               value="false"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="step-2"><!-- Personal information -->
                            <h4>Personal Information</h4>
                            <div id="form-step-1" role="form">

                                <div class="form-group">
                                    <div class="d-inline-block w-100 w-md-50 align-top">
                                        <label for="fName">First Name *</label>
                                        <form:input id="fName" path="firstName" type="text"
                                                    class="form-control overflow-hidden" 
                                                    placeholder="First Name" data-toggle="tooltip"
                                                    data-placement="bottom"
                                                    title="at least 3 character " required="required"/>
                                        <form:errors path="firstName" class="error"/>
                                    </div>
                                    <div class="d-inline-block w-100 w-md-50 align-top">
                                        <label for="lName">Last Name *</label>
                                        <form:input id="lName" path="lastName" type="text"
                                                    class="form-control overflow-hidden" 
                                                    placeholder="Last Name" data-toggle="tooltip"
                                                    data-placement="bottom"
                                                    title="at least 3 character, differ form first name"
                                                    required="required"/>
                                        <form:errors path="lastName" class="error"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email *</label>
                                    <form:input id="email" path="email" type="email" class="form-control" 
                                                placeholder="Write your personal email"
                                                data-placement="bottom" data-toggle="tooltip"
                                                title="a vaild personal email" required="required"/>
                                    <form:errors path="email" class="error"/>
                                    <span class="error">${duplicate_email}</span>
                                </div>


                                <div class="form-group">
                                    <div class="d-inline-block w-md-50 w-xs-100 align-top">
                                        <label for="birthday">Birthday *</label>
                                        <form:input id="birthday" path="birthday" type="date" class="form-control"
                                                    
                                                    onkeydown="return false" required="required"/>
                                        <form:errors path="birthday" class="error"/>
                                    </div>
                                    <div class="d-inline-block w-md-50  w-xs-100  align-top">
                                        <label for="gender">Gender *</label>
                                        <form:select id="gender" path="gender" class="form-control custom-select"
                                                     required="required">
                                            <option value="M" ${gender=="M" ? 'selected':''}>M</option>
                                            <option value="F" ${gender=="F" ? 'selected' :''}>F</option>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="d-inline-block w-100 w-md-50 align-top">
                                        <label for="password">Password *</label>
                                        <form:input id="password" path="password" type="password"
                                                    class="form-control overflow-hidden" 
                                                    placeholder="Password" data-toggle="tooltip"
                                                    data-placement="bottom" title="at least 6 digits"
                                                    required="required"/>
                                        <form:errors path="password" class="error"/>
                                    </div>
                                    <div class="d-inline-block w-100 w-md-50 align-top">
                                        <label for="confirmPass">Confirm Password *</label>
                                        <form:input id="confirmPass" path="confirmPass" type="password"
                                                    class="form-control overflow-hidden" 
                                                    placeholder="Confirm Password" data-toggle="tooltip"
                                                    data-placement="bottom" title="at leadt 6 digits"
                                                    required="required"/>
                                        <form:errors path="confirmPass" class="error"/>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div id="step-3"><!-- Organazatio --->
                            <h4>About Organization</h4>
                            <small>Tell us information about the organization/company the you belong to</small>
                            <div id="form-step-2" role="form">
                                <div class="form-group">
                                    <div class="d-inline-block w-100 w-md-50  align-top mb-3">
                                        <label for="organizationsList">Organization*</label>
                                        <form:select id="organizationsList" path="advertiser.organization.name"
                                                     class="custom-select">
                                            <option value="eu">European Union</option>
                                            <option value="udp">University Di Parma</option>
                                            <option >...</option>
                                            <option id="organizattionOtherOption" value="other">Other</option>
                                        </form:select>
                                    </div>
                                    <div class="d-inline-block w-100 w-md-50 align-bottom mb-3">
                                        <input id="otherOrganizationInput" name="otherOrganization" class="form-control"
                                               
                                               type="text" placeholder="Other.."/>
                                    </div>
                                    <form:errors path="advertiser.organization.name" class="error"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="display-block">work mobile number *</label>
                                <div class="d-inline-block  w-100 w-md-50  align-top mb-3">
                                    <!-- Nooooooooooooote .. this list must be in file and included , file already exists (Rand) -->
                                    <select id="countriesCode" name="advertiserMobileCode" class="custom-select"
                                            required>
                                        <%@include file="parts/country-international-phone-code.html" %>
                                    </select>
                                </div>
                                <div class="d-inline-block  w-100 w-md-50  align-top mb-3">
                                    <form:input id="mobileNumber" path="advertiser.mobileNum" type="tel"
                                                class="form-control" value='${fn:split(advertiser.mobileNum," ")[1]}'
                                    placeholder="Mobile number"
                                                data-toggle="tooltip" data-placement="bottom"
                                                title="please enter your personal mobile number. only disgts"
                                                required="required"/>
                                    <form:errors path="advertiser.mobileNum" class="error" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="workEmail">Work Email *</label>
                                <form:input id="workEmail" path="advertiser.workEmail" type="email"
                                            class="form-control overflow-hidden" 
                                            placeholder="Work Email" required="required"/>
                                <form:errors path="advertiser.workEmail" class="error"/>
                            </div>

                            <div class="form-group">
                                <label for="location">Location *</label>
                                <form:input id="location" path="advertiser.organization.location" type="text"
                                            class="form-control overflow-hidden" 
                                            placeholder="Location .." data-toggle="tooltip" data-placement="bottom"
                                            required="required"/>
                                <form:errors path="advertiser.organization.location" class="error"/>
                            </div>

                            <div class="form-group">
                                <label for="fax">Fax</label>
                                <form:input id="fax" path="advertiser.organization.fax" type="text"
                                            class="form-control overflow-hidden" 
                                            placeholder="+1 323 555 123"/>
                                <form:errors path="advertiser.organization.fax" class="error"/>
                            </div>
                        </div>

                        <div id="step-4"><!-- Finish --->
                            <h4>Finish</h4>
                            <div id="form-step-3" role="form">
                                <div class="form-group">
                                    <p id="finishStepText">
                                        We almost done, after you click register
                                        go to your profile and edit you academic
                                        information, this is very imortant, because
                                        it help us show scholarships that matches you
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>

<section class="location-picker-reg"><!-- Google map -->
    <div class="overlay">
        <input id="lat" name="lat" type="text" class="d-none">
        <input id="lng" name="lng" type="text" class="d-none">
        <input id="locationGM" name="locationGM" type="text" class="w-100 form-control"
               placeholder="Enter your location"/>
        <div id="googleMap" class="w-100 h-100 w-xs-100"></div>
    </div>
</section>

</body>
</html>