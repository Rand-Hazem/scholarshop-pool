<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class='story-nodes-box container-fluid'>
    <div class='row justify-content-center align-items-center'>
        <div class='col-lg-11'>
            <c:forEach var="scholarships" items="${scholarships}">
                <div data-aos='fade-up' class='story-node mt-3'>
                    <div class='story-box-header'>
                        <div class='dropdown'>
                            <button type='button' class='btn btn-toggle-menu float-right' data-toggle='dropdown'>
                                <i class='fa fa-ellipsis-h' aria-hidden='true'></i>
                            </button>
                            <div class='dropdown-menu'>
                                <c:if test="${owner}">
                                    <a class="dropdown-item" href="${contextPath}/story/edit?id=${story.id}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</a>
                                    <a id="deleteStory" class="dropdown-item" href="#"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</a>
                                </c:if>
                                <c:if test="${!owner}">
                                    <a class="dropdown-item" href="#"><i class="fa fa-bookmark-o" aria-hidden="true"></i> Save</a>
                                </c:if>
                            </div>
                        </div>
                        <div class='story-box-title-and-date'>
                            <h4 class='story-title'>${scholarships.title}</h4>
                            <h6 class='text-muted story-date'>
                                <span data-country="${scholarships.country}"></span>
                                <span>, ${scholarships.city}</span><br>
                                <span>${scholarships.fundType} FUNDING, </span>
                                <c:if test="${scholarships.fundAmount!=0 }">
                                    <span>$${scholarships.fundAmount}</span>
                                </c:if>
                            </h6>
                        </div>
                    </div>
                    <div class='story-content'>
                        <p class='story-text'>${scholarships.description}</p>
                        <hr style='margin-top: 15px; margin-bottom: 15px;'>

                        <div class='story-box-footer'>
                            <span>DeadLine</span>
                            <c:choose>
                                <c:when test="${scholarships.applyDeadline == null}">
                                    <span class="text-muted">Open deadline</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted">${scholarships.applyDeadline}</span>
                                </c:otherwise>
                            </c:choose>
                            <button type='button' class='btn' style="background-color: #1F3543; color: white; border-radius:
                                                        5px; padding: 6px 12px;  font-size: 14px; float: right;">View</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>