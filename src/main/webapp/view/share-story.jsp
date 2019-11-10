
<!DOCTYPE html>
<head>
    <title>share story</title>
    <%@include file="parts/links.html" %>
    <link href="https://fonts.googleapis.com/css?family=Leckerli+One&display=swap" rel="stylesheet">
    <!--Include SmartWizard JavaScript source-->
    <script type="text/javascript" src="${contextPath}/resources/static/js/jquery.smartWizard.min.js"></script>
    <script src="${contextPath}/resources/static/js/share-story.js"></script>

</head>
<body>
<jsp:include page="parts/navbar.jsp"/>
<!--  ------------------------------------------------------------------------------------------------------- -->
<section class="share-story welcome-section">
    <div class="d-flex justify-content-center h-100">
        <p class="my-auto d-none">
            <!--Or memory tells us a stories, that is, what we get to keep in from our experience in a story-->
            Tell us your story
        </p>
        <img src="${contextPath}/resources/static/img/story-welcome-bk.gif" class="my-auto d-none">
    </div>
</section>


<section class="share-story stepper-section container-fluid"> <!--  Stepper section    -->
    <div class="d-flex justify-content-center">
        <div class="stepper col-12 col-md-10">
            <form action="#" id="storyForm" name="story" role="form" method="post" accept-charset="utf-8">

                <!--SmartWizard html-->
                <div id="smartwizard" class="sw-main sw-theme-circles">
                    <ul id="stepsNav">
                        <li>
                            <a href="#step-1"><i class="fa fa-smile-o  step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-2"><i class="fa fa-question step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-3"><i class="fa fa-commenting-o step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li id="aboutUnivTrainTab">
                            <a href="#step-4"><i class="fa fa-university step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-5"><i class="fa fa-home step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-6"><i class="fa  fa-globe step-icon" aria-hidden="true"></i></a>
                        </li>
                        <li>
                            <a href="#step-7"><i class="fa fa-check step-icon" aria-hidden="true"></i></a>
                        </li>
                    </ul>


                    <div> <!-- SW steps -->
                        <div id="step-1"> <!-- Step 1 > Welcome Text -->
                            <h4>Hi friend</h4>
                            <div id="form-step-0" role="form">
                                <p id="welcomeText">We are so happy that you want to share you story with others
                                    and help them, any WebsiteName visitor can view you story
                                    pla pla pla pla ...
                                </p>
                            </div>
                        </div>


                        <div id="step-2"> <!-- Step 2 > General information -->
                            <h4>General</h4>
                            <div id="form-step-1" role="form">

                                <div class="form-group">
                                    <label for="title">Title *</label>
                                    <input id="title" name="title" type="text" class="form-control"
                                           placeholder="Exciting title for you story" required>
                                </div>

                                <div class="form-group">
                                    <div class="d-inline-block w-100 w-md-50 align-top">
                                        <label for="countryList">Host Country *</label>
                                        <select id="countryList" name="countryList" class="custom-select" required>
                                            <option value="" selected disabled hidden> -- select option --</option>
                                            <option value="AF">Afghanistan</option>
                                            <option value="AX">Åland Islands</option>
                                            <option value="AL">Albania</option>
                                            <option value="DZ">Algeria</option>
                                            <option value="AS">American Samoa</option>
                                            <option value="AD">Andorra</option>
                                            <option value="AO">Angola</option>
                                            <option value="AI">Anguilla</option>
                                            <option value="AQ">Antarctica</option>
                                            <option value="AG">Antigua and Barbuda</option>
                                            <option value="AR">Argentina</option>
                                            <option value="AM">Armenia</option>
                                            <option value="AW">Aruba</option>
                                        </select>
                                    </div>
                                    <div class="d-inline-block w-100 w-md-50 align-top">
                                        <label for="city">City *</label>
                                        <input id="city" name="city" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="d-inline-block w-md-50 w-xs-100 align-top">
                                        <label for="dateFrom">From *</label>
                                        <input id="dateFrom" name="dateFrom" type="date" class="form-control"
                                               onkeydown="return false" required>
                                    </div>
                                    <div class="d-inline-block w-md-50 w-xs-100 align-top">
                                        <label for="dateTo">To *</label>
                                        <input id="dateTo" name="dateTo" type="date" class="form-control"
                                               onkeydown="return false" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="d-inline-block w-md-50">
                                        <div class="custom-control custom-radio">
                                            <input id="scholarshipRadio" name="storyFor" type="radio"
                                                   value="Scholarship" class="custom-control-input" checked>
                                            <label class="custom-control-label"
                                                   for="scholarshipRadio">Scholarship</label>
                                        </div>
                                    </div>
                                    <div class="d-inline-block w-md-50">
                                        <div class="custom-control custom-radio">
                                            <input id="internshipRadio" name="storyFor" type="radio" value="Internship"
                                                   class="custom-control-input">
                                            <label class="custom-control-label" for="internshipRadio">Internship</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="providerOrg">Provided by
                                        <br>
                                        <small>
                                            Name of the organization which provide your opportunity, if
                                            there is no one, please leave it empty
                                        </small>
                                    </label>
                                    <input id="providerOrg" name="providerOrg" type="text" class="form-control"
                                           placeholder="Organization Name">
                                </div>

                                <div class="form-group">
                                    <label for="fieldsList">Field *</label>
                                    <select id="fieldsList" name="fieldsList" class="custom-select" required>
                                        <option value="" selected disabled hidden> -- select option --</option>
                                        <option value="1">Computer Science & IT</option>
                                        <option value="2">Business Information Systems</option>
                                        <option value="3">Journalism & Media</option>
                                        <option value="4">Medicine & Health</option>
                                        <option value="5">Arts, Design & Architecture</option>
                                    </select>
                                </div>

                            </div>
                        </div><!-- step end -->


                        <div id="step-3"> <!-- Step 3 > Your story/About opportunity-->
                            <div id="form-step-2" role="form">
                                <div class="form-group">
                                    <h4>Your story</h4>
                                    <p>
                                        Talk about your story, how did you get the opportunity, about your journey, your
                                        experience .. etc
                                    </p>
                                    <textarea id="storyInshort" name="storyInShort" class="form-control"
                                              rows="5"></textarea>
                                </div>
                                <div class="form-group">
                                    <h4>About Opportunity</h4>
                                    <p>
                                        How did you find and win the opportunity, required documents, visa & applicant
                                        .. etc
                                    </p>
                                    <textarea id="aboutOpportunity" name="aboutOpportunity" class="form-control"
                                              rows="5"></textarea>
                                </div>
                            </div>
                        </div><!-- step end -->


                        <div id="step-4">
                            <!-- Step 4 > [University & education system  OR Company & trianing] / About accommodation-->
                            <div id="form-step-3" role="form">
                                <div id="aboutUniversityDiv" class="form-group">
                                    <h4>University & Education System</h4>
                                    <p>
                                        Talk about the host university, describe education system, things you did like
                                        and don't ..etc
                                    </p>
                                    <textarea id="aboutUniversity" name="aboutUniversity" class="form-control"
                                              rows="5"></textarea>
                                </div>
                                <div id="aboutInternshipDiv" class="d-none form-group">
                                    <h4>Internship program & host Company</h4>
                                    <p>
                                        Talk about host company, the training, worked hours, your tasks, paid or not
                                        ..etc
                                    </p>
                                    <textarea id="aboutCompany" name="aboutCompany" class="form-control"
                                              rows="5"></textarea>
                                </div>
                                <div class="form-group">
                                    <h4>Accommodation</h4>
                                    <p>
                                        Was included in the opportunity, how did you found accommodation,
                                        you may include some links that help others, coast in general ..etc
                                    </p>
                                    <textarea id="aboutAccommodation" name="aboutAccommodation" class="form-control"
                                              rows="5"></textarea>
                                </div>
                            </div>
                        </div><!-- step end -->


                        <div id="step-5"> <!-- Step 5 > Life in city-name/transportation -->
                            <div id="form-step-4" role="form">
                                <div class="form-group">
                                    <h4>Life in <label id="cityNameInStepHeader"></label></h4>
                                    <p>
                                        Talk about cost of living, safety, work permit, driving licence ..etc
                                    </p>
                                    <textarea id="lifeInCity" name="lifeInCity" class="form-control"
                                              rows="5"></textarea>
                                </div>
                                <div class="form-group">
                                    <h4>Transportation</h4>
                                    <p>
                                        Talk about transportation system
                                    </p>
                                    <textarea id="transportation" name="transportation" class="form-control"
                                              rows="5"></textarea>
                                </div>
                            </div>
                        </div><!-- step end -->


                        <div id="step-6"> <!-- Step 6 > culture and tradition  -->
                            <div id="form-step-5" role="form">
                                <div class="form-group">
                                    <h4>Culture & Tradition</h4>
                                    <p>
                                        Beautiful or special cultures and customs you found, recommended places to
                                        visit, you may include links
                                    </p>
                                    <textarea id="culture" name="culture" class="form-control" rows="5"></textarea>
                                </div>
                                <div class="form-group">
                                    <h4>Recommendation & Advice</h4>
                                    <p>
                                        Give some recommendation and advices through your experience
                                    </p>
                                    <textarea id="advices" name="advices" class="form-control" rows="5"></textarea>
                                </div>
                            </div>
                        </div><!-- step end -->


                        <div id="step-7"> <!-- Step 7 > Finish -->
                            <div id="form-step-6" role="form">
                                <div class="form-group">
                                    <h4>Finally ..</h4>
                                    <p>
                                        Upload same photo you want to share with other
                                    </p>
                                    <div class="row">

                                        <div class="uploade-img-box">
                                            <div class="image-preview">
                                                <button class="btn btnc-delete"><i class="fa fa-times"
                                                                                   aria-hidden="true"></i></button>
                                            </div>
                                            <div class="upload-options">
                                                <label>
                                                    <input name="img-1" type="file" class="input-image"
                                                           accept="image/png, image/jpg"/>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="uploade-img-box">
                                            <div class="image-preview">
                                                <button class="btn btnc-delete"><i class="fa fa-times"
                                                                                   aria-hidden="true"></i></button>
                                            </div>
                                            <div class="upload-options">
                                                <label>
                                                    <input name="img-2" type="file" class="input-image"
                                                           accept="image/png, image/jpg"/>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="uploade-img-box">
                                            <div class="image-preview">
                                                <button class="btn btnc-delete"><i class="fa fa-times"
                                                                                   aria-hidden="true"></i></button>
                                            </div>
                                            <div class="upload-options">
                                                <label>
                                                    <input name="img-3" type="file" class="input-image"
                                                           accept="image/png, image/jpg"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><!-- step end -->

                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<hr class="share-story h-line">

