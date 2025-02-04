package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.component.UserFactory;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.UserOptionalInfo;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.entity.storydb.Story;
import com.iteam.scholarships.enums.UserOptionalInfoKey;
import com.iteam.scholarships.enums.UserType;
import com.iteam.scholarships.service.*;
import com.iteam.scholarships.validate.UserValidatePart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class UserController {
    @Autowired
    private SmartValidator validator;
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private UserFactory userFactory;
    @Autowired
    private UserValidatePart userValidatePart;
    @Autowired
    private CurrentUser currentUser;
    @Autowired
    private ScholarshipService scholarshipService;
    @Autowired
    private StoryService storyService;
    @Autowired
    private OrganizationService organizationService;


    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

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
        return "redirect:/login";
    }

    @GetMapping({"/", "main"})
    public String main(Model model) {
        if (currentUser.isLogIn()) {
            return "redirect:/profile";
        }
        return "main";
    }


    @GetMapping("login")
    public String login() {
        return "redirect:/main?login=true";
    }

    @GetMapping({"profile", "user/{id}/profile", "user/{id}/profile/{name}"})
    public String profile(@PathVariable(required = false) Integer id, Model model) {
        // if request was /profile
        if (id == null || id <1) {
            if (currentUser.isLogIn()) {
                id = currentUser.getId();
            } else {
                return "error";
            }
        }

        User user = userService.find(id);
        if(user == null){
            return "error";
        }

        List<UserOptionalInfo> userOptionalInfoList =  user.getUserOptionalInfoList();
        HashMap<UserOptionalInfoKey, String> keyDataMap = new HashMap();
        for(UserOptionalInfo u: userOptionalInfoList){
            keyDataMap.put(u.getKey(), u.getData());
        }

        model.addAttribute("user", user);
        model.addAttribute("keyDataMap", keyDataMap);
        model.addAttribute("owner", currentUser.matchId(id));

        if(user.getType().equals(UserType.ADVERTISER)){
            List<Scholarship> scholarships = scholarshipService.getAllScholarshipsById(id);
            model.addAttribute("scholarships",scholarships);
        }else if(user.getType().equals(UserType.STUDENT)){
            List<Story> stories = storyService.findAllByUserId(id);
            model.addAttribute("stories", stories);
        }

        return "profile";
    }

    @GetMapping("edit-profile")
    public String editProfile(Model model) {
        User user = userService.findCurrent();
        if (user.getType().equals(UserType.ADVERTISER)) {
            model.addAttribute("advertiser", user.getAdvertiser());
        }else{
            model.addAttribute("interest", studentService.getStudentInterest());
        }
        user.getWorkHistoryList();
        user.getEducationHistoryList();

        model.addAttribute("user", user);
        model.addAttribute("optional", UserOptionalInfo.listToHashKeyName(user.getUserOptionalInfoList()));
        return "edit-profile";
    }

}
