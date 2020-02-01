<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.apache.commons.text.WordUtils" %>
<!DOCTYPE html>
<html>
<head>
    <title>${WordUtils.capitalizeFully(scholarship.title)}</title>
    <meta charset="utf-8">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <%@include file="parts/links.html" %>
    <%@include file="parts/uploadStaticPath.jsp" %>
    <script src="${contextPath}/resources/static/js/scholarship-node-ajax.js"></script>
    <script src="${contextPath}/resources/static/js/view-scholarship.js"></script>
</head>
<body>

<jsp:include page="parts/navbar.jsp"/>

<section class="view-opportunity">
    <div>
        <img class="opportunity-background-img" src="${contextPath}/resources/static/img/view-sh-bg-img.jpg"
             alt="Opportunity background picture">
    </div>


    <!-- *************************************************************************************** -->

    <div class="container">
        <!-------------- General Overview About the opportunity --------------->
        <div class="row view-opportunity-box align-center">
            <div class="col-md-7 col-11">
                <h3 class="opportunity-title">${scholarship.title}</h3>
                <p class="opportunity-description pt-2">${scholarship.description}</p>
                <div class="opportunity-meta">
                    <span class="advertiser mr-2 border-right">
                            <img src="${contextPath}${profileImgPath}${user.imgUrl}" alt="author" class="mr-2"
                                 onerror="onImgSrcError(this, '${contextPath}/resources/static/img/user-icon.png')">
                        ${user.firstName}  ${user.lastName}
                    </span>
                    <span class="provider-organization mr-2">${scholarship.providreOrg}</span>
                </div>
            </div>

            <div class="col-md-4 col-12">
                <ul class="list-group list-group-horizontal-sm flex-md-column">
                    <li class="list-group-item border-0 p-0">
                        <div class="opportunity-fund">
                            <i class="fa fa-money"></i>
                            <b>
                                ${scholarship.fundAmount!=0 ? '$'.concat(scholarship.fundAmount) : ""}&nbsp;
                                ${scholarship.fundType} FUNDING
                            </b>
                        </div>
                    </li>
                    <li class="list-group-item border-0 p-0">
                        <div class="opportunity-deadline">
                            Deadline:
                            ${scholarship.applyDeadline==null ? 'Open Deadline' : scholarship.applyDeadline}
                        </div>
                    </li>
                    <sec:authorize access="isAuthenticated()">
                        <li class="list-group-item border-0 p-0">
                            <button type="button" class="btn save-opportunity" data-scholarship-id="${scholarship.id}">
                                <i class="fa fa-heart"></i>&nbsp;Save opportunity
                            </button>
                        </li>
                    </sec:authorize>
                </ul>
            </div>

            <sec:authorize access="isAnonymous()">
                <div><b>
                    <a class="ml-3" href="${contextPath}/login">Sign in to Start Applying</a>
                </b></div>
            </sec:authorize>
        </div>

        <!-------- Common Information for scholarships and internships -------->
        <div class="view-opportunity-box">
            <h4 class="mb-3"><i class="fa fa-info-circle"></i> General Information</h4>
            <div>
                <ul class="list-group list-group-horizontal custom">
                    <li class="list-group-item header">Opportunity Type:</li>
                    <li class="list-group-item">${WordUtils.capitalizeFully(scholarship.type)}</li>
                </ul>
            </div>

            <div>
                <ul class="list-group list-group-horizontal custom">
                    <li class="list-group-item header">Available Seats:</li>
                    <li class="list-group-item">${scholarship.seats}</li>
                </ul>
            </div>

            <div>
                <ul class="list-group list-group-horizontal custom">
                    <li class="list-group-item header">Host country:</li>
                    <li class="list-group-item">
                        <span data-country="${scholarship.country}"></span>
                        <span>, ${scholarship.city}</span>
                    </li>
                </ul>
            </div>

            <div>
                <ul class="list-group list-group-horizontal custom">
                    <li class="list-group-item header">Duration:</li>
                    <li class="list-group-item">
                        From <span>${scholarship.durationFrom}</span> , To
                        <span>${scholarship.durationTo}</span>
                    </li>
                </ul>
            </div>

            <div>
                <ul class="list-group list-group-horizontal custom">
                    <li class="list-group-item header">Opportunity funding:</li>
                    <li class="list-group-item"> ${scholarship.fundType} Funding</li>
                </ul>
            </div>

            <c:if test="${scholarship.fundCover != null}">
                <div>
                    <ul class="list-group list-group-horizontal custom">
                        <li class="list-group-item header">Funding covers:</li>
                        <li class="list-group-item">
                            <c:forEach var="item" items="${scholarship.fundCover}">
                                <span>${WordUtils.capitalizeFully(fn:replace(item, "_", " "))}</span> |&nbsp;
                            </c:forEach>
                        </li>
                    </ul>
                </div>
            </c:if>

            <c:if test="${scholarship.officialWebsite!=null}">
                <div>
                    <ul class="list-group list-group-horizontal custom">
                        <li class="list-group-item header">Website Address:</li>
                        <li class="list-group-item">${scholarship.officialWebsite}</li>
                    </ul>
                </div>
            </c:if>

            <c:if test="${not empty scholarship.privilege}">
                <div class="mt-3">
                    <p><b>What does the successful applicant gain from your opportunity? Opportunity privileges</b></p>
                    <p id="opportunity-privileges">${scholarship.privilege}</p>
                </div>
            </c:if>
        </div>


    </div>


    <!-- *************************************************************************************** -->


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