package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.component.UserFactory;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.UserOptionalInfo;
import com.iteam.scholarships.enums.UserType;
import com.iteam.scholarships.service.OrganizationService;
import com.iteam.scholarships.service.UserService;
import com.iteam.scholarships.validate.UserValidatePart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
public class UserController {
    @Autowired
    private SmartValidator validator;
    @Autowired
    private UserService userService;
    @Autowired
    private UserFactory userFactory;
    @Autowired
    private UserValidatePart userValidatePart;
    @Autowired
    private CurrentUser currentUser;
    @Autowired
    private OrganizationService organizationService;


    @PostMapping("register")
    public String register(@ModelAttribute("user") User user, BindingResult bindingResult, @RequestParam Map<String, String> data, Model model) {
        boolean studentReqister = data.getOrDefault("registerAsStudent", "").equals("true");
        boolean advertiserRegister = data.getOrDefault("registerAsAdvertiser", "").equals("true");

        // wrong registration not user nor advertiser
        if (!studentReqister && !advertiserRegister) {
            return "register";
        }
        // fill other data that isn't mapped
        userFactory.FillMissingDataForUserRegistration(user, data);
        validator.validate(user, bindingResult);

        // ignore advertiser and organization error if its student-register
        if ((advertiserRegister && !userValidatePart.registerValidate(user, bindingResult))
                || bindingResult.hasErrors()) {
            return "register";
        }

        // assert email not exists
        if (userService.duplicateEmail(user.getEmail())) {
            model.addAttribute("duplicate_email", "This email already registered");
            return "register";
        }
        // register user
        userService.registerUser(user);
        return "profile";
    }


    @GetMapping({"/", "main"})
    public String main(Model model) {
        if (currentUser.isLogIn()) {
            return "forward:/profile";
        }
        return "main";
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @GetMapping("login")
    public String login() {
        return "main?login=true";
    }

    @GetMapping("profile")
    public String profile(Model model) {
        return "profile";
    }

    @GetMapping("edit-profile")
    public String editProfile(Model model) {
        User user = userService.findCurrent();
        if (user.getType().equals(UserType.ADVERTISER)) {
            model.addAttribute("advertiser", user.getAdvertiser());
            model.addAttribute("orgList", organizationService.getAllAcceptedOrgList());
        }
        user.getWorkHistoryList();
        user.getEducationHistoryList();

        model.addAttribute("user", user);
        model.addAttribute("optional", UserOptionalInfo.listToHashKeyName(user.getUserOptionalInfoList()));
        return "edit-profile";
    }

}
