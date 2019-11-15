<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <title>View Story</title>
    <meta name="description" content="${story.storyInShort}">
    <%@include file="parts/links.html" %>
    <%@include file="parts/imgStaticPath.jsp" %>
    <script src="${contextPath}/resources/static/js/view-story.js"></script>
</head>

<body>
<jsp:include page="parts/navbar.jsp"/>
<section class="view-story container">
    <!-------- Drop down menu -------->

    <div class="dropdown">
        <button type="button" class="btn btn-toggle-menu" data-toggle="dropdown">
            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
        </button>
        <div class="dropdown-menu dropdown-menu-right">
            <c:if test="${owner}">
                <a class="dropdown-item" href="#${contextPath}/story/edit?id=${story.id}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</a>
                <a class="dropdown-item" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
            </c:if>
            <c:if test="${!owner}">
                <a class="dropdown-item" href="#"><i class="fa fa-bookmark-o" aria-hidden="true"></i> Save</a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#reportModal">
                    <i class="fa fa-flag-o" aria-hidden="true"></i> Report
                </a>
            </c:if>
        </div>
    </div>

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
                    <c:forEach var="index" begin="0" end="${story.imgList.size()}">
                    <li data-target="#storyCarousel" data-slide-to="${index}" class="${index==0 ? 'active' : ''}"></li>
                    </c:forEach>
                </ul>

                <div class="carousel-inner">
                    <c:forEach var="index" begin="0" end="${story.imgList.size()}">
                        <div class="carousel-item ${index eq 0 ? 'active' : ''}">
                            <img src="${contextPath}${storyImgPath}${story.imgList[index]}" alt="${story.city}">
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
              <span class="author mr-2 border-right">
                <img src="resources/static/img/user-icon.png" alt="author" class="mr-2">
                fName
              </span>
                <i class="fa fa-clock-o" aria-hidden="true"></i>
                <span class="date mr-2 border-right">${story.startDate}</span>
                <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                <span class="like-counts mr-2"> 20</span>
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

            <hr class="hr-end mt-5">

            <!---------- Like button --------->
            <button class="btn button-like">
                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&nbsp;Like
            </button>

            <!--------- Rating stars --------->
            <section class='rating-widget d-inline-block'
                     style="position: relative; top: 8px; left: 10px;">
                <!-- Rating Stars Box -->
                <div class='rating-stars text-center'>
                    <ul id='stars'>
                        <li class='star' data-value='1'>
                            <i class='fa fa-star fa-fw'></i>
                        </li>
                        <li class='star' data-value='2'>
                            <i class='fa fa-star fa-fw'></i>
                        </li>
                        <li class='star' data-value='3'>
                            <i class='fa fa-star fa-fw'></i>
                        </li>
                        <li class='star' data-value='4'>
                            <i class='fa fa-star fa-fw'></i>
                        </li>
                        <li class='star' data-value='5'>
                            <i class='fa fa-star fa-fw'></i>
                        </li>
                    </ul>
                </div>
            </section>
        </div>

        <!------- profile overview ------>
        <div class="profile-section col-md-12 col-lg-4">
            <div class="profile-section-box mt-5">
                <div class="profile text-center">
                    <img src="${contextPath}/resources/static/img/user-icon.png" class="img-fluid" alt="username">
                    <div class="profile-body">
                        <h5>firstname lastname</h5>
                        <p id="profileAbout">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                            Exercitationem facilis sunt repellendus excepturi beatae
                            porro debitis voluptate nulla quo veniam fuga sit molestias minus.
                        </p>

                        <a href="#" class="btn btn-profile btn-sm rounded mb-3" role="button">View profile</a>

                        <p class="social">
                            <a href="#" class="p-2"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="p-2"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="p-2"><i class="fa fa-envelope"></i></a>
                            <a href="#" class="p-2"><i class="fa fa-linkedin"></i></a>
                            <a href="#" class="p-2"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="p-2"><i class="fa fa-globe"></i></a>
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
                    <div id="reportResponseMsgDiv" class="small d-none">Report send successfully, we will progress it
                    </div>
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Select Why do you want to report?</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea id="messageText" class="form-control"></textarea>
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
