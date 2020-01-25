<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>matched scholarship</title>
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
                    <h5 class="font-weight-bold">Scholarships matching you</h5>
                    <p>Here we select scholarships matching you upon information provided in your profile</p>
                </div>
                <hr>
            </div>

            <div class="col-md-9 col-lg-7">
                <c:choose>
                    <c:when test="${scholarshipList.size() > 0 }">
                        <c:forEach var="saved" items="${scholarshipList}">
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
                                            At <span data-country="${saved.scholarship.country}"></span>,
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
                                    <button class="float-right btn btn-primary view-btn" >View</button>
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
                        <%@include file="parts/no-content-div.html"%>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div class="row justify-content-center contact-media">
            <ul class="list-inline text-center">
                <li class="list-inline-item">
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                </li>
                <li class="list-inline-item">
                    <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a>
                </li>
                <li class="list-inline-item">
                    <a href="#"> <i class="fa fa-instagram" aria-hidden="true"></i></a>
                </li>
                <li class="list-inline-item">
                    <a href="#"> <i class="fa fa-linkedin" aria-hidden="true"></i></a>
                </li>
            </ul>
        </div>

        <div id="footerCopyRightBlock" class="row justify-content-center ">
            <p>
                Created With <i class="fa fa-heart-o" aria-hidden="true"></i> by our team
                <br>
                Copyright &copy; 2019 Website-Name
            </p>
        </div>
    </div>
</footer>

</body>
</html>
