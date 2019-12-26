<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>submit application</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@include file="parts/links.html" %>

    <script src="${contextPath}/resources/static/js/submit-application.js"></script>
</head>


<body>

<jsp:include page="parts/navbar.jsp"/>


<section class="submit-application page-header">
    <div class="headerText">
        <h1 class="animated fadeIn">Submit Your Application</h1>
        <h2 class="animated fadeInLeft">now</h2>
    </div>
</section>

<section class="submit-application">
    <div class="container">
        <div class="row d-flex justify-content-center ">
            <div class="col-11 col-md-10 col-lg-8 shadow p-3 mb-5 bg-white rounded">
                <form id="submitApplicationForm" action="" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" path="scholarshipId"/>
                    <h3 class="mb-4">Personal Information</h3>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <input required class="form-control" type="text" name="fname" placeholder="First Name" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <input required class="form-control" type="text" name="lname" placeholder="Last Name" disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <input required class="form-control" type="email" name="email" placeholder="Email">
                        </div>
                        <div class="form-group col-md-6">
                            <input required class="form-control" type="number" name="age" placeholder="Age">
                        </div>
                        <div class="form-group col-md-6">
                            <form:select id="opportunityDegree" path="degree" class="form-control custom-select" required="true">
                                <option value="BACHELOR">Bachelor</option>
                                <option value="MASTER">Master</option>
                                <option value="DOCTORAL">Doctoral</option>
                                <option value="DIPLOMA">Diploma</option>
                            </form:select>
                        </div>
                        <div class="form-group col-md-6">
                            <form:select required="true" class="form-control custom-select" path="major">
                                <%@include file="parts/majors.html" %>
                            </form:select>
                        </div>
                        <div class="form-group col-md-6">
                            <form:select required="true" class="form-control custom-select" path="nationality">
                                <%@include file="parts/countries.html" %>
                            </form:select>
                        </div>
                        <div class="form-group col-md-6">
                            <form:input required="true" class="form-control" path="resident" type="text"
                                        placeholder="Resident Country" />
                        </div>
                    </div>
                    <hr>
                    <h3 class="mb-4">Eligibility Criteria</h3>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <form:input required="true" class="form-control" type="number" path="completeYearOfStudy"
                                        placeholder="Completed Year Of Study" />
                        </div>
                        <div class="form-group col-md-6">
                            <form:input required="true" class="form-control" type="number" path="schoolGpa"
                                        placeholder="School GPA" />
                        </div>
                        <div class="form-group col-md-6">
                            <form:input required="true" class="form-control" type="number" path="universityGpa"
                                        placeholder="University GPA" />
                        </div>
                        <div class="form-group col-md-6">
                            <form:select id="englishLevel" path="englishLevel" class="form-control custom-select" required="true">
                                <option value="A1">A1 (Beginner)</option>
                                <option value="A2">A2 (Elementary English)</option>
                                <option value="B1">B1 (Intermediate English)</option>
                                <option value="B2">B2 (Upper-Intermediate English)</option>
                                <option value="C1">C1 (Advanced English)</option>
                                <option value="C2">C2 (Proficiency English)</option>
                                <option value="NS">Not specific</option>
                            </form:select>
                            <form:errors path="applicantRequirement.englishLevel" class="error"/>
                        </div>
                        <div class="form-group col-12">
                            <label>Required Certification</label><b> *</b><br>
                            <small>check if you have certifcate</small>
                            <div class="w-100 required-certificate-box">
                                <div class="col-sm-11 col-md-5 d-inline-block">
                                    <label>
                                        <input type="checkbox" name="RequiredCertification" value="C1"> C1
                                    </label>

                                </div>
                                <div class="col-sm-11 col-md-5 d-inline-block">
                                    <label>
                                        <input type="checkbox" name="RequiredCertification" value="C2"> C2
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 form-group">
                            <label>Uploade required document on any drive, and provide us with the like</label><b> *</b>
                            <br><small>please note the hint of how to organize files</small>
                            <form:input class="form-control" type="url" path="driveLink"
                                        data-toggle="tooltip" data-html="true"
                                        title="<img src='${contextPath}/resources/static/img/submit-application-drive-uploaded-file-tooltip.png'/>"
                                        placeholder="Upload Required Document" />
                        </div>

                    </div>
                    <button type="submit" class="btn btn-add float-right">submit</button>
                </form>
            </div>
        </div>
    </div>
</section>
<%@include file="parts/footer.html" %>
</body>
</html>