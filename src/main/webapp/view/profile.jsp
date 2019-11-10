<!DOCTYPE html>
<html lang='en'>
<head>
    <title>View Profile</title>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <%@include file="parts/links.html" %>
    
    <script src='${contextPath}/resources/static/js/story-ajax.js'></script>
    <script src='${contextPath}/resources/static/js/profile.js'></script>
</head>
<body>
<jsp:include page="parts/navbar.jsp"/>
<!--  ------------------------------------------------------------------------------------------------------- -->

<!-- Profile -->
<div class='profile profile-div'>
    <div class='container'>
        <div class='row'>
            <!-- Profile Picture -->
            <div class='col-xs-12 col-sm-4 col-lg-3 profile-picture-div center'>
                <img class='img-fluid profile-picture' src='${contextPath}/resources/static/img/user-icon.png' alt='username'>
            </div>

            <!-- Profile Information Overview -->
            <div class='col-xs-12 col-sm-8 col-lg-9 profile-overview'>

                <div class='profile-info'>
                    <!-- Name -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Name</div>
                        <div class='profile-info-value'>
                            <span>Haneen Abu Ali</span>
                        </div>
                    </div>


                    <!-- Nationality -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Nationality</div>

                        <div class='profile-info-value'>
                            <span>Palestinian</span>
                        </div>
                    </div>

                    <!-- Country of residence -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Resident</div>

                        <div class='profile-info-value'>
                            <i class='fa fa-map-marker light-orange'></i>
                            <span>Palestine</span>
                            <span>Tulkarm</span>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> E-mail</div>

                        <div class='profile-info-value'>
                            <span><a href='mailto:mail@mail.com'> mail@example.com</a></span>
                        </div>
                    </div>

                    <!-- Phone No. -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Phone</div>
                        <div class='profile-info-value'>
                            <span>+123 456 789 01</span>
                        </div>
                    </div>

                    <!-- D.O.B -->
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> D.O.B</div>
                        <div class='profile-info-value'>
                            <span>10/10/2000</span>
                        </div>
                    </div>
                    <div class='profile-info-row'>
                        <div class='profile-info-name'> Social Media</div>
                        <div class='profile-info-value'>
                            <div class='social-media-links'>
                                <a href='#' class='fa fa-facebook link'></a>
                                <a href='#' class='fa fa-twitter link'></a>
                                <a href='#' class='fa fa-envelope link'></a>
                                <a href='#' class='fa fa-linkedin link'></a>
                                <a href='#' class='fa fa-instagram link'></a>
                                <a href='#' class='fa fa-globe link'></a>
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
                            <i class='fa fa-commenting' aria-hidden='true'></i>
                            <span class='d-none d-md-inline'>Stories</span>
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
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                Soluta exercitationem nam perferendis tempora eius repellat expedita numquam,
                                beatae eaque nihil Aliquam architecto voluptatum provident animi,
                                excepturi fugit ut! Impedit, eum!
                            </p>
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

                        <div class='experiences-container container-fluid'>
                            <div class='row justify-content-center align-items-center'>
                                <div class='col-lg-10'>
                                            <span class='icon-education'>
                                                <i class='fa fa-graduation-cap fa-lg'></i>
                                            </span>

                                    <div class='experience-nodes-box'>
                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>Jan 2015 - Current</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='education-major'> Ph.D Degree</h5>
                                            <i data-aos='fade-up' class='fa fa-university' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='university-name'> XXX University</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                                Cras porta massa pretium auctor congue. Suspendisse ante massa,
                                                euismod sit amet sem sed, viverra tristique diam.
                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>May 2013 - Aug 2014</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='education-major'> Professional Diploma in
                                                Graphic Design</h5>
                                            <i data-aos='fade-up' class='fa fa-university' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='university-name'> XXX College</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>Sep 2010 - Sep 2012</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='education-major'> Master of Engineering in
                                                Computer Engineering</h5>
                                            <i data-aos='fade-up' class='fa fa-university' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='university-name'> ZZZ University</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Thesis: Nulla, Omnis Vitae Illum Molestiae Rem.
                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>Aug 2005 - Aug 2009</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='education-major'> Bachelor of Engineering in
                                                Computer Science</h5>
                                            <i data-aos='fade-up' class='fa fa-university' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='university-name'> XXX University</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                                Cras porta massa pretium auctor congue. Suspendisse ante massa,
                                                euismod sit amet sem sed, viverra tristique diam.
                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>Sep 2006 - May 2009</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='education-major'> High Degree - School Of
                                                Science</h5>
                                            <i data-aos='fade-up' class='fa fa-university' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='university-name'> XXX School</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                                Cras porta massa pretium auctor congue. Suspendisse ante massa,
                                                euismod sit amet sem sed, viverra tristique diam.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                        <div class='experiences-container container-fluid'>
                            <div class='row justify-content-center align-items-center'>
                                <div class='col-lg-10'>
                                            <span class='icon-experience'>
                                                <i class='fa fa-briefcase fa-lg'></i>
                                            </span>
                                    <div class='experience-nodes-box'>
                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>Jan 2015 - Current</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-name'> Ph.D Degree</h5>
                                            <i data-aos='fade-up' class='fa fa-building' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-place'> XXX University</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                                Cras porta massa pretium auctor congue. Suspendisse ante massa,
                                                euismod sit amet sem sed, viverra tristique diam.
                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>Aug 2007 - Current</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-name'> Professional Diploma in
                                                Graphic Design</h5>
                                            <i data-aos='fade-up' class='fa fa-building' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-place'> XXX Company</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.

                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>AUG 2007 - JAN 2010</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-name'> Front-End Web Developer</h5>
                                            <i data-aos='fade-up' class='fa fa-building' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-place'> XXX Company</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                                Cras porta massa pretium auctor congue. Suspendisse ante massa,
                                                euismod sit amet sem sed, viverra tristique diam.
                                            </p>
                                        </div>

                                        <div class='experience-node'>
                                            <span data-aos='fade-up' class='period'>AUG 2007 - JAN 2010</span>
                                            <i data-aos='fade-up' class='fa fa-file-text' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-name'> Back-End Web Developer</h5>
                                            <i data-aos='fade-up' class='fa fa-building' aria-hidden='true'></i>
                                            <h5 data-aos='fade-up' class='experience-place'> XXX Company</h5>

                                            <p data-aos='fade-up' class=' pt-3'>
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                                In semper lacus tortor, quis bibendum odio mattis vitae.
                                                Cras porta massa pretium auctor congue. Suspendisse ante massa,
                                                euismod sit amet sem sed, viverra tristique diam.
                                            </p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tab 4 : Stories -->
                    <div id='storiesTab' class='tab-pane '>
                        <div class='container mb-2'>
                            <div class='row'>
                                <div class='col-sm-12 col-md-3'>
                                    <div class='heading'>
                                        <h3>Stories</h3>
                                        <h6 class='font-lite-black'>MY EXPERIENCE</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class='story-nodes-box container-fluid'>
                            <div class='row justify-content-center align-items-center'>
                                <div class='col-lg-11'>
                                    <jsp:include page="parts/story-node.jsp"/>
                                </div>
                            </div>
                        </div>
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
