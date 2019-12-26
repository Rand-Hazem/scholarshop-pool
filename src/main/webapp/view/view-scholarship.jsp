<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.apache.commons.text.WordUtils" %>
<!DOCTYPE html>
<html>
<head>
    <title>${WordUtils.capitalizeFully(scholarship.title)}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <%@include file="parts/links.html" %>
    <%@include file="parts/uploadStaticPath.jsp" %>
    <script src="${contextPath}/resources/static/js/view-scholarship.js"></script>
</head>
<body>

<jsp:include page="parts/navbar.jsp"/>

<section class="view-opportunity">
    <div>
        <img class="opportunity-background-img" src="${contextPath}/resources/static/img/view-sh-bg-img.jpg"
             alt="Opportunity background picture">
    </div>

    <!-------------- General Overview About the opportunity --------------->
    <div class="container view-opportunity-box">
        <div class="row">
            <div class="col-md-8 col-12">
                <!------------------------- Opportunity Title ------------------------->
                <h3 class="opportunity-title">${scholarship.title}</h3>
                <p class="opportunity-description pt-2">${scholarship.description}</p>

                <!-------------- organization -------------->
                <div class="opportunity-meta">
                    <span class="advertiser mr-2 border-right">
                        <c:if test="${user.imgUrl==null}">
                            <img src="${contextPath}/resources/static/img/user-icon.png" alt="author" class="mr-2">
                        </c:if>
                        <c:if test="${user.imgUrl!=null}">
                            <img src="${contextPath}${profileImgPath}${user.imgUrl}" class="mr-2">
                        </c:if>
                        ${user.firstName}  ${user.lastName}
                    </span>
                    <span class="provider-organization mr-2">${scholarship.providreOrg}</span>
                </div>

                <sec:authorize access="isAnonymous()">
                    <b><a href="${contextPath}/login">Sign in to Start Applying</a></b>
                </sec:authorize>

            </div>
            <div class="col-md-4 col-12">
                <div class="opportunity-fund">
                    <i class="fa fa-money"></i>
                    <b>
                        ${scholarship.fundAmount!=0 ? '$'.concat(scholarship.fundAmount) : ""}&nbsp;
                        ${scholarship.fundType} FUNDING
                    </b>
                </div>
                <div class="opportunity-deadline">
                    Deadline:
                    ${scholarship.applyDeadline==null ? 'Open Deadline' : scholarship.applyDeadline}
                </div>
                <sec:authorize access="isAuthenticated()">
                    <button type="button" class="btn save-opportunity" data-scholarship-id="${scholarship.id}">
                        <i class="fa fa-heart"></i>Save opportunity
                    </button>
                </sec:authorize>
            </div>
        </div>
    </div>

    <!-------- Common Information for scholarships and internships -------->
    <div class="container view-opportunity-box">
        <h4><i class="fa fa-info-circle"></i> General Information</h4><br><br>

        <h5>Opportunity Type</h5>
        <p id="opportunity-type">${WordUtils.capitalizeFully(scholarship.type)}</p><br>

        <h5>Available Seats:</h5>
        <p id="opportunity-seats">${scholarship.seats}</p><br>

        <h5>Opportunity will take place in</h5>
        <span id="opportunity-country-city" data-country="${scholarship.country}"></span>
        <span id="opportunity-country-city">, ${scholarship.city}</span><br><br><br>

        <h5>Duration</h5>
        From <span id="opportunity-duration-from">${scholarship.durationFrom}</span> , To
        <span id="opportunity-duration-to">${scholarship.durationTo}</span>
        <br><br><br>

        <h5>About opportunity funding</h5>
        <p id="opportunity-fund-type"><b>${scholarship.fundType}</b> Funding</p>
        <c:if test="${scholarship.fundCover != null}">
            <p><b>Funding covers:&nbsp;</b></p>
            <c:forEach var="item" items="${scholarship.fundCover}">
                <span>${WordUtils.capitalizeFully(fn:replace(item, "_", " "))}</span>
                |&nbsp;
            </c:forEach>
        </c:if><br><br>

        <c:if test="${scholarship.officialWebsite!=null}">
            <h5>Opportunity Website Address</h5>
            <a id="opportunity-website" href="">${scholarship.officialWebsite}</a><br><br>
        </c:if>

        <c:if test="${not empty scholarship.privilege}">
            <h5>What does the successful applicant gain from your opportunity? Opportunity privileges</h5>
            <p id="opportunity-privileges">
                    ${scholarship.privilege}
            </p><br>
        </c:if>
    </div>

    <!---------------------- Scholarship Information ---------------------->
    <c:if test="${scholarship.type eq 'SCHOLARSHIP' || scholarship.type eq 'EXCHANGE'}">
        <jsp:include page="parts/scholarship.jsp"/>
    </c:if>

    <!---------------------- Internship Information ----------------------->
    <c:if test="${scholarship.type eq 'INTERNSHIP'}">
        <jsp:include page="parts/internship.jsp"/>
    </c:if>
</section>

<%@include file="parts/footer.html" %>


</body>
</html>