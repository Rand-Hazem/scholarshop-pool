<!DOCTYPE html>
<html>

<head>
    <title>View Opportunity</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="parts/links.html" %>
    <script src="${contextPath}/resources/static/js/view-scholarship.js"></script>
</head>
<body>
<!-------------------------- Start of Navbar -------------------------->
<nav class="navbar navbar-expand-lg  fixed-top  student-navbar">
    <div class="container-fluid">

        <a href="#" class="navbar-brand">
            <img class='logo' src="${contextPath}/resources/static/img/scholarship-graduaed-icon.svg" alt="LOGO">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#studentNav">
            <i class="fa fa-bars" aria-hidden="true" style="color: #ededed;"></i>
        </button>

        <div class="collapse navbar-collapse" id="studentNav">
            <ul class="nav navbar-nav">
                <li>
                    <div id='searchBox' class='d-inline-block'>
                        <i id='searchIcon' class="fa fa-search"></i>
                        <input id='searchField' type="text" name="username" placeholder="Type to search"/>
                    </div>
                </li>
                <li class="nav-item navbar-left">
                    <a href="#" class="nav-link" >Home</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Scholarships matches</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Applied scholarships</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Stories</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Profile</a>
                </li>
                <li class="nav-item">
                    <a href="#" class='nav-link notification'>
                        <p class='d-lg-none d-inline-block mb-0'>Notification &nbsp;</p>
                        <i class="fa fa-bell"></i>
                        <span class="badge badge-light">4</span>
                    </a>
                </li>
            </ul>

            <ul id="moreItemList" class="nav navbar-nav ml-auto">
                <li class="list-item">
                    <a id="anchorDropDownBtn" class="dropdown-toggle d-lg-inline-block" data-toggle="dropdown" data-target="dropdownMoreItem">
                        <span class="caret"></span>
                    </a>
                    <ul id='dropdownMoreItem' class="dropdown-menu dropdown-menu-right animate slide-in" >
                        <li><a href="#" class="dropdown-item">Edit profile</a></li>
                        <li><a href="#" class="dropdown-item">Desired scholarships </a></li>
                        <li><a href="#" class="dropdown-item">Wish list</a></li>
                        <li><a href="#" class="dropdown-item">New story</a></li>
                        <li><a href="#" class="dropdown-item">Saved stories</a></li>
                        <li><a href="#" class="dropdown-item">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--------------------------End of Navbar -------------------------->


