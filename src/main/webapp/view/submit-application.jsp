<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <form:form id="submitApplicationForm" name="form" action="/student/scholarship/${scholarshipId}/apply"
                           data-toggle="validator" method="post" modelAttribute="profile">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="scholarshipId" value="${scholarshipId}"/>

                    <c:if test="${alreadyApply}">
                        <div class="alert alert-info" role="alert">
                            You already apply for this scholarship, any change will update your apply-profile.
                        </div>
                    </c:if>

                    <c:if test="${failed}">
                        <div class="alert alert-info" role="alert">
                            Something went wrong, please try agin
                        </div>
                    </c:if>

                    <h3 class="mb-4">Personal Information</h3>
                    <div class="row">
                            <%--                        <div class="form-group col-md-6">--%>
                            <%--                            <input required="true" class="form-control" type="text" placeholder="First Name"--%>
                            <%--                                   disabled="true"/>--%>
                            <%--                        </div>--%>
                            <%--                        <div class="form-group col-md-6">--%>
                            <%--                            <input required="true" class="form-control" type="text" placeholder="Last Name"--%>
                            <%--                                   disabled="true"/>--%>
                            <%--                        </div>--%>
                            <%--                        <div class="form-group col-md-6">--%>
                            <%--                            <input required="true" class="form-control" type="email" placeholder="Email"--%>
                            <%--                                   disabled="true"/>--%>
                            <%--                        </div>--%>
                        <div class="form-group col-md-6">
                            <label>Age</label>
                            <form:input required="true" class="form-control" type="number" path="age" placeholder="Age"
                                        min="15" max="90"/>
                            <form:errors path="age" class="error"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Min Degree</label>
                            <form:select id="opportunityDegree" path="degree" class="form-control custom-select" required="true"
                            data-selected="${profile.degree}">
                                <option value="BACHELOR">Bachelor</option>
                                <option value="MASTER">Master</option>
                                <option value="DOCTORAL">Doctoral</option>
                                <option value="DIPLOMA">Diploma</option>
                            </form:select>
                            <form:errors path="degree" class="error"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Major</label>
                            <form:select required="true" class="form-control custom-select" path="major" data-selected="${profile.major}">
                                <%@include file="parts/majors.html" %>
                            </form:select>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Nationality</label>
                            <form:select required="true" class="form-control custom-select" path="nationality"
                                         data-selected="${profile.nationality}">
                                <%@include file="parts/countries.html" %>
                            </form:select>
                            <form:errors path="nationality" class="error"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Resident in</label>
                            <form:input required="true" class="form-control" path="resident" type="text"
                                        placeholder="Resident Country"/>
                            <form:errors path="resident" class="error"/>
                        </div>
                    </div>
                    <hr>
                    <h3 class="mb-4">Eligibility Criteria</h3>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label>Complete year of study</label>
                            <form:input required="true" class="form-control" type="number" path="completeYearOfStudy"
                                        placeholder="Completed Year Of Study"/>
                            <form:errors path="completeYearOfStudy" class="error"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>School GPA</label>
                            <form:input required="true" class="form-control" type="number" path="schoolGpa"
                                        placeholder="School GPA"/>
                            <form:errors path="schoolGpa" class="error"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>University GPA</label>
                            <form:input required="true" class="form-control" type="number" path="universityGpa"
                                        placeholder="University GPA"/>
                            <form:errors path="universityGpa" class="error"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label>English level</label>
                            <form:select id="englishLevel" path="englishLevel" class="form-control custom-select" required="true"
                                         data-selected="${profile.englishLevel}">
                                <option value="A1">A1 (Beginner)</option>
                                <option value="A2">A2 (Elementary English)</option>
                                <option value="B1">B1 (Intermediate English)</option>
                                <option value="B2">B2 (Upper-Intermediate English)</option>
                                <option value="C1">C1 (Advanced English)</option>
                                <option value="C2">C2 (Proficiency English)</option>
                                <option value="NS">Not specific</option>
                            </form:select>
                            <form:errors path="englishLevel" class="error"/>
                        </div>

                        <div class="form-group col-12">
                            <label>Certification</label><b> *</b><br>
                            <c:if test="${not empty profile.certificates}">
                                <p>already in your apply profile</p>
                                <c:forEach var="item" items="${profile.certificates}">
                                    <div class="col-sm-11 col-md-5 d-inline-block">
                                        <label>
                                            <form:checkbox path="certificates" value="${item}" checked="true"/>
                                            &nbsp; ${item}
                                        </label>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <c:if test="${not empty applicantRequirement.specialCertificateScoreList}">
                                <p>certificates required for scholarship
                                    <small>check if you have certificate</small>
                                </p>
                                <c:forEach var="item" items="${applicantRequirement.specialCertificateScoreList}">
                                    <div class="col-sm-11 col-md-5 d-inline-block">
                                        <label>
                                            <form:checkbox path="certificates" value="${item.certificate}"/>
                                            &nbsp; ${item.certificate}
                                        </label>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div class="col-12 form-group">
                            <label>Upload document on any drive, and provide us with the like</label><b> *</b>
                            <br><small>please note the hint of how to organize files</small>
                            <form:input class="form-control" type="url" path="driveLink" data-toggle="tooltip" data-html="true"
                                        title="<img src='${contextPath}/resources/static/img/submit-application-drive-uploaded-file-tooltip.png'/>"
                                        placeholder="Upload required document on drive and put the link here"/>
                        </div>

                    </div>
                    <input type="submit" class="btn btn-add float-right" value="submit"/>
                </form:form>
            </div>
        </div>
    </div>
</section>
<%@include file="parts/footer.html" %>
</body>
</html>