<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <title>View Story</title>
    <meta name="description" content="${story.storyInShort}">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <%@include file="parts/links.html" %>
    <%@include file="parts/imgStaticPath.jsp" %>
    <script src="${contextPath}/resources/static/js/story-ajax.js"></script>
    <script src="${contextPath}/resources/static/js/view-story.js"></script>
</head>

<body>
<jsp:include page="parts/navbar.jsp"/>

<sec:authorize access="isAnonymous()">
    <%@include file="parts/register-now-dialog.html" %>
</sec:authorize>


<section class="view-story container">
    <!-------- Drop down menu -------->
    <sec:authorize access="isAuthenticated()">
        <div id="mainDropDownMenu" class="dropdown">
            <button type="button" class="btn btn-toggle-menu" data-toggle="dropdown">
                <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <c:if test="${owner}">
                    <a class="dropdown-item" href="#${contextPath}/story/edit?id=${story.id}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</a>
                    <a id="deleteStory" class="dropdown-item" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                </c:if>
                <c:if test="${!owner}">
                    <a class="dropdown-item" href="#"><i class="fa fa-bookmark-o" aria-hidden="true"></i> Save</a>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#reportModal">
                        <i class="fa fa-flag-o" aria-hidden="true"></i> Report
                    </a>
                </c:if>
            </div>
        </div>
    </sec:authorize>


    <div class="row story ">
        <div class="col-md-12 col-lg-8">
            <h3 id="storyTitle">${story.title}</h3>

            <!----- Story country & city ----->
            <div class="country-city text-muted">
                <i class="fa fa-map-marker " aria-hidden="true"></i>
                <span id="country">${story.hostCountry}</span>
                <span id="city" style="margin-left: -3px">${story.city}</span>
            </div>

            <!-------- Story duration -------->
            <div class="duration">
                <span class="text-muted" id="dateFrom">
                    <fmt:formatDate value="${story.startDate}" type="date"></fmt:formatDate>
                    </span>
                <span class="text-muted" id="dateTo">
                    <fmt:formatDate value="${story.endDate}" type="date"></fmt:formatDate>
                </span>
            </div>

            <!-------- Story carousel -------->
            <div id="storyCarousel" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                    <c:forEach var="item" items="${story.imgList}" varStatus="state">
                        <li data-target="#storyCarousel" data-slide-to="${state.index}" class="${state.index==0 ? 'active' : ''}"></li>
                    </c:forEach>
                </ul>

                <div class="carousel-inner">
                    <c:forEach var="item" items="${story.imgList}" varStatus="state">
                        <div class="carousel-item ${state.index eq 0 ? 'active' : ''}">
                            <img src="${contextPath}${storyImgPath}${item}" alt="${story.city}">
                        </div>
                    </c:forEach>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#storyCarousel" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#storyCarousel" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>

            <!---------- Story tags ---------->
            <div class="tags">
                <p>#${story.hostCountry}</p>
                <p>#${story.field}</p>
                <p>#${story.providerOrganization}</p>
            </div>

            <!---------- Story meta ---------->
            <div class="story-meta">
                <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                <span class="like-counts mr-2 border-right">${story.likes} &nbsp;</span>

                <ul class="list-inline d-inline">
                    <fmt:formatNumber var="rate" type="number" pattern="#" value="${story.rate}"></fmt:formatNumber>
                    <c:forEach begin="1" end="${rate}">
                        <li class='list-inline-item mr-0'>
                            <i class='fa fa-star fa-fw'></i>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!---------- Story body ---------->
            <div class="story-body">
                <p id="general" data-aos="fade-up">
                    It is
                    <span id="type">a scholarship</span>
                    provided by
                    <span id="organization">${story.providerOrganization}</span>.
                    <br>
                    In field of
                    <span id="field">${story.field}</span>.
                </p>

                <h4 data-aos="fade-up">
                    <i class="fa fa-graduation-cap mt-4" aria-hidden="true"></i>
                    About Opportunity
                </h4>
                <p id="about" data-aos="fade-up">${story.aboutOpportunity}</p>
                <h4 data-aos="fade-up">
                    <i class="fa fa-file-text mt-4" aria-hidden="true"></i>
                    Required documents
                </h4>
                <p id="documents" data-aos="fade-up">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Praesentium nam quas inventore, ut iure iste modi eos
                    adipisci ad ea itaque labore earum autem nobis et numquam,
                    minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus porro.
                </p>


                <h4 data-aos="fade-up">
                    <i class="fa fa-university mt-4" aria-hidden="true"></i>
                    About Institution
                </h4>
                <p id="system" data-aos="fade-up">${story.aboutInstitution}</p>

                <h4 data-aos="fade-up">
                    <i class="fa fa-home mt-4" aria-hidden="true"></i>
                    Accommodation
                </h4>
                <p id="accommodation" data-aos="fade-up">${story.aboutAccommodation}</p>


                <h4 data-aos="fade-up">
                    <i class="fa fa-pagelines mt-4" aria-hidden="true"></i>
                    Life in
                    <span id="city"> ${story.city}</span>
                </h4>
                <p id="life" data-aos="fade-up">${story.aboutCityLiving}</p>

                <h4 data-aos="fade-up">
                    <i class="fa fa-subway mt-4" aria-hidden="true"></i>
                    Transportation
                </h4>
                <p id="transportation" data-aos="fade-up">${story.aboutTransportation}</p>


                <h4 data-aos="fade-up">
                    <i class="fa fa-handshake-o mt-4" aria-hidden="true"></i>
                    Culture & Tradition
                </h4>
                <p id="culture" data-aos="fade-up">${story.aboutTradition}</p>

                <h4 data-aos="fade-up">
                    <i class="fa fa-check-circle mt-4" aria-hidden="true"></i>
                    Recommendation & Advice
                </h4>
                <p id="recommendation" data-aos="fade-up">${story.recommendationAndAdvice}</p>

            </div>

            <sec:authorize access="isAuthenticated()">
                <hr class="hr-end mt-5">
                <input type="hidden" name="storyId" value="${story.id}">
                <%------------ Like button -----------%>
                <button class="btn button-like ${userLiked ? 'liked' : ''}">
                    <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&nbsp;Like
                </button>

                <!--------- Rating stars ------- -->
                <section class='rating-widget d-inline-block' style="position: relative; top: 8px; left: 10px;">
                    <div class='rating-stars text-center'>
                        <ul id='stars'>
                            <li class='star ${userRate>0 ? 'selected' : ''}' data-value='1'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star ${userRate>1 ? 'selected' : ''}' data-value='2'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star ${userRate>2 ? 'selected' : ''}' data-value='3'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star ${userRate>3 ? 'selected' : ''}' data-value='4'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star ${userRate>4 ? 'selected' : ''}' data-value='5'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                        </ul>
                    </div>
                </section>
            </sec:authorize>
        </div>

        <!------- profile overview ------>
        <div class="profile-section col-md-12 col-lg-4">
            <div class="profile-section-box mt-5">
                <div class="profile text-center">
                    <img src="${contextPath}${profileImgPath}${story.user.imgUrl == null ? 'user-icon.png' : user.imgUrl}" class="img-fluid" alt="username">
                    <div class="profile-body">
                        <h5>${story.user.firstName} ${story.user.lastName}</h5>
                        <c:forEach var="item" items="${story.user.userOptionalInfoList}">
                            <c:if test="${item.key == 'BIO'}">
                                <p id="profileAbout">${item.data}</p>
                            </c:if>
                        </c:forEach>
                        <a href="#" class="btn btn-profile btn-sm rounded mb-3" role="button">View profile</a>
                        <p class="social">
                            <c:forEach var="item" items="${story.user.userOptionalInfoList}">
                                <c:choose>
                                    <c:when test="${item.key == 'FACEBOOK_LINK'}">
                                        <a href="${item.data}" class="p-2"><i class="fa fa-facebook"></i></a>
                                    </c:when>
                                    <c:when test="${item.key == 'TWITTER_LINK'}">
                                        <a href="${item.data}" class="p-2"><i class="fa fa-twitter"></i></a>
                                    </c:when>
                                    <c:when test="${item.key == 'LINKEDIN_LINK'}">
                                        <a href="${item.data}" class="p-2"><i class="fa fa-linkedin"></i></a>
                                    </c:when>
                                    <c:when test="${item.key == 'WEBSITE_LINK'}">
                                        <a href="${item.data}" class="p-2"><i class="fa fa-globe"></i></a>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-------- Report modal --------->
    <div id="reportModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="reportModalLabel" class="modal-title">Report Story</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="reportResponseMsgDiv" class="alert d-none"></div>
                    <form id="reportForm">
                        <div class="form-group" name="storyReport">
                            <label for="recipient-name" class="col-form-label">Select Why do you want to report?</label>
                            <select name="reportContentType" class="form-control custom-select">
                                <%@include file="parts/report-content-type.html" %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="messageText" class="col-form-label">Message:</label>
                            <textarea id="messageText" name="message" class="form-control"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="btnClose" type="button" class="btn" data-dismiss="modal">Close</button>
                    <button id="btnSave" type="button" class="btn">Send</button>
                </div>
            </div>
        </div>
    </div>


</section>
<%@include file="parts/footer.html" %>
</body>
</html>
