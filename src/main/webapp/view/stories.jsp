<%@ taglib prefix="div" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
    int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
%>
<!doctype html>
<html lang="en">
<head>
    <title>other stories</title>
    <%@include file="parts/links.html" %>

    <script src='${contextPath}/resources/static/js/story-ajax.js'></script>
    <script src="${contextPath}/resources/static/js/stories.js"></script>

</head>
<body>


<jsp:include page="parts/navbar.jsp"/>

<sec:authorize access="isAnonymous()">
    <%@include file="parts/register-now-dialog.html" %>
</sec:authorize>

<input type="hidden" name="pageNo" value=1>

<section class="container other-stories mt-5">
    <div class="row justify-content-center">

        <div class="col-md-4 col-lg-3 mb-4">
            <div class="share-story">
                <div class="text-center px-lg-4 px-3 py-5">
                    <h5 class="mb-2 title">Share your own Story</h5>
                    <p>When you share your story, you help others make their ones</p>
                    <a class="link" href="share-story.html">
                        <img src="${contextPath}/resources/static/img/share-story.gif" alt="Story">
                        <p class="mb-0 font-weight-bold">
                            Share your Story now!
                        </p>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-8 stories-container"> <!-- story-content -->

            <div:form class="input-group mb-5 card-shadow search-story"
                      action="${contextPath}/story/search" method="get" role="form">
                <input type="text" id="searchAutocomplete" name="search"
                       class="form-control" placeholder="Search Stories by tilte or publisher name .." required/>
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit">
                        <i class="fa fa-search mr-1"></i>
                        Search
                    </button>
                </div>
                <input type="hidden" name="pageNo" value=1>
            </div:form>

            <div class="filter-container">
                <h3 class="d-inline text-primary-color"><b>Stories</b></h3>
            </div>

            <div class='story-nodes-box container-fluid'>
                <c:if test="${empty stories}">
                    <%@include file="parts/no-content-div.html" %>
                </c:if>

                <jsp:include page="parts/story-node.jsp"/>

            </div>
        </div>
    </div>
</section>
<section id='reportModelSection' class='other-stories'>
    <div class='modal fade' id='reportModal' tabindex='-1' role='dialog' aria-labelledby='reportModalLabel'
         aria-hidden='true'
         data-backdrop='static' data-keyboard='false'>
        <div class='modal-dialog' role='document'>
            <div class='modal-content'>
                <div class='modal-header'>
                    <h5 class='modal-title' id='reportModalLabel'>Report Story</h5>
                    <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                        <span aria-hidden='true'>&times;</span>
                    </button>
                </div>
                <div class='modal-body'>
                    <form>
                        <div class='form-group'>
                            <label for='recipient-name' class='col-form-label'>Select Why do you want to report?</label>
                            <input type='text' class='form-control' id='recipient-name'>
                        </div>
                        <div class='form-group'>
                            <label for='message-text' class='col-form-label'>Message:</label>
                            <textarea class='form-control' id='message-text'></textarea>
                        </div>
                    </form>
                </div>
                <div class='modal-footer'>
                    <button type='button' class='btn btn-secondary btn-close' data-dismiss='modal'>Close</button>
                    <button type='button' class='btn btn-save'>Send report</button>
                </div>
            </div>
        </div>
    </div>
</section>


<div class="pagination-container my-5">
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center flex-wrap">


            <c:if test="${param.search != null}">

                <c:choose>
                    <c:when test="${param.pageNo == 1}">
                        <c:set var="previousPage" scope="request" value="1"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="previousPage" scope="request" value="${param.pageNo-1}"/>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${param.pageNo == pageCount}">
                        <c:set var="nextPage" scope="request" value="${param.pageNo}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="nextPage" scope="request" value="${param.pageNo+1}"/>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${param.pageNo <= 3}">
                        <c:set var="firstPage" scope="request" value="1"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="firstPage" scope="request" value="${param.pageNo-2}"/>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${pageCount <= 5}">
                        <c:set var="lastPage" scope="request" value="${pageCount}"/>
                    </c:when>
                    <c:otherwise>
                        <c:when test="${pageCount-param.pageNo == 0}">
                            <c:set var="lastPage" scope="request" value="${param.pageNo+1}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="lastPage" scope="request" value="${param.pageNo+2}"/>
                        </c:otherwise>
                    </c:otherwise>
                </c:choose>

                <li class="page-item">
                    <a class="page-link" aria-label="Previous"
                       href="${pageContext.request.contextPath}/searchStory?search=<c:out value="${param.search}"/>
                              &pageNo=<c:out value="${previousPage}"/>">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>

                <c:forEach begin="${firstPage}" end="${lastPage}" varStatus="loop">
                    <li class="page-item">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/searchStory?search=<c:out value="${param.search}"/>
                                  &pageNo=<c:out value="${loop.index}"/>">
                            <c:choose>
                                <c:when test="${loop.index == param.pageNo}">
                                    <b>${loop.index}</b>
                                </c:when>
                                <c:otherwise>
                                    ${loop.index}
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </li>
                </c:forEach>

                <li class="page-item">
                    <a class="page-link" aria-label="Next"
                       href="${pageContext.request.contextPath}/searchStory?search=<c:out value="${param.search}"/>
                             &pageNo=<c:out value="${nextPage}"/>">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>

                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/searchStory?search=<c:out value="${param.search}"/>
                               &pageNo=<c:out value="${pageCount}"/>">
                        Last (<c:out value="${pageCount}"/>)</a>
                </li>
            </c:if>

        </ul>
    </nav>
</div>


<%@include file="parts/footer.html" %>

</body>
</html>