<%@ page import="com.iteam.scholarships.enums.UserOptionalInfoKey" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
<head>
    <title>View Profile</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <%@include file="parts/links.html" %>
    <%@include file="parts/uploadStaticPath.jsp" %>
    <script src='${contextPath}/resources/static/js/story-ajax.js'></script>
    <script src='${contextPath}/resources/static/js/profile.js'></script>
</head>
<body>
<jsp:include page="parts/navbar.jsp"/>
<!--  ------------------------------------------------------------------------------------------------------- -->

<!-- Profile Overview-->
<div class='profile profile-div'>
    <div class='container'>
        <div class='row'>
            <!-- Profile Picture -->
            <div class='col-xs-12 col-sm-4 col-lg-3 profile-picture-div center'>
                <c:choose>
                    <c:when test="${empty user.imgUrl}">
                        <img src="${contextPath}/resources/static/img/user-icon.png" alt="user img"/>
                    </c:when>
                    <c:otherwise>
                        <img class='img-fluid profile-picture' src='${contextPath}${profileImgPath}${user.imgUrl}' alt='username'>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Profile Information Overview -->
            <div class='col-xs-12 col-sm-8 col-lg-9 profile-overview'>

                <div class='profile-info'>
                    <!-- Name -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Name</div>
                        <div class='profile-info-value'>
                            <span>${user.firstName} ${user.lastName}</span>
                        </div>
                    </div>

                    <!-- Nationality -->
                    <c:if test="${keyDataMap.get(UserOptionalInfoKey.NATIONALITY) != null}">
                        <div class='profile-info-row'>
                            <div class='profile-info-name'> Nationality</div>

                            <div class='profile-info-value'>
                                <span>${keyDataMap.get(UserOptionalInfoKey.NATIONALITY)}</span>
                            </div>
                        </div>
                    </c:if>

                    <!-- Country of residence -->
                    <c:if test="${keyDataMap.get(UserOptionalInfoKey.LIVEING_CITY) != null}">
                        <div class='profile-info-row'>
                            <div class='profile-info-name'> Resident</div>

                            <div class='profile-info-value'>
                                <i class='fa fa-map-marker light-orange'></i>
                                <span>${keyDataMap.get(UserOptionalInfoKey.LIVEING_CITY)}</span>
                            </div>
                        </div>
                    </c:if>

                    <!-- Email & Mobile No -->
                    <c:choose>
                        <c:when test="${user.type eq 'ADVERTISER'}">
                            <!-- Email -->
                            <div class='profile-info-row'>
                                <div class='profile-info-name'> E-mail</div>
                                <div class='profile-info-value'>
                                    <span><a href='${user.advertiser.workEmail}'> ${user.advertiser.workEmail}</a></span>
                                </div>
                            </div>
                            <!-- Phone No. -->
                            <div class='profile-info-row'>
                                <div class='profile-info-name'> Phone</div>
                                <div class='profile-info-value'>
                                    <span>${user.advertiser.mobileNum}</span>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${user.type eq 'STUDENT'}">
                            <!-- Email -->
                            <div class='profile-info-row'>
                                <div class='profile-info-name'> E-mail</div>
                                <div class='profile-info-value'>
                                    <span><a href='${user.email}'> ${user.email}</a></span>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>

                    <!-- D.O.B -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> D.O.B</div>
                        <div class='profile-info-value'>
                            <span>${user.birthday}</span>
                        </div>
                    </div>

                    <!-- Social Media Links -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Social Media</div>
                        <div class='profile-info-value'>
                            <div class='social-media-links'>
                                <c:if test="${keyDataMap.get(UserOptionalInfoKey.FACEBOOK_LINK) != null}">
                                    <a href='${keyDataMap.get(UserOptionalInfoKey.FACEBOOK_LINK)}'
                                       class='fa fa-facebook link' target="_blank"></a>
                                </c:if>
                                <c:if test="${keyDataMap.get(UserOptionalInfoKey.TWITTER_LINK) != null}">
                                    <a href='${keyDataMap.get(UserOptionalInfoKey.TWITTER_LINK)}'
                                       class='fa fa-twitter link' target="_blank"></a>
                                </c:if>
                                <c:if test="${keyDataMap.get(UserOptionalInfoKey.LINKEDIN_LINK) != null}">
                                    <a href='${keyDataMap.get(UserOptionalInfoKey.LINKEDIN_LINK)}'
                                       class='fa fa-linkedin link' target="_blank"></a>
                                </c:if>
                                <c:if test="${keyDataMap.get(UserOptionalInfoKey.WEBSITE_LINK) != null}">
                                    <a href='${keyDataMap.get(UserOptionalInfoKey.WEBSITE_LINK)}'
                                       class='fa fa-globe link' target="_blank"></a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- PROFILE TABS -->
