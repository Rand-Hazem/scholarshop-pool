<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>OPPEX</title>
    <%@include file="parts/links.html" %>
    <script src="${contextPath}/resources/static/js/main.js"></script>
</head>
<body>

<div class="container-fluid main"> <!-- navbar and header  -->
    <div id="mainTopHeader" class="row main-top-header">
        <p class="website-name">Opportunities Exchange OPPEX</p>
    </div>

    <div class="row position-relative w-100">

        <div id="slider" class="carousel slide main-slider carousel-fade" data-ride="carousel">
            <div class="carousel-inner">
                <div id="mainScreenBackground1" class="carousel-item active">
                    <img id="mainBackgroundImg1" class="kenburns-top" alt="slider img1"
                         src="${contextPath}/resources/static/img/main-slider1.jpg">
                </div>
                <div id="mainScreenBackground2" class="carousel-item">
                    <img id="mainBackgroundImg2" class="kenburns-top" alt="slider img2"
                         src="${contextPath}/resources/static/img/main-slider2.jpg">
                </div>
            </div>
        </div>

        <div id="transperantDivLayout">
            <nav id="mainNavbar" class="navbar navbar-expand-lg fixed-top main-navbar">
                <a class="navbar-brand" href="#">
                    <img src="${contextPath}/resources/static/img/logo-dark.png" class="logo">
                </a>

                <div id="loginSignupNavContainer">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="register"><i class="fa fa-user" aria-hidden="true"></i>
                                Sign-up</a>
                        </li>
                        <li class="nav-item">
                            <a id="btnLoginAnchor" class="nav-link" data-toggle="modal" data-target="#loginModel"
                               style="cursor: pointer">
                                <i class="fa fa-sign-in" aria-hidden="true"></i>Login
                            </a>
                        </li>
                    </ul>
                </div>

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#mainCollapsibleNavbar">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </button>

                <div class="collapse navbar-collapse" id="mainCollapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link " href="#">Advertisers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/scholarship/search">Scholarships</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath}/story/all">Students stories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                    </ul>
                </div>
            </nav>


            <div class="row h-100">
                <div class="my-auto">
                    <h1 id="mainWelcomTextHeading" class="bounce-in-top">ACCEPT THE CHALLENGE</h1>
                    <h5 id="subWelcomTextHeading" class="fade-in">
                        “Don’t wait until everything is just right.
                        It will never be perfect. There will always be challenges, obstacles, and less than perfect
                        conditions.So what? Get started now. With each step you take, you will grow stronger and
                        stronger,
                        more and more skilled, more and more self-confident, and more and more successful.”
                    </h5>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="services"> <!-- service discription -->
    <div class="container-fluid">

        <div class="row d-flex justify-content-center"> <!-- service discription (find scholaship)-->
            <div class="col-sm-11 col-lg-5 d-flex justify-content-center">
                <img src="${contextPath}/resources/static/img/certificate.png" class="expressive-img shake-vertical">
            </div>
            <div class="col-sm-11 col-lg-5 my-auto">
                <span class="explain-services-step-num">1</span>
                <h2 class="explain-srvices-heading">Explore scholarships</h2>
                <p class="align-middle explain-service-text">
                    In scholarship website you can browse scholarships all over the world,
                    you can find scholarship that matches you and make a wishlist of your
                    favourite program
                </p>
            </div>
        </div>

        <div class="row d-flex justify-content-center"> <!-- service discription (share/read students story)-->
            <div class="col-sm-11 col-lg-5 my-auto service-explaination">
                <span class="explain-services-step-num">2</span>
                <h2 class="explain-srvices-heading">Share your story</h2>
                <p class="align-middle explain-service-text">
                    Scholarship website let you share you story and experience as a student
                    abroad to help other students who want to earn one
                </p>
            </div>

            <div class="col-sm-11 col-lg-5 d-flex justify-content-center service-img">
                <img src="${contextPath}/resources/static/img/network-share.svg" class="expressive-img shake-vertical"
                     alt="Share your story">
            </div>
        </div>

        <div class="row d-flex justify-content-center"><!-- service discription (apply for scholarship)-->
            <div class="col-sm-11 col-lg-5 d-flex justify-content-center ">
                <img src="${contextPath}/resources/static/img/apply.svg" class="expressive-img shake-vertical" alt="">
            </div>

            <div class="col-sm-11 col-lg-5 my-auto ">
                <span class="explain-services-step-num">3</span>
                <h2 class="explain-srvices-heading"> Apply to scholarship</h2>

                <p class="align-middle explain-service-text ">
                    You have your top programmes shortlisted, you can pick the ones
                    that fit you the best. When you feel confident about your programme
                    choice, you can apply directly via Studyportals.
                </p>
            </div>
        </div>

        <div class="row d-flex justify-content-center"> <!-- service discription (advert a scholarship)-->
            <div class="col-sm-11 col-lg-5 my-auto service-explaination">
                <span class="explain-services-step-num">4</span>
                <h2 class="explain-srvices-heading">Advert a scholarship</h2>
                <p class="align-middle explain-service-text">
                    Not only for students, but also for who provide a scholarship,
                    our website allow you advert a scholarships and show you best candidates
                </p>
            </div>

            <div class="col-sm-11 col-lg-5  d-flex justify-content-center service-img">
                <img src="${contextPath}/resources/static/img/adv-sh.png" class="expressive-img shake-vertical "
                     alt="advert a scholarship image">
            </div>
        </div>
    </div>
