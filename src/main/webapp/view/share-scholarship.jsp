<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <title>share scholarship</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%@include file="parts/links.html" %>
    <%@include file="parts/imgStaticPath.jsp" %>

    <script src="${contextPath}/resources/static/js/jquery.smartWizard.min.js"></script>
    <script src="${contextPath}/resources/static/js/share-scholarship.js"></script>
</head>


<body>
<jsp:include page="parts/navbar.jsp"/>

<section class="share-scholarship page-header">
    <div class="headerText">
        <h1 class="animated fadeIn">ADD AN OPPORTUNITY</h1>
        <h2 class="animated fadeInLeft">Help students find a chance</h2>
    </div>
</section>

<section class="share-scholarship">
    <!-- Add Opportunity Div-->
    <div class="container">
        <div class="row d-flex justify-content-center">
            <!-- Stepper -->
            <div class="stepper">
                <form action="#" method="post" id="shareShForm" name="shareShForm" role="form" data-toggle="validator">

                    <!-- Smart Wizard html -->
                    <div id="smartwizard" class="sw-main sw-theme-circles">
                        <ul id="stepsNav">
                            <li>
                                <a href="#step-1"><i class="fa fa-smile-o step-icon" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="#step-2"><i class="fa fa-info step-icon" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="#step-3"><i class="fa fa-briefcase step-icon" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="#step-4"><i class="fa  fa-user step-icon" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="#step-5"><i class="fa fa-file step-icon" aria-hidden="true"></i></a>
                            </li>
                            <li>
                                <a href="#step-6"><i class="fa fa-check step-icon" aria-hidden="true"></i></a>
                            </li>
                        </ul>

                        <!-- All Steps -->
                        <div>
                            <!-- Step 1 > Welcome Text -->
                            <div id="step-1">
                                We are so happy that you want to share your opportunity
                                on our website, any WebsiteName visitor can view this opportunity.
                                Please submit your opportunity information in order to have it included in our database.
                                Upon submission, we will review the scholarship information to make sure it reflects our
                                standards.
                                <div class="mt-2">
                                    <img src="${contextPath}/resources/static/img/meeting.png" class="img-fluid">
                                </div>
                            </div>

                            <!-- Step 2 => OPPORTUNITY INFORMATION -->
                            <div id="step-2">
                                <h4>Opportunity Information</h4>
                                <div id="form-step-0" role="form">
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Opportunity Title</label><b> *</b>
                                            <input id="opportunityTitle" name="opportunityTitle" type="text"
                                                   class="form-control overflow-hidden"
                                                   placeholder="opportunity Title" required>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50  align-top">
                                            <label>Opportunity Type</label><b> *</b>
                                            <select id="opportunityTypeList" name="opportunityType"
                                                    class="form-control custom-select" required>
                                                <option value="" selected disabled hidden> -- Select Type --</option>
                                                <option value="Scholarships" selected="selected">Scholarships</option>
                                                <option value="Exchange">Residences and Exchange Programs</option>
                                                <option value="Internships">Internships</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Opportunity degree<b> *</b></label>
                                            <select id="opportunityDegree" name="opportunityDegree" class="form-control custom-select" required>
                                                <option value="BACHELOR">Bachelor</option>
                                                <option value="BACHELOR_MASTER">Bachelor, Master</option>
                                                <option value="BACHELOR_MASTER_DOCTORAL">Bachelor, Master, Doctoral</option>
                                                <option value="MASTER">Master</option>
                                                <option value="MASTER_DOCTORAL">Master, Doctoral</option>
                                                <option value="DOCTORAL">Doctoral</option>
                                            </select>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Available Seats<b> *</b></label>
                                            <input id="opportunitySeats" name="opportunitySeats" type="number" min="1"
                                                   class="form-control overflow-hidden" value="1"
                                                   placeholder="Available Seats" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Opportunity Description</label><b> *</b>
                                        <textarea class="form-control noresize" rows="3" id="opportunityDescription"
                                                  name="opportunityDescription"
                                                  placeholder="Please provide a descriptive summary of your opportunity."
                                                  required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Opportunity will take place in</label><b> *</b>
                                            <select id="opportunityCountry" name="opportunityCountry"
                                                    class="form-control custom-select" required>
                                                <option value="" disabled selected>Country</option>
                                                <option value="Afghanistan">Afghanistan</option>
                                                <option value="Åland Islands">Åland Islands</option>
                                                <option value="Albania">Albania</option>
                                                <option value="Algeria">Algeria</option>
                                                <option value="American Samoa">American Samoa</option>
                                            </select>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>City</label><b> *</b>
                                            <input id="opportunityCity" name="opportunityCity" type="text"
                                                   class="form-control overflow-hidden"
                                                   placeholder="Opportunity City" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Applying deadline</label>
                                        <div id="deadlineDiv">
                                            <input id="opportunityDeadline" name="opportunityDeadline" type="date"
                                                   class="form-control" onkeydown="return false">
                                        </div>
                                        <div>
                                            <input id="deadlineCheckbox" name="deadlineCheckbox" type="checkbox"/>
                                            <label class="form-check-label" for="deadlineCheckbox">
                                                Open closing date
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div>
                                            <label>Duration</label><b> *</b>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">FROM</div>
                                                    </div>
                                                    <input id="opportunityDurationFrom" name="opportunityDurationFrom"
                                                           type="date" class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">TO</div>
                                                    </div>
                                                    <input id="opportunityDurationTo" name="opportunityDurationTo" type="date"
                                                           class="form-control" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="d-inline-block w-100 align-top">
                                            <label class="d-block">
                                                Is your opportunity funded?<b> *</b>
                                                <small class="text-muted">amount in dollar $</small>
                                            </label>
                                            <div class="w-md-50 d-inline-block align-top">
                                                <select id="opportunityFund" name="opportunityFund"
                                                        class="form-control custom-select align-top" required>
                                                    <option value="" disabled selected>Select Funding</option>
                                                    <option value="FULL">Full Funding</option>
                                                    <option value="PARTIAL">Partial Funding</option>
                                                    <option value="SALARY">Monthly Salary</option>
                                                    <option value="NO">No Funding</option>
                                                </select>
                                            </div>
                                            <div class="w-md-50 d-inline-block align-top">
                                                <input id="amount" name="amount" type="number" placeholder="amount in $"
                                                       class="form-control align-top" value="0" required>
                                            </div>
                                        </div>
                                        <div id="fundCovering" class="w-100 align-top full partial">
                                            <label>What does the funding cover?</label><b> *</b>
                                            <div id="fundCover" class="w-100">
                                                <div class="col-sm-11 col-md-5  d-inline-block">
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="TUITION_FEE"> Tuition Fee
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="TRAVEL_COSTS"> Travel Costs
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="VISA_COSTS"> Visa Costs
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="ACCOMMODATION"> Accommodation
                                                    </label>
                                                </div>
                                                <div class="col-sm-11 col-md-5 d-inline-block">
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="FOOD"> Food
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="PARTICIPATION_FEES"> Participation Fees
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="STIPEND_LIVING_ALLOWANCE"> Stipend/ Living allowance
                                                    </label>
                                                    <label>
                                                        <input type="checkbox" name="fundCover" value="HEALTH_INSURANCE"> Health insurance
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Opportunity Website Address</label>
                                        <input id="opportunityWebsite" name="opportunityWebsite" type="url"
                                               class="form-control overflow-hidden"
                                               placeholder="Does the opportunity have a webpage offering more information?">
                                    </div>
                                    <div class="form-group">
                                        <label>What does the successful applicant gain from your
                                            opportunity?
                                            <span style="color: #223D4E;"> Opportunity privileges</span></label>
                                        <textarea id="opportunityPrivileges" name="opportunityPrivileges"
                                                  class="form-control noresize" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Step 3 => OPPORTUNITY DETAILS  -->
                            <!-- Div with class 'opportunity-scholarship' is when opportunity type: scholarships, exchange, or fellowship  -->
                            <!-- Div with class 'opportunity-training' is when opportunity type: training or internship  -->
                            <div id="step-3">
                                <h4>Opportunity Details</h4>
                                <small class="d-block mb-5">Tell us more information about the opportunity and provider.</small>
                                <h4>Provider Information</h4>

                                <div id="form-step-1">
                                    <div class="form-group">
                                        <input type="hidden" id="providerOrg" name="providerOrg">
                                        <label class="d-block">Provider Organization<b> *</b></label>
                                        <div class="d-inline-block w-md-50 align-top">
                                            <select id="providerOrgList" name="providerOrgList" class="custom-select" required>
                                                <option selected disabled> -- Select Type --</option>
                                                <option value="org1">Org 1</option>
                                                <option value="org2">Org 2</option>
                                                <option value="org3">...</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div class="d-inline-block w-md-50 align-top">
                                            <input id="otherProviderOrg" name="otherProviderOrg" type="text" class="form-control"
                                                   placeholder="Provider Organization">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="d-block">Special Program</label>
                                        <input type="hidden" id="specialProgram" name="specialProgram">
                                        <div class="d-inline-block w-md-50 align-top">
                                            <select id="specialProgramList" name="specialProgramList" class="custom-select">
                                                <option selected disabled> -- Select Type --</option>
                                                <option value="prog1">prog 1</option>
                                                <option value="prog2">prog 2</option>
                                                <option value="prog3">...</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div class="d-inline-block w-md-50 align-top">
                                            <input id="otherSpecialProgram" name="otherSpecialProgram" type="text" class="form-control"
                                                   placeholder="Special Program">
                                        </div>
                                    </div>
                                    <div class="opportunity-training">
                                        <div class="form-group">
                                            <div class="d-inline-block w-md-50 align-top">
                                                <label>Employer Name</label><b> *</b>
                                                <input id="opportunityEmployerName" name="opportunityEmployerName"
                                                       type="text" class="form-control overflow-hidden"
                                                       placeholder="Employer Name" required>
                                            </div>
                                            <div class="d-inline-block w-md-50 align-top">
                                                <label>Business or Products</label><b> *</b>
                                                <input id="opportunityBusiness" name="opportunityBusiness" type="text"
                                                       class="form-control overflow-hidden"
                                                       placeholder="Business or Products" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Employer Website</label>
                                            <input id="employerWebsite" name="employerWebsite"
                                                   type="url" class="form-control overflow-hidden" value="https://">
                                        </div>
                                        <div class="form-group">
                                            <label>Location of Placement</label><b> *</b>
                                            <input id="oppLocation" name="oppLocation" type="text" class="form-control"
                                                   placeholder="Full Location of Placement" required>
                                        </div>
                                    </div>

                                    <hr class="pb-3">
                                    <div class="opportunity-scholsrship">
                                        <h4>Academic Information of Opportunity</h4>
                                        <div class="form-group">
                                            <input type="hidden" id="hostUniversity" name="hostUniversity">
                                            <label>Host University/Institution<b> *</b></label>

                                            <select id="hostUniversityList" name="hostUniversityList"
                                                    class="custom-select">
                                                <option value="u1">Univ 1</option>
                                                <option value="u2">Univ 2</option>
                                                <option value="u3">...</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div id="otherHostUniversityDiv" class="d-none hidden mb-3">
                                            <label>Add Host University/Institution</label><b> *</b>
                                            <input id="otherHostUniversity" name="otherHostUniversity" type="text" class="form-control"
                                                   placeholder="Host University/Institution" autofocus>
                                        </div>
                                        <div class="form-group">
                                            <label>Select Major</label><b> *</b>
                                            <button type="button" class="btnModal btn btn-block" data-toggle="modal"
                                                    data-target="#offeredMajorsModal">Major
                                            </button>
                                        </div>
                                        <div class="modal fade" id="offeredMajorsModal" tabindex="-1" role="dialog">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Select Majors</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <select id="opportunityMajorList" name="majorList" data-rule-required="true"
                                                                class="form-control selectpicker" multiple
                                                                data-live-search="true" required>
                                                            <option value="any" selected>Any</option>
                                                            <option value="Accounting" selected>Accounting</option>
                                                            <option value="Actuarial Science">Actuarial Science</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="d-block">Teaching Language<b> *</b></label>
                                            <select id="teachingLanguageList" name="teachingLanguage" class="custom-select" required>
                                                <option value="ENGLISH">English</option>
                                                <option value="HOST_COUNTRY_LANG">Host Country Language</option>
                                                <option value="BOTH">Both</option>
                                                <option value="UNDEFINED">undefined</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="opportunity-training">
                                        <h4>Training Opportunity Details</h4>

                                        <div class="form-group">
                                            <label>Training Language<b> *</b></label>
                                            <select id="trainingLanguageList" name="trainingLanguage" class="custom-select" required>
                                                <option value="ENGLISH">English</option>
                                                <option value="HOST_COUNTRY_LANG">Host Country Language</option>
                                                <option value="BOTH">Both</option>
                                                <option value="UNDEFINED">undefined</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Working Environment</label><b> *</b>
                                            <textarea id="opportunityEnvironment" name="opportunityEnvironment" rows="3"
                                                      class="form-control noresize" placeholder="position or traning field" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Responsibilities</label><b> *</b>
                                            <textarea id="opportunityResponsibilities" name="opportunityResponsibilities"
                                                      class="form-control noresize" rows="3" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Expected to Gain/Benefits</label>
                                            <textarea id="opportunityBenefits" name="opportunityBenefits"
                                                      class="form-control noresize" rows="3"
                                                      placeholder="When an applicant gets the opportunity, what are their benefits?">
                                                    </textarea>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-4 align-top">
                                                <label>Number of Weeks Offered</label><b> *</b>
                                                <input id="opportunityWeaks" name="opportunityWeaks" type="number" min="1"
                                                       class="form-control overflow-hidden" value="4" required>
                                            </div>
                                            <div class="col-lg-4 align-top">
                                                <label>Working days per Weak</label><b> *</b>
                                                <input id="opportunityDays" name="opportunityDays" type="number"
                                                       class="form-control overflow-hidden" value="5" required
                                                       placeholder="Working days per Weak">
                                            </div>
                                            <div class="col-lg-4 align-top">
                                                <label>Daily Working Hours</label><b> *</b>
                                                <input id="opportunityHours" name="opportunityHours" type="number"
                                                       class="form-control overflow-hidden"
                                                       placeholder="Daily Working Hours" value="8" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step 4 => APPLICANT REQUIREMENTS  -->
                            <div id="step-4">
                                <h4>Applicant Requirements</h4>
                                <div id="form-step-2" role="form">
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top position-relative">
                                            <label>Nationality<b> *</b></label>
                                            <select id="applicantNationalityList" name="applicantNationality" data-live-search="true"
                                                    class="form-control selectpicker" multiple required>
                                                <option value="any">Any Nationality</option>
                                                <option value="Afghanistan">Afghanistan</option>
                                                <option value="Åland Islands">Åland Islands</option>
                                                <option value="Albania">Albania</option>
                                                <option value="Algeria">Algeria</option>
                                                <option value="American Samoa">American Samoa</option>
                                                <option value="Andorra">Andorra</option>
                                            </select>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top position-relative">
                                            <label>Resident in<b> *</b></label>
                                            <select id="applicantResidentList" name="applicantResident"
                                                    class="form-control selectpicker"
                                                    data-live-search="true" multiple
                                                    title="Country of Residence" required>
                                                <option value="any">Any Country</option>
                                                <option value="Afghanistan">Afghanistan</option>
                                                <option value="Åland Islands">Åland Islands</option>
                                                <option value="Albania">Albania</option>
                                                <option value="Algeria">Algeria</option>
                                                <option value="American Samoa">American Samoa</option>
                                                <option value="Andorra">Andorra</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 align-top">
                                            <label>Applicant Gender<b> *</b></label>
                                            <select id="applicantGenderList" name="applicantGender"
                                                    class="form-control custom-select" required>
                                                <option value="MALE">Male</option>
                                                <option value="FEMALE">Female</option>
                                                <option value="BOTH">Both</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="d-block">
                                        <label>Applicant Age Limit</label><b> *</b>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top mb-1">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Min</div>
                                                </div>
                                                <input id="applicantAgeFrom" name="applicantAgeFrom" type="number" min="1"
                                                       class="form-control overflow-hidden">
                                            </div>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top mb-1">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Max</div>
                                                </div>
                                                <input id="applicantAgeTo" name="applicantAgeTo" type="number" min="1"
                                                       class="form-control overflow-hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-100 align-top">
                                            <label>Minimum Degree Held</label><b> *</b>
                                            <select id="applicantMinimumDegreeHeldList" name="applicantMinimumDegreeHeld"
                                                    class="form-control custom-select" required>
                                                <option value="Primary School">Primary School</option>
                                                <option value="Secondary School">Secondary School</option>
                                                <option value="Diploma">Diploma</option>
                                                <option value="Bachelor">Bachelor</option>
                                                <option value="Master">Master</option>
                                                <option value="Ph.D">Ph.D</option>
                                                <option value="no">No Education Level is Required</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>In Major<b> *</b></label>
                                        <button type="button" class="btnModal btn btn-block" data-toggle="modal"
                                                data-target="#majorsRequiredModal">Major
                                        </button>
                                    </div>
                                    <div class="modal fade" id="majorsRequiredModal" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Select Majors</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <select id="majorsRequiredList" name="opportunityMajor" data-rule-required="true"
                                                            class="form-control selectpicker" multiple
                                                            data-live-search="true" required>
                                                        <option value="any" selected>Any</option>
                                                        <option value="Accounting" selected>Accounting</option>
                                                        <option value="Actuarial Science">Actuarial Science</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="opportunity-training">
                                        <div class="form-group">
                                            <label>Required Knowledge and Experience<b> *</b></label>
                                            <textarea class="form-control noresize" rows="3" id="applicantExperience"
                                                      name="applicantExperience"
                                                      required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Other Requirements</label>
                                            <textarea class="form-control noresize" rows="3" id="applicantOtherRequirements"
                                                      name="applicantOtherRequirements"></textarea>
                                        </div>
                                    </div>

                                    <hr class="pb-3">
                                    <h4>Eligibility Criteria</h4>
                                    <small>All applicants must also meet the following eligibility requirements</small>
                                    <small class="d-block mb-3">in order to qualify for opportunity.</small>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Minimum (School) GPA<small> a scale of 4.0</small></label>
                                            <input id="schoolGPA" name="schoolGPA" type="number" min="0" max="4"
                                                   class="form-control overflow-hidden" placeholder="3.5"
                                                   data-toggle="tooltip" data-placement="bottom"
                                                   title="School GPA out of 100">
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Minimum (University) GPA<small> a scale of 4.0</small></label>
                                            <input id="universityGPA" name="universityGPA" type="number" min="0" max="4"
                                                   class="form-control overflow-hidden" placeholder="3.5"
                                                   data-toggle="tooltip" data-placement="bottom"
                                                   title="University GPA out of 4">
                                        </div>
                                    </div>
                                    <div class="form-group mr-2">
                                        <label>English Level</label><b> *</b>
                                        <select id="englishLevel" name="englishLevel" class="form-control custom-select" required>
                                            <option value="A1">A1 (Beginner)</option>
                                            <option value="A2">A2 (Elementary English)</option>
                                            <option value="B1">B1 (Intermediate English)</option>
                                            <option value="B2">B2 (Upper-Intermediate English)</option>
                                            <option value="C1">C1 (Advanced English)</option>
                                            <option value="C2">C2 (Proficiency English)</option>
                                            <option value="NS">Not required</option>
                                        </select>
                                    </div>

                                    <h6>Special Certificate/s</h6>
                                    <div class="form-group certificate-div" id="ccc">
                                        <div class="certificate mb-2">
                                            <div class="d-inline-block col-5 mb-1 align-top p-0">
                                                <input id="certificate1" name="certificate1" type="text" class="form-control" placeholder="IELTS" data-rule-required="true">
                                            </div>
                                            <div class="d-inline-block col-5 mb-1 align-top p-0">
                                                <input id="score1" name="score1" type="number" class="form-control d-inline-block score" placeholder="Score 1-10"
                                                       data-rule-max="10" data-rule-min="1">
                                            </div>
                                            <div class="d-inline-block col-1 p-0">
                                                <button class="btn delete-current">
                                                    <i class="fa fa-times-circle" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <button id="addCertificate" type="button" class="btn">
                                            <i class="fa fa-plus"></i><span> Add More Certificates</span>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- Step 5 => APPLYING (Training, internship) -->
                            <div id="step-5">
                                <h4>How To Apply</h4>
                                <div id="form-step-3" role="form">
                                    <div class="w-100 position-relative">
                                        <label>Required Documents</label><b> *</b>
                                        <select id="requiredDocumentList" name="opportunityRequiredDocuments"
                                                class="form-control selectpicker" multiple required>
                                            <option value="CV">CV</option>
                                            <option value="Motivation Letter">Motivation Letter</option>
                                            <option value="Transcript of Records">Transcript of Records</option>
                                            <option value="University Certificate">University Certificate</option>
                                            <option value="Copy of Passport">Copy of Passport</option>
                                            <option value="Personal Photo">A personal photo of the same size as the passport
                                                photo
                                            </option>
                                            <option value="Research Proposal">Research Proposal</option>
                                            <option value="Language Certificate">Language Certificate</option>
                                            <option value="Recommendation Letter">Recommendation Letter</option>
                                        </select>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label>Other Required Documents</label>
                                        <textarea class="form-control noresize" rows="3" id="otherRequiredDocuments" name="otherRequiredDocuments"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>How to apply for the opportunity?<b> *</b></label>
                                        <textarea class="form-control noresize" rows="3" id="howToApplySteps"
                                                  placeholder="Please provide a descriptive summary about all steps required from applicants to complete their applications successfully."
                                                  required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="d-block">Applying is through<b> *</b></label>
                                        <div class="d-inline-block w-md-50">
                                            <div class="custom-control custom-radio">
                                                <input id="throughOur" name="applyingThrough" type="radio" value="ourWeb"
                                                       class="custom-control-input" checked="">
                                                <label for="throughOur" class="custom-control-label  cursor-pointer"> Our Website</label>

                                            </div>
                                        </div>
                                        <div class="d-inline-block w-md-50">
                                            <div class="custom-control custom-radio">
                                                <input id="throughProvider" name="applyingThrough" type="radio" value="providerWeb"
                                                       class="custom-control-input">
                                                <label for="throughProvider" class="custom-control-label cursor-pointer"> Provider Website</label>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group oppLink d-none hidden">
                                        <label>Applying Link for Opportunity<b> *</b></label>
                                        <input id="applicationLink" name="opportunityLink" type="url"
                                               class="form-control overflow-hidden" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Illustration File of The Opportunity</label>
                                        <div class="custom-file">
                                            <input type="file" id="illustrationFile" name="opportunityFile" accept="application/pdf"/>
                                            <label for="illustrationFile" class="custom-file-label cursor-pointer">Choose pdf file</label>
                                            <div><span id="fileError" class="text-danger"></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Step 6 => Finish -->
                            <div id="step-6">
                                <h4 class="pb-3">Thank you for submitting your opportunity!</h4>
                                <div id="form-step-4" role="form">
                                    <div class="form-group">
                                        <p id="finishStepText">
                                            Our content team will revise it soon
                                            and get back to you if they needed any extra information.
                                            We'll let you know when it get's published.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- All Steps End -->
                    </div><!-- Smart Wizard html End -->
                </form>
            </div><!-- Stepper End -->
        </div>
    </div><!-- Add Opportunity Div-->
</section>

</body>
<%@include file="parts/footer.html" %>
</html>