<section class='profile profile-tabs mx-2 mx-sm-0'>
    <div class='container mb-5'>
        <div class='row justify-content-center'>
            <div class='col-md-11 tabs-container'>

                <ul class='nav nav-tabs' role='tablist'>
                    <!-- Tab 1 : About-->
                    <li class='nav-item '>
                        <a class='nav-link active' data-toggle='tab' href='#aboutTab'>
                            <i class='fa fa-user' aria-hidden='true'></i>
                            <span class='d-none d-md-inline'>About</span>
                        </a>
                    </li>
                    <!-- Tab 2 -->
                    <li class='nav-item'>
                        <a class='nav-link' data-toggle='tab' href='#educationTab'>
                            <i class='fa fa-graduation-cap' aria-hidden='true'></i>
                            <span class='d-none d-md-inline'>Education</span>
                        </a>
                    </li>
                    <!-- Tab 3 -->
                    <li class='nav-item'>
                        <a class='nav-link' data-toggle='tab' href='#experienceTab'>
                            <i class='fa fa-briefcase' aria-hidden='true'></i>
                            <span class='d-none d-md-inline'>Experience</span>
                        </a>
                    </li>
                    <!-- Tab 4 -->
                    <li class='nav-item'>
                        <a class='nav-link' data-toggle='tab' href='#storiesTab'>
                            <c:choose>
                                <c:when test="${user.type eq 'ADVERTISER'}">
                                    <i class='fa fa-bookmark' aria-hidden='true'></i>
                                    <span class='d-none d-md-inline'>Scholarships</span>
                                </c:when>
                                <c:when test="${user.type eq 'STUDENT'}">
                                    <i class='fa fa-commenting' aria-hidden='true'></i>
                                    <span class='d-none d-md-inline'>Stories</span>
                                </c:when>
                            </c:choose>
                        </a>
                    </li>
                </ul>

                <!-- Tabs Contents -->
                <div class='tab-content'>
                    <!-- Tab 1 : About -->
                    <div id='aboutTab' class='container tab-pane active no-content'>
                        <div class=' mb-2'>
                            <div class='row'>
                                <div class='col-sm-12 col-md-3'>
                                    <div class='heading'>
                                        <h3>About</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class='about-container'>
                            <c:choose>
                                <c:when test="${keyDataMap.get(UserOptionalInfoKey.BIO) != null}">
                                    <p>${keyDataMap.get(UserOptionalInfoKey.BIO)}</p>
                                </c:when>
                                <c:otherwise>
                                    <img src='${contextPath}/resources/static/img/no-content.png' alt='no-content' style="display: block;
                                        margin-left: auto; margin-right: auto; width: 50%;">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Tab 2 : Education-->
                    <div id='educationTab' class='tab-pane'>
                        <div class='container mb-2'>
                            <div class='row'>
                                <div class='col-sm-12 col-md-3'>
                                    <div class='heading'>
                                        <h3>Education</h3>
                                        <h6>ACADEMIC CAREER</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${user.educationHistoryList.size() !=0}">
                                <div class='experiences-container container-fluid'>
                                    <div class='row justify-content-center align-items-center'>
                                        <div class='col-lg-10'>
                                            <span class='icon-education'>
                                                <i class='fa fa-graduation-cap fa-lg'></i>
                                            </span>

                                            <div class='experience-nodes-box'>
                                                <c:forEach var="eduation" items="${user.educationHistoryList}">
                                                    <div class='experience-node'>
                                                        <c:choose>
                                                            <c:when test="${eduation.endDate == null}">
                                                                <c:set var="endDate" value="Current"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="endDate" value="${eduation.endDate}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <span data-aos='fade-up' class='period'>${eduation.startDate} <b>-</b> ${endDate}</span>
                                                        <i data-aos='fade-up' class='fa fa-university' aria-hidden='true'></i>
                                                        <h5 data-aos='fade-up' class='university-name'> ${eduation.university}</h5>
                                                        <p data-aos='fade-up' class=' pt-3'> ${eduation.description}</p>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <img src='${contextPath}/resources/static/img/no-content.png' alt='no-content' style="display: block;
                                        margin-left: auto; margin-right: auto; width: 42%;" class="container no-content">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Tab 3 : Experience-->
                    <div id='experienceTab' class='tab-pane '>
                        <div class='container mb-2'>
                            <div class='row'>
                                <div class='col-sm-12 col-md-3'>
                                    <div class='heading'>
                                        <h3>Work Experience</h3>
                                        <h6>PREVIOUS JOBS</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${user.workHistoryList.size() !=0}">
                                <div class='experiences-container container-fluid'>
                                    <div class='row justify-content-center align-items-center'>
                                        <div class='col-lg-10'>
                                            <span class='icon-experience'>
                                                <i class='fa fa-briefcase fa-lg'></i>
                                            </span>
                                            <div class='experience-nodes-box'>
                                                <c:forEach var="work" items="${user.workHistoryList}">
                                                    <div class='experience-node'>
                                                        <c:choose>
                                                            <c:when test="${work.endDate == null}">
                                                                <c:set var="endDate" value="Current"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="endDate" value="${work.endDate}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <span data-aos='fade-up' class='period'>${work.startDate} <b>-</b> ${endDate}</span>
                                                        <i data-aos='fade-up' class='fa fa-building' aria-hidden='true'></i>
                                                        <h5 data-aos='fade-up' class='experience-place'>${work.companyName}</h5>
                                                        <p data-aos='fade-up' class=' pt-3'>${work.position}</p>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <img src='${contextPath}/resources/static/img/no-content.png' alt='no-content'
                                     style="display: block; margin-left: auto; margin-right: auto; width: 42%;">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Tab 4 : Scholarships || Stories -->
                    <c:choose>
                        <c:when test="${user.type eq 'ADVERTISER'}">
                            <div id='storiesTab' class='tab-pane '>
                                <div class='container mb-2'>
                                    <div class='row'>
                                        <div class='col-sm-12 col-md-3'>
                                            <div class='heading'>
                                                <h3>Scholarships</h3>
                                                <h6 class='font-lite-black'> ALL ADVERTED SCHOLARSHIPS</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:choose>
                                    <c:when test="${scholarships.size() != 0}">
                                        <jsp:include page="parts/scholarship-node.jsp"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src='${contextPath}/resources/static/img/no-content.png' alt='no-content' style="display: block;
                                        margin-left: auto; margin-right: auto; width: 42%;" class="container no-content">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:when>
                        <c:when test="${user.type eq 'STUDENT'}">
                            <div id='storiesTab' class='tab-pane '>
                                <div class='container mb-2'>
                                    <div class='row'>
                                        <div class='col-sm-12 col-md-3'>
                                            <div class='heading'>
                                                <h3>Stories</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:choose>
                                    <c:when test="${stories.size() != 0}">
                                        <jsp:include page="parts/story-node.jsp"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src='${contextPath}/resources/static/img/no-content.png' alt='no-content' style="display: block;
                                        margin-left: auto; margin-right: auto; width: 42%;" class="container no-content">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

<section id='reportModelSection' class='profile'>
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
<%@include file="parts/footer.html" %>
</body>
</html>
