<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class='story-nodes-box container-fluid'>
    <div class='row justify-content-center align-items-center'>
        <div class='col-lg-11'>
            <c:forEach var="story" items="${stories}">
                <div data-aos='fade-up' class='story-node mt-5'>
                    <div class='story-box-header'>
                        <div class='dropdown'>
                            <button type='button' class='btn btn-toggle-menu float-right' data-toggle='dropdown'>
                                <i class='fa fa-ellipsis-h' aria-hidden='true'></i>
                            </button>
                            <div class='dropdown-menu'>
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
                        <div class='story-box-title-and-date'>
                            <h5 class='story-title'>
                                <i class='fa fa-pencil-square-o' aria-hidden='true'></i> ${story.title}</h5>

                            <p class='text-muted'>At <span data-country="${story.hostCountry}"></span>
                                <span>, ${story.city}</span></p>
                            <p class='text-muted'>${story.storyType} opportunity</p>
                            <p class='text-muted story-date'>${story.startDate} - ${story.endDate}</p>

                            By :
                            <span class="user-card">
                                <a class="user-name" href="">${user.firstName} ${user.lastName}</a>
                                <span class="user-details">
                                    <c:choose>
                                        <c:when test="${empty user.imgUrl}">
                                            <img src="${contextPath}/resources/static/img/user-icon.png" alt="user img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img class='img-fluid profile-picture' src='${contextPath}${profileImgPath}${user.imgUrl}' alt='username'>
                                        </c:otherwise>
                                    </c:choose>
                                    <span>Field of study: ${story.field}</span><br>
                                    <span>Study/Studied At ${user.student.university.name} University</span>
                                </span>
                            </span>
                        </div>
                    </div>

                    <!-- Story Content-->
                    <div class='story-content'>
                        <p class='story-text'>${story.storyInShort}</p>
                        <hr style='margin-top: 15px; margin-bottom: 15px;'>

                        <!-- Story Box Footer -->
                        <div class='story-box-footer'>
                            <button class='btn like'>
                                <i class='fa fa-thumbs-o-up fa-lg' aria-hidden='true'></i>&nbsp;
                                <span class='likes-count'>${story.likes}</span>
                            </button>
                            <a type='button' href="${contextPath}/story/${story.id}/${fn:replace(story.title, " " ,"_")}" class='btn view-btn'>View</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>