<section class="view-opportunity">
    <div>
        <img class="opportunity-background-img" src="${contextPath}/resources/static/img/opportunity-background-img.jpg"
             alt="Opportunity background picture">
    </div>

    <!-------------- General Overview About the opportunity --------------->
    <div class="container view-opportunity-box">
        <div class="row">
            <div class="col-md-8 col-12">
                <!------------------------- Opportunity Title ------------------------->
                <h3 class="opportunity-title">Opportunity Title</h3>
                <p class="opportunity-description pt-2">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                    Praesentium nam quas inventore, ut iure iste modi eos
                    adipisci ad ea itaque labore earum autem nobis et numquam,
                    minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus porro.
                </p>
                <!-------------- organization and puplish date -------------->
                <div class="opportunity-meta">
                    <span class="advertiser mr-2 border-right">
                        <img src="${contextPath}/resources/static/img/user-icon.png" alt="author" class="mr-2">
                        Advertiser Name
                    </span>
                    <span class="provider-organization mr-2 border-right">
                        Organization XYZ
                    </span>
                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                    <span class="puplish-date">Sep 17, 2019 </span>
                </div>

                <b><a href="">Sign Up to Start Applying</a></b>
            </div>

            <div class="col-md-4 col-12">
                <div class="opportunity-fund">
                    <!--It will take one of the following values:
                        Full Funding, Partial Funding, Monthly Salary, No Funding
                        If its Full Funding     => "Full Funding"  will be written
                        If its Partial Funding  => "Partial Funding"  will be written
                        If its monthly salary   => salary amount will be written
                        If its no funding       => the div will not appear
                    -->
                    <i class="fa fa-money"></i> <b>$1000</b>
                </div>
                <div class="opportunity-deadline">
                    Deadline: <b>12/12/2019</b>
                </div>
                <button type="button" class="btn save-opportunity"><i class="fa fa-heart"></i> Save opportunity</button>
            </div>
        </div>
    </div>

    <!-------- Common Information for scholarships and internships -------->
    <div class="container view-opportunity-box">
        <h2><i class="fa fa-info-circle"></i> General Information</h2><br><br>

        <h4>Opportunity Type</h4>
        <p id="opportunity-type">Scholarships</p><br>

        <h4>Opportunity will take place in</h4>
        <p id="opportunity-country-city">Germany, Munich</p><br>

        <h4>Duration</h4>
        From <span id="opportunity-duration-from">12-12-2019</span> ,To <span id="opportunity-duration-to">12-2-2020</span>
        <br><br><br>

        <h4>About opportunity funding</h4>
        <b><span id="opportunity-fund-type">Partial Funding</span>:</b>
        <span id="opportunity-fund-description">Accommodation, Visa Costs</span><br><br><br>


        <h4>Available Seats: <span id="opportunity-seats">3</span></h4><br><br>

        <h4>Opportunity Website Address</h4>
        <a id="opportunity-website" href="">www.xyz.com</a><br><br><br>

        <h4>What does the successful applicant gain from your opportunity? Opportunity privileges</h4>
        <p id="opportunity-privileges">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Praesentium nam quas inventore, ut iure iste modi eos
            adipisci ad ea itaque labore earum autem nobis et numquam,
            minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
        </p><br>
    </div>

    <!---------------------- Scholarship Information ---------------------->
    <div class="scholarship">
        <div class="container view-opportunity-box">
            <h2><i class="fa fa-briefcase"></i> Opportunity Details#1</h2><br><br>

            <h4>Provider Information</h4>
            <p><b>Advertiser: </b> <span id="advertiser">Muatamad AlKhatib</span></p>
            <p><b>Provider Organization: </b> <span id="provider-organization">Organization X</span></p>
            <p><b>Special Program: </b> <span id="special-program">ERASMUS</span></p><br><br>

            <h4>Academic Information of Opportunity</h4>
            <p><b>Host University: </b> <span id="university">University T</span></p>
            <p><b>Opportunity Degree: </b> <span id="degree">Master</span></p>
            <p><b>Major: </b> <span id="major">Computer engineering</span></p>
            <p><b>Field </b> <span id="field">AI</span></p>
            <p><b>Teaching Language </b> <span id="teaching-language">English</span></p>
        </div>
        <div class="container view-opportunity-box">
            <h2><i class="fa fa-user"></i> Opportunity Details#2</h2><br><br>

            <h4>Applicant Requirements</h4>
            <p><b>Applicant Nationality: </b> <span id="nationality">Any nationality</span></p>
            <p><b>Resident in: </b> <span id="resident-country">Any country </span></p>
            <p><b>Applicant Gender: </b> <span id="gender">Female</span></p>
            <p><b>Fluent In: </b> <span id="fluent">English</span></p>
            <p><b>Applicant Age Limit: </b> From <span id="age-from">20</span> To <span id="age-to">33</span></p>
            <p><b>Minimum Degree Held: </b> <span id="min-degree">Bachelor</span></p>
            <p><b>In Major: </b> <span id="min-degree-major">CSE</span></p>
            <p><b>Number of years a student must have successfully completed:</b> <span id="years">4</span></p><br><br>


            <h4>Eligibility Criteria</h4>
            <p><b>Minimum (School) GPA: </b> <span id="school-gpa">90</span></p>
            <p><b>Minimum (university) GPA  </b> <span id="university-gpa">3</span></p>
            <p><b>English Level: </b> <span id="english-level">B2</span></p>
            <p><b>Special Certificate/s</b></p>
            <p id="certificate">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p>
        </div>
        <div class="container view-opportunity-box">
            <h2><i class="fa fa-file"></i> How to Apply</h2><br><br>

            <h3>Required Documents </h3>
            <p id="documents">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p><br>

            <h3>How to apply for the opportunity?</h3>
            <p id="how-apply">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p><br>

            <h3>Application Link</h3>
            <a id="application-link" href="">www.ccc.com</a><br><br>


            <h3>Illustration File of The Opportunity</h3>
            <a id="file" href="">www.ccc.com</a>
        </div>
    </div>

    <!---------------------- Internship Information ----------------------->
    <div class="internship d-none">
        <div class="container view-opportunity-box">
            <h2><i class="fa fa-briefcase"></i> Opportunity Details#1</h2><br><br>

            <h4>Provider Information</h4>
            <p><b>Advertiser: </b> <span id="advertiser">Muatamad AlKhatib</span></p>
            <p><b>Provider Organization: </b> <span id="provider-organization">Organization X</span></p>
            <p><b>Employer Name: </b> <span id="employer-name">zzzz vvvvv</span></p>
            <p><b>Business or Products: </b> <span id="business-products">Business</span></p>
            <p><b>Employer Website: </b> <a id="employer-website" href="">www.ccc.com</a></p>
            <p><b>Location of Placement: </b> <span id="location"></span></p><br><br>

            <h4>Training Opportunity Details</h4>
            <p><b>Training Language: </b><span id="training-language">English</span></p>

            <p><b>Working Environment</b></p>
            <p id="working-environment">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p>

            <p><b>Responsibilities</b></p>
            <p id="responsibilities">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p>

            <p><b>Expected to Gain/Benefits</b></p>
            <p id="benefits">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p>

            <p><b>Number of Weeks Offered: </b><span id="weaks">6</span></p>
            <p><b>Working days per Weak: </b><span id="days">5</span></p>
            <p><b>Daily Working Hours: </b><span id="hours">8</span></p>
        </div>
        <div class="container view-opportunity-box">
            <h2><i class="fa fa-user"></i> Opportunity Details#2</h2><br><br>

            <h4>Applicant Requirements</h4>
            <p><b>Applicant Nationality: </b> <span id="nationality">Any nationality</span></p>
            <p><b>Resident in: </b> <span id="resident-country">Any country </span></p>
            <p><b>Applicant Gender: </b> <span id="gender">Female</span></p>
            <p><b>Fluent In: </b> <span id="fluent">English</span></p>
            <p><b>Applicant Age Limit: </b> From <span id="age-fom">20</span> To <span id="age-to">33</span></p>
            <p><b>Minimum Degree Held: </b> <span id="min-degree">Bachelor</span></p>
            <p><b>In Major: </b> <span id="min-degree-major">CSE</span></p>
            <p><b>Number of years a student must have successfully completed:</b> <span id="years">4</span></p>
            <p><b>Required Knowledge and Experience</b></p>
            <p id="Knowledge">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p>
            <p><b>Other Requirements</b></p>
            <p id="other-requirements">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p><br><br>


            <h4>Eligibility Criteria</h4>
            <p><b>Minimum (School) GPA: </b> <span id="school-gpa">90</span></p>
            <p><b>Minimum (university) GPA  </b> <span id="university-gpa">3</span></p>
            <p><b>English Level: </b> <span id="english-level">B2</span></p>
            <p><b>Special Certificate/s</b></p>
            <p id="certificate">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p>
        </div>
        <div class="container view-opportunity-box">
            <h2><i class="fa fa-file"></i> How to Apply</h2><br><br>

            <h3>Required Documents </h3>
            <p id="documents">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p><br>

            <h3>How to apply for the opportunity?</h3>
            <p id="how-apply">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Praesentium nam quas inventore, ut iure iste modi eos
                adipisci ad ea itaque labore earum autem nobis et numquam,
                minima eius. Nam eius, non unde ut aut sunt eveniet rerum repellendus
            </p><br>

            <h3>Application Link</h3>
            <a id="application-link" href="">www.ccc.com</a><br><br>


            <h3>Illustration File of The Opportunity</h3>
            <a id="file" href="">www.ccc.com</a>
        </div>
    </div>
</section>

<%@include file="parts/footer.html" %>



</body>
</html>