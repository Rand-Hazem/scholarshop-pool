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

            <div class="input-group mb-5 card-shadow search-story">
                <input type="text" id="searchAutocomplete" class="form-control" placeholder="Search Stories ..">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button">
                        <i class="fa fa-search mr-1"></i>
                        Search
                    </button>
                </div>
            </div>

            <div class="filter-container">
                <h3 class="d-inline text-primary-color"><b>Stories</b></h3>
                <div class="float-right">
                    <select id="sortByList" name="sortByList" class="custom-select custom-focuse" required>
                        <option value="" selected disabled hidden> -- Sort by --</option>
                        <option value="1">University</option>
                        <option value="2">City</option>
                        <option value="3">Special Program</option>
                    </select>
                </div>
            </div>

            <div class='story-nodes-box container-fluid'>
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
<%@include file="parts/footer.html"%>

</body>
</html>


