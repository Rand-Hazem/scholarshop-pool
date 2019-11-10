<div data-aos='fade-up' class='story-node mt-5'>
    <!-- Story Box Header: Title & Date-->
    <div class='story-box-header'>
        <div class='dropdown'>
            <button type='button' class='btn btn-toggle-menu float-right' data-toggle='dropdown'>
                <i class='fa fa-ellipsis-h' aria-hidden='true'></i>
            </button>
            <div class='dropdown-menu'>
                <!-- Edit and delete only for user how own the post -->

                <!--                                        <a class='dropdown-item' href='#' data-option-name='editStory'>
                                                            <i class='fa fa-pencil' aria-hidden='true'></i>
                                                            Edit
                                                        </a>
                                                        <a class='dropdown-item' href='#' data-option-name='deleteStory'>
                                                            <i class='fa fa-trash-o' aria-hidden='true'></i>
                                                            Delete
                                                        </a>-->
                <a class='dropdown-item' href='#' data-option-name='saveStory'>
                    <i class='fa fa-bookmark-o' aria-hidden='true'></i>
                    Save
                </a>
                <a class='dropdown-item' href='#' data-toggle='modal' data-target='#reportModal'
                   data-option-name='reportStory'>
                    <i class='fa fa-flag-o' aria-hidden='true'></i>
                    Report
                </a>
            </div>
        </div>
        <div class='story-box-title-and-date'>
            <h5 class='story-title'>
                <i class='fa fa-pencil-square-o' aria-hidden='true'></i>
                Story Title
            </h5>
            <p class='text-muted story-date'>Sep 12, 2018 - Jan 17, 2019</p>
            By :
            <span class="user-card">
                                        <a class="user-name" href="">username</a>
                                        <span class="user-details">
                                            <img src="${contextPath}/resources/static/img/user-icon.png" alt="user img"/>
                                            <span>Field of study of position of work, current one</span><br>
                                            <span>At university name or company name</span>
                                        </span>
                                    </span>
        </div>
    </div>
    <!-- Story Content-->
    <div class='story-content'>
        <p class='story-text'>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            Phasellus imperdiet, nulla et dictum interdum,
            nisi lorem egestas vitae scelerisque enim ligula venenatis dolor.
            Maecenas nisl est, ultrices nec congue eget, auctor vitae massa.
            Fusce luctus vestibulum augue ut aliquet.
            zNunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac.
            In at libero sed nunc venenatis imperdiet sed ornare turpis.
            Donec vitae dui eget tellus gravida venenatis.
            Integer fringilla congue eros non fermentum.
            Sed dapibus pulvinar nibh tempor porta.
        </p>
        <hr style='margin-top: 15px; margin-bottom: 15px;'>

        <!-- Story Box Footer -->
        <div class='story-box-footer'>
            <button class='btn like'>
                <i class='fa fa-thumbs-o-up fa-lg' aria-hidden='true'></i>&nbsp;
                <span class='likes-count'>20</span>
            </button>
            <a type='button' href="${contextPath}/view-story" class='btn view-btn'>View</a>
            <p class='mt-2 publish-date'>Published On
                <span>Aug 12, 2019</span>
            </p>
        </div>
    </div>
</div>