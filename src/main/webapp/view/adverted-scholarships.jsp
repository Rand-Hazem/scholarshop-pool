<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Adverted Scholarships</title>
    <%@include file="parts/links.html" %>
    <script src="${contextPath}/resources/static/js/adverted-scholarship.js"></script>
</head>
<body>
<jsp:include page="parts/navbar.jsp"/>
<!-- ********************************************************************************* -->

<section class="averted-scholarships-section">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <c:if test="${scholarships.size()==0}">
                <%@include file="parts/no-content-div.html" %>
            </c:if>
            <c:forEach items="${scholarships}" var="scholarship">
                <div class="col-md-4 col-sm-6 col-lg-3 adverted-scholarship-node fade-scale" data-id="${scholarship.id}">
                    <div class="position-relative">
                        <img src="${contextPath}/resources/static/img/countries/${scholarship.country}.jpg"
                             class="country-background-img"
                             onerror="this.onerror=null;this.src='${contextPath}/resources/static/img/countries/default-country.jpg';">
                        <div class="head-top">
                            <h4 class="title">${scholarship.title}</h4>
                            <div class="dropdown">
                                <button type="button" class="dropdown-toggle dropdown-btn" data-toggle="dropdown">
                                    <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="user/scholarship/${scholarship.id}"><i class="fa fa-eye" aria-hidden="true"></i> View</a>
                                    <a class="dropdown-item" href="#" methods=""><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i>Delete</a>
                                </div>
                            </div>
                        </div>
                        <p class="country" data-country="${scholarship.country}">${scholarship.country}</p>
                        <p class="date">${scholarship.applyDeadline==null ? 'Open Deadline' : scholarship.applyDeadline}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<%@include file="parts/footer.html" %>
</body>
</html>