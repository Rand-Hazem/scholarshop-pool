<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <form:form action="/scholarship/share" method="post" id="shareShForm" name="shareShForm" role="form" data-toggle="validator" modelAttribute="wrapper">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
                                            <form:input id="opportunityTitle" path="scholarship.title" type="text"
                                                        class="form-control overflow-hidden"
                                                        placeholder="opportunity Title" required="true"/>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50  align-top">
                                            <label>Opportunity Type</label><b> *</b>
                                            <form:select id="opportunityTypeList" path="scholarship.type"
                                                         class="form-control custom-select" required="true">
                                                <option value="SCHOLARSHIP" selected="selected">Scholarships</option>
                                                <option value="EXCHANGE">Residences and Exchange Programs</option>
                                                <option value="INTERNSHIP">Internships</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Opportunity degree<b> *</b></label>
                                            <form:select id="opportunityDegree" path="scholarship.degree" class="form-control custom-select" required="true">
                                                <option value="BACHELOR">Bachelor</option>
                                                <option value="BACHELOR_MASTER">Bachelor, Master</option>
                                                <option value="BACHELOR_MASTER_DOCTORAL">Bachelor, Master, Doctoral</option>
                                                <option value="MASTER">Master</option>
                                                <option value="MASTER_DOCTORAL">Master, Doctoral</option>
                                                <option value="DOCTORAL">Doctoral</option>
                                            </form:select>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Available Seats<b> *</b></label>
                                            <form:input id="opportunitySeats" path="scholarship.seats" type="number" min="1"
                                                        class="form-control overflow-hidden" value="1"
                                                        placeholder="Available Seats" required="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Opportunity Description</label><b> *</b>
                                        <form:textarea class="form-control noresize" id="opportunityDescription"
                                                       path="scholarship.description"
                                                       placeholder="Please provide a descriptive summary of your opportunity."
                                                       required="true"></form:textarea>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Opportunity will take place in</label><b> *</b>
                                            <form:select id="opportunityCountry" path="scholarship.country"
                                                         class="form-control custom-select" required="true">
                                                <%@include file="parts/countries.html" %>
                                            </form:select>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>City</label><b> *</b>
                                            <form:input id="opportunityCity" path="scholarship.city" type="text"
                                                        class="form-control overflow-hidden"
                                                        placeholder="Opportunity City" required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Applying deadline</label>
                                        <div id="deadlineDiv">
                                            <form:input id="opportunityDeadline" path="scholarship.applyDeadline" type="date"
                                                        class="form-control" onkeydown="return false"/>
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
                                                    <form:input id="opportunityDurationFrom" path="scholarship.durationFrom"
                                                                type="date" class="form-control" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">TO</div>
                                                    </div>
                                                    <form:input id="opportunityDurationTo" path="scholarship.durationTo" type="date"
                                                                class="form-control" required="true"/>
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
                                                <form:select id="opportunityFund" path="scholarship.fundType"
                                                             class="form-control custom-select align-top" required="true">
                                                    <option value="FULL">Full Funding</option>
                                                    <option value="PARTIAL">Partial Funding</option>
                                                    <option value="SALARY">Monthly Salary</option>
                                                    <option value="NO">No Funding</option>
                                                </form:select>
                                            </div>
                                            <div class="w-md-50 d-inline-block align-top">
                                                <form:input id="amount" path="scholarship.fundAmount" type="number" placeholder="amount in $"
                                                            class="form-control align-top" value="0" required="true"/>
                                            </div>
                                        </div>
                                        <div id="fundCovering" class="w-100 align-top full partial">
                                            <label>What does the funding cover?</label><b> *</b>
                                            <div id="fundCover" class="w-100">
                                                <div class="col-sm-11 col-md-5  d-inline-block">
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="TUITION_FEE"/> Tuition Fee
                                                    </label>
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="TRAVEL_COSTS"/> Travel Costs
                                                    </label>
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="VISA_COSTS"/> Visa Costs
                                                    </label>
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="ACCOMMODATION"/> Accommodation
                                                    </label>
                                                </div>
                                                <div class="col-sm-11 col-md-5 d-inline-block">
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="FOOD"/> Food
                                                    </label>
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="PARTICIPATION_FEES"/> Participation Fees
                                                    </label>
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="STIPEND_LIVING_ALLOWANCE"/> Stipend/ Living allowance
                                                    </label>
                                                    <label>
                                                        <form:checkbox path="scholarship.fundCover" value="HEALTH_INSURANCE"/> Health insurance
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Opportunity Website Address</label>
                                        <form:input id="opportunityWebsite" path="scholarship.officialWebsite" type="url"
                                                    class="form-control overflow-hidden"
                                                    placeholder="Does the opportunity have a webpage offering more information?"/>
                                    </div>
                                    <div class="form-group">
                                        <label>What does the successful applicant gain from your
                                            opportunity?
                                            <span style="color: #223D4E;"> Opportunity privileges</span></label>
                                        <form:textarea id="opportunityPrivileges" path="scholarship.privilege"
                                                       class="form-control noresize"></form:textarea>
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
                                        <form:input type="hidden" id="providerOrg" path="scholarship.providreOrg"/>
                                        <label class="d-block">Provider Organization<b> *</b></label>
                                        <div class="d-inline-block w-md-50 align-top">
                                            <select id="providerOrgList" name="providerOrgList" class="custom-select" data-organization="true" required>
                                                <option selected disabled> -- Select Type --</option>
                                            </select>
                                        </div>
                                        <div class="d-inline-block w-md-50 align-top">
                                            <input id="otherProviderOrg" name="otherProviderOrg" type="text" class="form-control"
                                                   placeholder="Provider Organization">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="d-block">Special Program</label>
                                        <form:input type="hidden" id="specialProgram" path="scholarship.specialProgram"/>
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
                                                <form:input id="opportunityEmployerName" path="trainingInformation.companyName"
                                                            type="text" class="form-control overflow-hidden"
                                                            placeholder="Employer Name" required="true"/>
                                            </div>
                                            <div class="d-inline-block w-md-50 align-top">
                                                <label>Business or Products</label><b> *</b>
                                                <form:input id="opportunityBusiness" path="trainingInformation.product" type="text"
                                                            class="form-control overflow-hidden"
                                                            placeholder="Business or Products" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Employer Website</label>
                                            <form:input id="employerWebsite" path="trainingInformation.companyWebsite"
                                                        type="url" class="form-control overflow-hidden" value="https://"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Location of Placement</label><b> *</b>
                                            <form:input id="oppLocation" path="trainingInformation.location" type="text" class="form-control"
                                                        placeholder="Full Location of Placement" required="true"/>
                                        </div>
                                    </div>

                                    <hr class="pb-3">
                                    <div class="opportunity-scholsrship">
                                        <h4>Academic Information of Opportunity</h4>
                                        <div class="form-group">
                                            <label>Host University/Institution<b> *</b></label>
                                            <form:input id="hostUniversity" path="academicInformation.hostUniversity" type="text" class="form-control"
                                                        placeholder="Host University/Institution"/>
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
                                                        <form:select id="opportunityMajorList" path="academicInformation.major" data-rule-required="true"
                                                                     class="form-control selectpicker" multiple="true" data-live-search="true" required="true">
                                                            <option value="any">Any</option>
                                                            <%@include file="parts/majors.html" %>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="d-block">Teaching Language<b> *</b></label>
                                            <form:select id="teachingLanguageList" path="academicInformation.teachingLanguage" class="custom-select" required="true">
                                                <option value="ENGLISH">English</option>
                                                <option value="HOST_COUNTRY_LANG">Host Country Language</option>
                                                <option value="BOTH">Both</option>
                                                <option value="UNDEFINED">undefined</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="opportunity-training">
                                        <h4>Training Opportunity Details</h4>

                                        <div class="form-group">
                                            <label>Training Language<b> *</b></label>
                                            <form:select id="trainingLanguageList" path="trainingInformation.trainingLanguage" class="custom-select" required="true">
                                                <option value="ENGLISH">English</option>
                                                <option value="HOST_COUNTRY_LANG">Host Country Language</option>
                                                <option value="BOTH">Both</option>
                                                <option value="UNDEFINED">undefined</option>
                                            </form:select>
                                        </div>
                                        <div class="form-group">
                                            <label>Working Environment</label><b> *</b>
                                            <form:textarea id="opportunityEnvironment" path="trainingInformation.workEnvironment"
                                                           class="form-control noresize" placeholder="position or traning field" required="true"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Responsibilities</label><b> *</b>
                                            <form:textarea id="opportunityResponsibilities" path="trainingInformation.responsibility"
                                                           class="form-control noresize" required="true"></form:textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Expected to Gain/Benefits</label>
                                            <form:textarea id="opportunityBenefits" path="trainingInformation.benefit"
                                                           class="form-control noresize"
                                                           placeholder="When an applicant gets the opportunity, what are their benefits?"/>

                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-4 align-top">
                                                <label>Number of Weeks Offered</label><b> *</b>
                                                <form:input id="opportunityWeaks" path="trainingInformation.weekOffered" type="number" min="1"
                                                            class="form-control overflow-hidden" value="4" required="true"/>
                                            </div>
                                            <div class="col-lg-4 align-top">
                                                <label>Working days per Weak</label><b> *</b>
                                                <form:input id="opportunityDays" path="trainingInformation.workDayPerWeek" type="number"
                                                            class="form-control overflow-hidden" value="5" required="true"
                                                            placeholder="Working days per Weak"/>
                                            </div>
                                            <div class="col-lg-4 align-top">
                                                <label>Daily Working Hours</label><b> *</b>
                                                <form:input id="opportunityHours" path="trainingInformation.workHourPerDay" type="number"
                                                            class="form-control overflow-hidden"
                                                            placeholder="Daily Working Hours" value="8" required="true"/>
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
                                        <div class="d-inline-block w-100 w-md-50 align-bottom position-relative">
                                            <label>Nationality<b> *</b></label>
                                            <form:select id="applicantNationalityList" path="applicantRequirement.nationality" data-live-search="true"
                                                         class="form-control selectpicker" multiple="true" required="true">
                                                <%@include file="parts/countries.html" %>
                                            </form:select>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-bottom position-relative">
                                            <label>Resident in<b> *</b></label>
                                            <form:select id="applicantResidentList" path="applicantRequirement.residenceIn" class="form-control custom-select"
                                                         data-live-search="true" title="Country of Residence" required="true">
                                                <option value="ANY">Any Country</option>
                                                <option value="NATIONALITY_COUNTY">nationality county</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 align-top">
                                            <label>Applicant Gender<b> *</b></label>
                                            <form:select id="applicantGenderList" path="applicantRequirement.gender"
                                                         class="form-control custom-select" required="true">
                                                <option value="MALE">Male</option>
                                                <option value="FEMALE">Female</option>
                                                <option value="BOTH" selected>Both</option>
                                            </form:select>
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
                                                <form:input id="applicantAgeFrom" path="applicantRequirement.minAge" type="number" min="1"
                                                            class="form-control overflow-hidden"/>
                                            </div>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top mb-1">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Max</div>
                                                </div>
                                                <form:input id="applicantAgeTo" path="applicantRequirement.maxAge" type="number" min="1"
                                                            class="form-control overflow-hidden"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-100 align-top">
                                            <label>Minimum Degree Held</label><b> *</b>
                                            <form:select id="applicantMinimumDegreeHeldList" path="applicantRequirement.minDegree"
                                                         class="form-control custom-select" required="true">
                                                <option value="PRIMARY_SCHOOL">Primary School</option>
                                                <option value="SECONDARY_SCHOOL">Secondary School</option>
                                                <option value="DIPLOMA">Diploma</option>
                                                <option value="BACHELOR">Bachelor</option>
                                                <option value="MASTER">Master</option>
                                                <option value="DOCTORAL">Ph.D</option>
                                                <option value="NO_CONSTRAINT">No constraint</option>
                                            </form:select>
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
                                                    <form:select id="majorsRequiredList" path="applicantRequirement.major" data-rule-required="true"
                                                                 class="form-control selectpicker" multiple="true" data-live-search="true" required="true">
                                                        <option value="any">Any</option>
                                                        <%@include file="parts/majors.html" %>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="opportunity-training">
                                        <div class="form-group">
                                            <label>Required Knowledge and Experience<b> *</b></label>
                                            <form:textarea class="form-control noresize" id="applicantExperience"
                                                      path="tranningApplReq.knowledgeAndExperience" required="true" />
                                        </div>
                                        <div class="form-group">
                                            <label>Other Requirements</label>
                                            <form:textarea class="form-control noresize" id="applicantOtherRequirements"
                                                      path="tranningApplReq.other"/>
                                        </div>
                                    </div>

                                    <hr class="pb-3">
                                    <h4>Eligibility Criteria</h4>
                                    <small>All applicants must also meet the following eligibility requirements</small>
                                    <small class="d-block mb-3">in order to qualify for opportunity.</small>
                                    <div class="form-group">
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Minimum (School) GPA<small> a scale of 4.0</small></label>
                                            <form:input id="schoolGPA" path="applicantRequirement.minSchoolGPA" type="number" min="0" max="4"
                                                        class="form-control overflow-hidden" placeholder="3.5"
                                                        data-toggle="tooltip" data-placement="bottom"
                                                        title="School GPA out of 100"/>
                                        </div>
                                        <div class="d-inline-block w-100 w-md-50 align-top">
                                            <label>Minimum (University) GPA<small> a scale of 4.0</small></label>
                                            <form:input id="universityGPA" path="applicantRequirement.minUnivGPA" type="number" min="0" max="4"
                                                        class="form-control overflow-hidden" placeholder="3.5"
                                                        data-toggle="tooltip" data-placement="bottom"
                                                        title="University GPA out of 4"/>
                                        </div>
                                    </div>
                                    <div class="form-group mr-2">
                                        <label>English Level</label><b> *</b>
                                        <form:select id="englishLevel" path="applicantRequirement.englishLevel" class="form-control custom-select" required="true">
                                            <option value="A1">A1 (Beginner)</option>
                                            <option value="A2">A2 (Elementary English)</option>
                                            <option value="B1">B1 (Intermediate English)</option>
                                            <option value="B2">B2 (Upper-Intermediate English)</option>
                                            <option value="C1">C1 (Advanced English)</option>
                                            <option value="C2">C2 (Proficiency English)</option>
                                            <option value="NS">Not specific</option>
                                        </form:select>
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
                                        <form:select id="requiredDocumentList" path="detail.requiredDocumentList"
                                                     class="form-control selectpicker" multiple="true" required="true">
                                            <option value="CV">CV</option>
                                            <option value="MOTIVATION_LETTER">Motivation Letter</option>
                                            <option value="TRANSCRIPT_RECORDS">Transcript of Records</option>
                                            <option value="UNIVERSITY_CERTIFICATE">University Certificate</option>
                                            <option value="PASSPORT_COPY">Copy of Passport</option>
                                            <option value="PERSONAL_PHOTO">A personal photo of the same size as the passport photo</option>
                                            <option value="PROPOSAL">Research Proposal</option>
                                            <option value="RECOMMENDATION_LETTER">Recommendation Letter</option>
                                        </form:select>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label>Other Required Documents</label>
                                        <form:textarea class="form-control noresize" id="otherRequiredDocuments" path="detail.otherRequiredDoc"></form:textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>How to apply for the opportunity?<b> *</b></label>
                                        <form:textarea class="form-control noresize" id="howToApplySteps" path="detail.howToApply" required="true"
                                                       placeholder="Please provide a descriptive summary about all steps required from applicants to complete their applications successfully."/>

                                    </div>
                                    <div class="form-group">
                                        <label class="d-block">Applying is through<b> *</b></label>
                                        <div class="d-inline-block w-md-50">
                                            <div class="custom-control custom-radio">
                                                <form:radiobutton id="throughOur" path="detail.applyThroughProviderWebsite" value="false"
                                                                  class="custom-control-input" checked="true"/>
                                                <label for="throughOur" class="custom-control-label  cursor-pointer"> Our Website</label>

                                            </div>
                                        </div>
                                        <div class="d-inline-block w-md-50">
                                            <div class="custom-control custom-radio">
                                                <form:radiobutton id="throughProvider" path="detail.applyThroughProviderWebsite" value="true"
                                                                  class="custom-control-input"/>
                                                <label for="throughProvider" class="custom-control-label cursor-pointer"> Provider Website</label>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group oppLink d-none hidden">
                                        <label>Applying Link for Opportunity<b> *</b></label>
                                        <form:input id="applicationLink" path="detail.urlProviderApplyForm" type="url"
                                                    class="form-control overflow-hidden" required="true"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Illustration File of The Opportunity</label>
                                        <div class="custom-file">
                                            <input type="file" id="illustrationFile" path="illustrationFileName" accept="application/pdf"/>
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
                    </div>
                    <!-- Smart Wizard html End -->
                </form:form>
            </div><!-- Stepper End -->
        </div>
    </div><!-- Add Opportunity Div-->
</section>

</body>
<%@include file="parts/footer.html" %>
</html>
