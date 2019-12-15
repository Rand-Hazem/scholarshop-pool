<nav class="navbar navbar-expand-lg sticky-top custom-navbar">
    <div class="container-fluid">

        <a href="#" class="navbar-brand">
            <img class='logo' src="${contextPath}/resources/static/img/scholarship-graduaed-icon.svg" alt="LOGO">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#advertiserNav">
            <i class="fa fa-bars" aria-hidden="true" style="color: #ededed;"></i>
        </button>

        <div class="collapse navbar-collapse" id="advertiserNav">
            <ul class="nav navbar-nav">
                <li>
                    <div id='searchBox' class='d-inline-block'>
                        <i id='searchIcon' class="fa fa-search"></i>
                        <input id='searchField' type="text" name="username" placeholder="Type to search"/>
                    </div>
                </li>
                <li class="nav-item navbar-left">
                    <a href="${contextPath}/search-scholarship" class="nav-link">Explore</a>
                </li>
                <li class="nav-item">
                    <a href="${contextPath}/advertiser/scholarship/share" class="nav-link">New advert</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Applied scholarships</a>
                </li>
                <li class="nav-item">
                    <a href="${contextPath}/stories" class="nav-link">Stories</a>
                </li>
                <li class="nav-item">
                    <a href="${contextPath}/profile" class="nav-link">Profile</a>
                </li>
                <li class="nav-item">
                    <a href="#" class='nav-link notification'>
                        <p class='d-lg-none d-inline-block mb-0'>Notification &nbsp;</p>
                        <i class="fa fa-bell"></i>
                        <span class="badge badge-light">4</span>
                    </a>
                </li>
            </ul>

            <ul id="moreItemList" class="nav navbar-nav ml-auto cursor-pointer">
                <li class="list-item">
                    <a id="anchorDropDownBtn" class="dropdown-toggle d-lg-inline-block" data-toggle="dropdown"
                       data-target="dropdownMoreItem">
                        <span class="caret"></span>
                    </a>
                    <ul id='dropdownMoreItem' class="dropdown-menu dropdown-menu-right animate slide-in">
                        <li><a href="${contextPath}/edit-profile" class="dropdown-item">Edit profile</a></li>
                        <li><a href="${contextPath}/advertiser/scholarship" class="dropdown-item">Adverted scholarship</a></li>
                        <li><a href="${contextPath}/logout"  class="dropdown-item">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
