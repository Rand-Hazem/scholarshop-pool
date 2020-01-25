<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>search scholarships</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="parts/links.html"%>
    <script src="${contextPath}/resources/static/js/search-scholarship.js"></script>
    <script src="${contextPath}/resources/static/js/scholarship-node-ajax.js"></script>
</head>
<body>

<jsp:include page="parts/navbar.jsp"/>

<sec:authorize access="isAnonymous()">
    <%@include file="parts/register-now-dialog.html" %>
</sec:authorize>

<div class="search-scholarship container-fluid"><!--search-scholarship-->
    <div class="row">

        <div id="wrapper" class="wrapper col-md-3 d-flex">
            <!--start of sidebar-->
            <div class=" sidebar-filter ">
                <div class="sidebar-menu">
                    <ul class="list list-unstyled">

                        <li class="list-item active">
                            <span class="list-link link-arrow">Disciplines</span>
                            <ul class="list-unstyled list-hidden">
                                <li><span class="list-sub-link link-arrow">Architecture</span>
                                    <ul class="list-unstyled list-hidden">
                                        <li class="list-sub-link">
                                            <div class="custom-control custom-checkbox">
                                                <input id="displine1" type="checkbox" class="custom-control-input">
                                                <label class="custom-control-label" for="displine1">Architecture</label>
                                            </div>
                                        </li>
                                        <li class="list-sub-link">
                                            <div class="custom-control custom-checkbox">
                                                <input id="displine2" type="checkbox" class="custom-control-input">
                                                <label class="custom-control-label" for="displine2">Art History</label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item active">
                            <span class="list-link link-arrow">Home country</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="homeCountry" name="homeCountry" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="homeCountry">Palestine</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item">
                            <span class="list-link link-arrow">Host country</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="hostCountry" name="hostCountry" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="hostCountry">Palestine</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item">
                            <span class="list-link link-arrow">In Degree</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="bachelorDegree" name="bachelorDegree" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="bachelorDegree">Bachelor</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="masterDegree" name="masterDegree" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="masterDegree">Master</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="doctoralDegree" name="doctoralDegree" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="doctoralDegree">Doctoral</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="Degree4">
                                        <label class="custom-control-label" for="Degree4">doctoral degree</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="professorDegree" name="professorDegree" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="professorDegree">Professor</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item">
                            <span class="list-link link-arrow">Type</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="typeStudy" name="typeStudy" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="typeStudy">Study Scholarship</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="typeTraining" name="typeTraining" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="typeTraining">Training</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item">
                            <span class="list-link link-arrow">Duration</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="lessThanYear" name="lessThanYear" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="lessThanYear">Less than 1 year</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="year" name="year" type="checkbox" class="custom-control-input">
                                        <label class="custom-control-label" for="year">1 year</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="onHalfYear" name="onHalfYear" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="onHalfYear">1&frac12; year</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="twoYears" name="twoYears" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="twoYears">2 years</label>
                                    </div>
                                </li>
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="moreThanTwoYear" name="moreThanTwoYear" type="checkbox"
                                               class="custom-control-input">
                                        <label class="custom-control-label" for="moreThanTwoYear">More than 2
                                            years</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item">
                            <span class="list-link link-arrow">Special program</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="dbId" type="checkbox" class="custom-control-input">
                                        <label class="custom-control-label" for="dbId">Special program name</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="list-item">
                            <span class="list-link link-arrow">Organization</span>
                            <ul class="list-unstyled list-hidden">
                                <li class="list-sub-link">
                                    <div class="custom-control custom-checkbox">
                                        <input id="orgId" name="orgId" type="checkbox" class="custom-control-input">
                                        <label class="custom-control-label" for="orgId">Organization 1</label>
                                    </div>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="row row-custom-container justify-content-center mt-5 col-md-9 ml-auto">
            <div class="col-md-12 col-lg-9">

                <div class="col-12 clearfix">
                    <button id="sidebarToggleBtn" class="btn d-md-none d-inline-block ml-4">
                        Filters
                        <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                    </button>

                    <div class="dropdown d-inline-block mr-4 float-right">
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                            Sort By
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item">duration highest to lowest</a>
                            <a class="dropdown-item">duration lowest to highest</a>
                            <a class="dropdown-item">tuition fee</a>
                        </div>
                    </div>
                </div>
                <hr>

                <div class="col-12">

                    <jsp:include page="parts/scholarship-node.jsp"/>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="parts/footer.html"%>

</body>
</html>