<section class="share-story container life-preview"><!-- Life preview -->
    <div class="row"> <!-- General -->
        <div class="col-md-10 col-11 m-auto">
            <h1 id="title"></h1>
            <div>
                <span id="city"></span>
                <span id="country" style="margin-left: -3px"></span>
            </div>
            <div>
                <span id="dateFrom"></span>
                <span id="dateTo"></span>
            </div>
            <div>
                <span id="type"></span>
                <span id="providerOrg"></span>
            </div>
            <div>
                <span id="field"></span>
            </div>
        </div>
    </div>

    <div class="row mt-5"> <!-- Story in short -->
        <div class="col-md-10 m-auto">
            <p id="storyInshort"></p>
        </div>
    </div>

    <div class="row"> <!-- Opportunity-->
        <div class="col-md-10 m-auto">
            <h4 id="opportunityHeader">Opportunity i got</h4>
            <p id="opportunity"></p>
        </div>
    </div>

    <div class="row"> <!-- Education -->
        <div class="col-md-10 m-auto">
            <h4 id="educationHeader">University & Education System</h4>
            <p id="education"></p>
        </div>
    </div>

    <div class="row"> <!-- Training -->
        <div class="col-md-10 m-auto">
            <h4 id="traningHeader">Internship program & host Company</h4>
            <p id="traning"></p>
        </div>
    </div>

    <div class="row"> <!-- Accommodation -->
        <div class="col-md-10 m-auto">
            <h4 id="accommodationHeader">Accommodation</h4>
            <p id="accommodation"></p>
        </div>
    </div>

    <div class="row"> <!-- Life in city -->
        <div class="col-md-10 m-auto">
            <h4 id="lifrInCityHeader">Life in this city</h4>
            <p id="lifeInCity"></p>
        </div>
    </div>

    <div class="row"> <!-- transportation-->
        <div class="col-md-10 m-auto">
            <h4 id="transportationHeader">Transportation</h4>
            <p id="transportation"></p>
        </div>
    </div>

    <div class="row"> <!-- Culture & Tradition -->
        <div class="col-md-10 m-auto">
            <h4 id="cultureHeader">Culture & Tradition</h4>
            <p id="culture"></p>
        </div>
    </div>

    <div class="row"> <!-- Recommendation & Advice -->
        <div class="col-md-10 m-auto">
            <h4 id="adviceHeader">Recommendation & Advice</h4>
            <p id="advices"></p>
        </div>
    </div>

</section>
<%@include file="parts/footer.html" %>

</body>
</html>