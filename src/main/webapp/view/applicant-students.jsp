<!DOCTYPE html>
<html>
<head lang="en">
    <title>applicant students</title>
    <%@include file="parts/links.html" %>
    <script src="${contextPath}/resources/static/js/applicant-students.js"></script>
</head>

<body>


<jsp:include page="parts/navbar.jsp"/>

<!-- ------------------------------------------------------------------------------------------------ -->
<section class="applicant-students sidebar"><!--   Sidebar  -->
    <div class="d-flex " id="wrapper"> <!-- toggled -->
        <div class="nano" id="sidebar-wrapper">
            <div class="list-group list-group-flush nano-content">
                <div>
                    <button class="btn" id="btnMenuToggle">
                        <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="my-2">
                    <h4 class="text-center">Adverted Scholarships</h4>
                </div>
                <div class="scholarship-entity">
                    <h5>Scholarship title</h5>
                    <div class="footer">
                        <span class="date">12 may 2019</span>
                        <button type="button" class="btn notification">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <span class="badge badge-light">4</span>
                        </button>
                    </div>
                </div>
                <div class="scholarship-entity">
                    <h5>Scholarship title</h5>
                    <div class="footer">
                        <span class="date">12 may 2019</span>
                        <button type="button" class="btn notification">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <span class="badge badge-light">4</span>
                        </button>
                    </div>
                </div>
                <div class="scholarship-entity">
                    <h5>Scholarship title</h5>
                    <div class="footer">
                        <span class="date">12 may 2019</span>
                        <button type="button" class="btn notification">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <span class="badge badge-light">4</span>
                        </button>
                    </div>
                </div>
                <div class="scholarship-entity">
                    <h5>Scholarship title</h5>
                    <div class="footer">
                        <span class="date">12 may 2019</span>
                        <button type="button" class="btn notification">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <span class="badge badge-light">4</span>
                        </button>
                    </div>
                </div>
                <div class="scholarship-entity">
                    <h5>Scholarship Final</h5>
                    <div class="footer">
                        <span class="date">12 may 2019</span>
                        <button type="button" class="btn notification">
                            <i class="fa fa-bell" aria-hidden="true"></i>
                            <span class="badge badge-light">4</span>
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>


<section class="applicant-students students-section"><!-- Applicant student -->

    <div id="filter-div" class="row justify-content-center">
        <div class="col-11 col-md-9 d-flex justify-content-end">
            <div class="dropdown d-inline">
                <button type="button" class="btn dropdown-toggle focuse-style-none active-style-none"
                        data-toggle="dropdown">
                    <span>Sort by</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Name</a>
                    <a class="dropdown-item" href="#">Age</a>
                    <a class="dropdown-item" href="#">GPA</a>
                    <a class="dropdown-item" href="#">Applicant date</a>
                </div>
            </div>
            <!--</div>-->
        </div>
    </div>


    <div class="row  justify-content-center justify-content-center">

        <div class="col-md-6 col-lg-5">
            <div class="student-entity">
                <img src="${contextPath}/resources/static/img/user-icon.png" alt="Sudent name">
                <div class="d-inline-block body">
                    <h5 class="title">Student name</h5>
                    <p class="text">Studying Filed Name in University name
                        in University name in University name in University name in University name
                    </p>
                    <div class="footer">
                        <span>May 18, 2019</span>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-5">
            <div class="student-entity">
                <img src="${contextPath}/resources/static/img/user-icon.png" alt="Sudent name">
                <div class="d-inline-block body">
                    <h5 class="title">Student name</h5>
                    <p class="text">Studying Filed Name in University name
                        in University name in University name in University name in University name
                    </p>
                    <div class="footer">
                        <span>May 18, 2019</span>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-5">
            <div class="student-entity">
                <img src="${contextPath}/resources/static/img/user-icon.png" alt="Sudent name">
                <div class="d-inline-block body">
                    <h5 class="title">Student name</h5>
                    <p class="text">Studying Filed Name in University name
                        in University name in University name in University name in University name
                    </p>
                    <div class="footer">
                        <span>May 18, 2019</span>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-5">
            <div class="student-entity">
                <img src="${contextPath}/resources/static/img/user-icon.png" alt="Sudent name">
                <div class="d-inline-block body">
                    <h5 class="title">Student name</h5>
                    <p class="text">Studying Filed Name in University name
                        in University name in University name in University name in University name
                    </p>
                    <div class="footer">
                        <span>May 18, 2019</span>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-5">
            <div class="student-entity">
                <img src="${contextPath}/resources/static/img/user-icon.png" alt="Sudent name">
                <div class="d-inline-block body">
                    <h5 class="title">Student name</h5>
                    <p class="text">Studying Filed Name in University name
                        in University name in University name in University name in University name
                    </p>
                    <div class="footer">
                        <span>May 18, 2019</span>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-reject">Reject</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

</section>
<%@include file="parts/footer.html" %>

</body>
</html>
