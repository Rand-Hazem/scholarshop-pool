<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="internship ">

    <!---------------------- Provider Information & Academic Information ----------------------->
    <div class="container view-opportunity-box">
        <h2><i class="fa fa-briefcase"></i> Opportunity Details#1</h2><br><br>

        <h4>Provider Information</h4>
        <p><b>Advertiser: </b> <span id="advertiser">${user.firstName}  ${user.lastName}</span></p>
        <p><b>Provider Organization: </b> <span id="provider-organization">${scholarship.providreOrg}</span></p>
        <p><b>Business or Products: </b> <span id="business-products">${trainingInformation.product}</span></p>
        <p><b>Employer Website: </b> <a id="employer-website" href="">${trainingInformation.companyWebsite}</a></p>
        <p><b>Location of Placement: </b> <span id="location">${trainingInformation.location}</span></p><br><br>

        <h4>Training Opportunity Details</h4>
        <p><b>Training Language: </b><span id="training-language">${trainingInformation.trainingLanguage}</span></p>

        <p><b>Working Environment</b></p>
        <p id="working-environment">
            ${trainingInformation.workEnvironment}
        </p>

        <p><b>Responsibilities</b></p>
        <p id="responsibilities">
            ${trainingInformation.responsibility}
        </p>

        <p><b>Expected to Gain/Benefits</b></p>
        <p id="benefits">
            ${trainingInformation.benefit}
        </p>

        <p><b>Number of Weeks Offered: </b><span id="weaks">${trainingInformation.weekOffered}</span></p>
        <p><b>Working days per Weak: </b><span id="days">${trainingInformation.workDayPerWeek}</span></p>
        <p><b>Daily Working Hours: </b><span id="hours">${trainingInformation.workHourPerDay}</span></p>
    </div>

    <!-------- Applicant Requirements & Eligibility Criteria -------->
    <div class="container view-opportunity-box">
        <h2><i class="fa fa-user"></i> Opportunity Details#2</h2><br><br>

        <h4>Applicant Requirements</h4>
        <p id="nationality"><b>Applicant Nationality: </b></p>
        <c:forEach items="${tranningApplicantRequirment.nationality}" var="nationality">
            <p data-country="${nationality}">${nationality}</p>
        </c:forEach>
        <p><b>Resident in: </b> <span id="resident-country">${tranningApplicantRequirment.residenceIn} </span></p>
        <p><b>Applicant Gender: </b> <span id="gender">${tranningApplicantRequirment.gender} </span></p>
        <p><b>Fluent In: </b> <span id="fluent"> fluent!!!!</span></p>
        <p><b>Applicant Age Limit: </b> From <span id="age-from">${tranningApplicantRequirment.minAge}</span>
            To <span id="age-to">${tranningApplicantRequirment.maxAge}</span></p>
        <p><b>Minimum Degree Held: </b> <span id="min-degree">${tranningApplicantRequirment.minDegree}</span></p>
        <p id="min-degree-major"><b>In Major: </b></p>
        <c:forEach items="${tranningApplicantRequirment.major}" var="majors">
            <p data-major="${majors}"></p>
        </c:forEach>

        <c:if test=" ${empty tranningApplicantRequirment.knowledgeAndExperience}">
            <p><b>Required Knowledge and Experience</b></p>
            <p id="Knowledge">
                    ${tranningApplicantRequirment.knowledgeAndExperience}
            </p>
        </c:if>

        <c:if test=" ${empty tranningApplicantRequirment.knowledgeAndExperience}">
            <p><b>Other Requirements</b></p>
            <p id="other-requirements">
                    ${tranningApplicantRequirment.other}
            </p><br><br>
        </c:if>

        <!-------- Eligibility Criteria -------->
        <h4>Eligibility Criteria</h4>
        <p><b>Minimum (School) GPA: </b> <span id="school-gpa">${tranningApplicantRequirment.minSchoolGPA}</span></p>
        <p><b>Minimum (university) GPA  </b> <span id="university-gpa">${tranningApplicantRequirment.minUnivGPA}</span></p>
        <p><b>English Level: </b> <span id="english-level">${tranningApplicantRequirment.englishLevel}</span></p>
        <p><b>Special Certificate/s</b></p>
        <table>
            <c:forEach items="${tranningApplicantRequirment.specialCertificateScoreList}" var="certificates">
                <tr>
                    <td>${certificates.certificate}, </td>
                    <td>${certificates.score}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!----------------------  How to Apply ----------------------->
    <div class="container view-opportunity-box">
        <h2><i class="fa fa-file"></i> How to Apply</h2><br><br>
        <c:if test="${empty scholarshipApplicationDetail.requiredDocumentList}">
            <h3>Required Documents </h3>
            <c:forEach items="${scholarshipApplicationDetail.requiredDocumentList}" var="item">
                <p>${fn:replace(item, "_", " ").toLowerCase()}</p>
            </c:forEach>
            <br>
        </c:if>
        <c:if test="${empty scholarshipApplicationDetail.otherRequiredDoc}">
            <h3>Other Required Documents </h3>
            <p>${scholarshipApplicationDetail.otherRequiredDoc}</p>
            <br>
        </c:if>
        <h3>How to apply for the opportunity?</h3>
        <p id="how-apply">
            ${scholarshipApplicationDetail.howToApply}
        </p><br>

        <h3>Application Link</h3>
        <a href="${scholarshipApplicationDetail.urlProviderApplyForm}" class="btn" role="button" target="_blank"
           style="background-color: #1F3543; color: white; padding: 5px 10px; border-radius: 5px; text-align: center;">
            Click Here To Apply</a>
        <br><br><br>

        <c:if test="${empty scholarshipApplicationDetail.illustrationFileName}">
            <h3>Illustration File of The Opportunity</h3>
            <a id="file" href="">${scholarshipApplicationDetail.illustrationFileName}</a>
        </c:if>
    </div>
</div>