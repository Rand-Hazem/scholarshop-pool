<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="org.apache.commons.text.WordUtils" %>
<div class="scholarship">

    <!-------- Provider Information & Academic Information -------->
    <div class="container view-opportunity-box">
        <h2><i class="fa fa-briefcase"></i> Opportunity Details#1</h2><br><br>
        <!-------- Provider Information -------->
        <h4>Provider Information</h4>
        <p><b>Advertiser: </b> <span id="advertiser">${user.firstName} ${user.lastName}</span></p>
        <p><b>Provider Organization: </b> <span id="provider-organization">${scholarship.providreOrg}</span></p>
        <p><b>Special Program: </b> <span id="special-program">${scholarship.specialProgram}</span></p><br><br>

        <!-------- Academic Information -------->
        <h4>Academic Information of Opportunity</h4>
        <p><b>Host University: </b> <span id="university">${academicInformation.hostUniversity}</span></p>
        <p><b>Opportunity Degree: </b> <span id="degree">${WordUtils.capitalizeFully(scholarship.degree)}</span></p>
        <p id="major"><b>Major:</b></p>
        <c:forEach items="${academicInformation.major}" var="majors">
            <p data-major="${majors}"></p>
        </c:forEach>

        <p><b>Teaching Language </b>
            <span id="teaching-language">${WordUtils.capitalizeFully(academicInformation.teachingLanguage)}</span></p>
        <br><br>
    </div>

    <!-------- Applicant Requirements & Eligibility Criteria -------->
    <div class="container view-opportunity-box">
        <h2><i class="fa fa-user"></i> Opportunity Details#2</h2><br><br>
        <!-------- Applicant Requirements -------->
        <h4>Applicant Requirements</h4>
        <p id="nationality"><b>Nationality: </b></p>
        <c:forEach items="${applicantRequirement.nationality}" var="nationality">
            <p data-country="${nationality}">${nationality}</p>
        </c:forEach>
        <p><b>Resident in: </b>
            <span id="resident-country">
                ${WordUtils.capitalizeFully(fn:replace(applicantRequirement.residenceIn,"_" ," " ))}
            </span>
        </p>
        <p><b>Applicant Gender: </b> <span id="gender">${applicantRequirement.gender} </span></p>
        <p><b>Applicant Age Limit: </b> From <span id="age-from">${applicantRequirement.minAge}</span>
            To <span id="age-to">${applicantRequirement.maxAge}</span></p>
        <p><b>Minimum Degree Held: </b> <span id="min-degree">${WordUtils.capitalizeFully(applicantRequirement.minDegree)}</span></p>
        <p id="min-degree-major"><b>In Major: </b></p>
        <c:forEach items="${applicantRequirement.major}" var="majors">
            <p data-major="${majors}"></p>
        </c:forEach>


        <!-------- Eligibility Criteria -------->
        <h4>Eligibility Criteria</h4>
        <p><b>Minimum (School) GPA: </b> <span id="school-gpa">${applicantRequirement.minSchoolGPA}</span></p>
        <p><b>Minimum (university) GPA </b> <span id="university-gpa">${applicantRequirement.minUnivGPA}</span></p>
        <p><b>English Level: </b> <span id="english-level">${applicantRequirement.englishLevel}</span></p>
        <p><b>Special Certificate/s</b></p>
        <table>
            <c:forEach items="${applicantRequirement.specialCertificateScoreList}" var="certificates">
                <tr>
                    <td>${certificates.certificate},</td>
                    <td>${certificates.score}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-------- Required Documents -------->
    <div class="container view-opportunity-box">
        <h4><i class="fa fa-file"></i> How to Apply</h4><br><br>
        <c:if test="${not empty scholarshipApplicationDetail.requiredDocumentList}">
            <h5>Required Documents </h5>
            <c:forEach items="${scholarshipApplicationDetail.requiredDocumentList}" var="item">
                <p>${WordUtils.capitalizeFully(fn:replace(item, "_", " "))}</p>
            </c:forEach>
            <br>
        </c:if>
        <c:if test="${not empty scholarshipApplicationDetail.otherRequiredDoc}">
            <h5>Other Required Documents </h5>
            <p>${scholarshipApplicationDetail.otherRequiredDoc}</p>
            <br>
        </c:if>
        <h4>How to apply for the opportunity?</h4>
        <p id="how-apply">
            ${scholarshipApplicationDetail.howToApply}
        </p><br>

        <h4>Application Link</h4>
        <a href="${scholarshipApplicationDetail.urlProviderApplyForm == null ? "/student/apply?shId="+scholarship.id : scholarshipApplicationDetail.urlProviderApplyForm}"
           class="btn" role="button" target="_blank"
           style="background-color: #1F3543; color: white; padding: 5px 10px; border-radius: 5px; text-align: center;">
            Click Here To Apply</a>
        <br><br><br>

        <c:if test="${not empty scholarshipApplicationDetail.illustrationFileName}">
            <h4>Illustration File of The Opportunity</h4>
            <a id="file" href="">${contextPath}${scholarshipIllustrationFilePath}${scholarshipApplicationDetail.illustrationFileName}</a>
        </c:if>
    </div>
</div>