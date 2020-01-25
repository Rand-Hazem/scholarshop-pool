<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>wished scholarships</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@include file="parts/links.html" %>

</head>
<body>

<jsp:include page="parts/navbar.jsp"/>

<section class="matched-scholarships mt-5">
    <div class="container-fluid content">
        <div class="row justify-content-center">

            <div class="col-md-9 col-lg-7 mb-5">
                <div class="text-primary-color">
                    <h5 class="font-weight-bold">Wished Scholarships</h5>
                </div>
                <hr>
            </div>

            <div class="col-md-9 col-lg-7">
                <c:choose>
                    <c:when test="${saved.size() > 0 }">
                        <c:forEach var="saved" items="${saved}">
                            <div class="scholarship-node"  style="margin-bottom: 30px;" data-aos="fade-up">
                                <div class="scholarship-header">
                                    <button type="button" class="btn btn-wish float-right focuse-style-none">
                                        <i class="fa fa-heart"></i>
                                    </button>
                                    <div class="scholarship-title">
                                        <h4>${saved.scholarship.title}</h4>
                                    </div>
                                </div>
                                <div class="scholarship-description">
                                    <ul class="list-group list-group-horizontal flex-wrap my-2">
                                        <li class="list-group-item">
                                                ${saved.scholarship.type}
                                            <span>&#124;</span>
                                        </li>
                                        <li class="list-group-item">
                                            <span data-country="${saved.scholarship.country}"></span>,
                                            <span> ${saved.scholarship.city}</span>
                                            <span>&#124;</span>
                                        </li>
                                        <li class="list-group-item">
                                                ${saved.scholarship.fundType} FUNDING
                                            <span>&#124;</span>
                                        </li>
                                        <c:if test="${saved.scholarship.fundAmount!=0 }">
                                            <li class="list-group-item">
                                                $${saved.scholarship.fundAmount}
                                                <span>&#124;</span>
                                            </li>
                                        </c:if>
                                        <li class="list-group-item">
                                                ${saved.scholarship.degree}
                                            <span>&#124;</span>
                                        </li>
                                        <li class="list-group-item">
                                                ${saved.scholarship.seats} seats
                                        </li>
                                    </ul>
                                    <p class="text-muted pt-3">${saved.scholarship.description}</p>
                                </div>
                                <hr>
                                <div class="scholarship-footer">
                                    <a href="${contextPath}/user/scholarship/${saved.scholarship.id}/${saved.scholarship.title}" class="float-right btn btn-primary view-btn" >View</a>
                                    <span>DeadLine</span>
                                    <c:choose>
                                        <c:when test="${saved.scholarship.applyDeadline == null}">
                                            <span class="text-muted">Open Deadline</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted">${saved.scholarship.applyDeadline}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <img src='${contextPath}/resources/static/img/no-content.png' alt='no-content' style="display: block;
                                        margin-left: auto; margin-right: auto; width: 42%;" class="container no-content">
                    </c:otherwise>
                </c:choose>

                <c:if test="${saved.size() > 0 }">
                    <c:if test="${totalPages > 1}">
                        <div class="col" style="text-align: center; margin-top: 35px;">
                            Showing ${number+1} of ${totalPages}
                            <ul class="pagination d-flex justify-content-center">
                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                    <li class="page-item">
                                        <a href="/wished-scholarships/${id}/&page=${page}&size=${size}" class="page-link">${page+1}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>

                </c:if>

            </div>
        </div>
    </div>
</section>

<%@include file="parts/footer.html" %>

</body>
</html>