</section>

<section class="website-team-section"> <!-- out team -->
    <div class="container">
        <div class="row d-flex justify-content-center">
            <h1>
                Our Team
            </h1>
        </div>

        <div class="row ">
            <div class="col-sm-4 team-member">
                <div>
                    <img src="${contextPath}/resources/static/img/user-icon.png">
                    <h4>Haneen Hatem</h4>
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>

                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-sm-4 team-member">
                <div>
                    <img src="${contextPath}/resources/static/img/user-icon.png">
                    <h4>Rand Hazem</h4>
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>

                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-sm-4  team-member">
                <div>
                    <img src="${contextPath}/resources/static/img/user-icon.png">
                    <h4>Rana Obeid</h4>
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>

                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

</section>

<section class="login-model" data-open="${param.login != null || param.login_fail != null}"> <!-- login model -->
    <!-- Modal -->
    <div class="modal fade" id="loginModel" tabindex="-1" role="dialog" aria-labelledby="loginModelTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Log in</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="POST" action="/login" id="loginForm">
                        <c:if test="${param.login_fail}">
                            <div class="form-group">
                                <label class="text-danger">
                                    <span class="fa fa-exclamation-circle" aria-hidden="true"></span>
                                    wrong email or password !
                                </label>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <input id="email" name="email" type="email" class="form-control" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                            <input id="password" name="password" type="password" class="form-control"
                                   placeholder="Enter password">
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="form-group">
                            <a id="forgetPassAnchor" href="/user/account/forgot-password"><span>Forget</span> password?</a>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeBtn" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" id="logInBtn" class="btn">LogIn</button>
                </div>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div id="footerScrollUpDiv" class="row justify-content-center">
            <button id="footerScrollUpBtn" class="btn">
                <img src="${contextPath}/resources/static/img/rocket-icon.png">
                <span class="d-block">Top</span>
            </button>
        </div>

        <div class="row justify-content-center contact-media">
            <ul class="list-inline text-center">
                <li class="list-inline-item">
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                </li>
                <li class="list-inline-item">
                    <a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a>
                </li>
                <li class="list-inline-item">
                    <a href="#"> <i class="fa fa-instagram" aria-hidden="true"></i></a>
                </li>
                <li class="list-inline-item">
                    <a href="#"> <i class="fa fa-linkedin" aria-hidden="true"></i></a>

                </li>
            </ul>
        </div>

        <div id="footerCopyRightBlock" class="row justify-content-center ">
            <p>
                Created With <i class="fa fa-heart-o" aria-hidden="true"></i> by our team
                <br>
                Copyright &copy; 2019 Website-Name
            </p>
        </div>
    </div>
</footer>

</body>
</html>
