package com.iteam.scholarships.restController;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.component.UplodeFille;
import com.iteam.scholarships.entity.EducationHistory;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.WorkHistory;
import com.iteam.scholarships.service.UserService;
import com.iteam.scholarships.validate.UserValidatePart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

@RestController
@RequestMapping("/user/")
public class UserRestController {

    @Autowired
    private UserValidatePart userValidatePart;
    @Autowired
    private UserService userService;
    @Autowired
    private CurrentUser currentUser;
    @Autowired
    private UplodeFille uplodeFille;

    /**
     * this will update/insert/delete link in links-tab > edit profile page
     */
    @PutMapping("update-social-link")
    public ResponseEntity updateLinks(@RequestParam HashMap<String, String> data) {
        if (!userValidatePart.socialLinkValidate(data) || !userService.updateSocialLinks(data)) {
            return ResponseEntity.badRequest().body("{'error':'invalid data'}");
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /**
     * this will update password in password-tab > edit profile page
     */
    @PutMapping("update-password")
    public ResponseEntity updatePassword(@RequestParam HashMap<String, String> data) {
        User user = new User();
        user.setPassword(data.getOrDefault("password", ""));
        user.setConfirmPass(data.getOrDefault("confirmPass", ""));

        // check if data is valid
        if (!userValidatePart.updatePasswordValidate(user) ||
                // check of old-password is correctfor the current user
                !userService.checkCurrentUserOldPass(data.getOrDefault("oldPass", "")) ||
                // do update-password, if dosn't updated it will return false
                !userService.updatePassword(data.get("password"))) {
            return ResponseEntity.badRequest().body("Invalid data");
        }
        return new ResponseEntity(HttpStatus.OK);
    }


    /**
     * this will update/insert/delete Work-history in about-tab > edit profile page
     */
    @PutMapping("add-workhistory")
    public ResponseEntity addWorkHistory(@Valid WorkHistory workHistory, BindingResult bindingResult) {
        // if there is error in data OR faild to save on db
        if (bindingResult.hasErrors() || !userService.saveWorkhistory(workHistory)) {
            return ResponseEntity.badRequest().body("invalid data");
        }
        return ResponseEntity.ok("{\"id\":\"" + workHistory.getId() + "\"}");
    }


    /**
     * this will /delete work-history in about-tab > edit profile page
     */
    @PutMapping("delete-workhistory")
    public ResponseEntity deleteWorkHistory(@RequestParam("id") int id) {
        if (!userService.deleteWorkhistory(id)) {
            return ResponseEntity.badRequest().body("invalid data");
        }
        return ResponseEntity.ok().build();
    }

    /**
     * this will insert Education-history in about-tab > edit profile page
     */
    @PutMapping("add-education")
    public ResponseEntity addEducation(@Valid EducationHistory educationHistory, BindingResult bindingResult) {
        // if there is error in data OR faild to save on db
        if (bindingResult.hasErrors() || !userService.saveEducationhistory(educationHistory)) {
            return ResponseEntity.badRequest().body("invalid data");
        }
        return ResponseEntity.ok("{\"id\":\"" + educationHistory.getId() + "\"}");
    }


    /**
     * this will /delete Education-history in about-tab > edit profile page
     */
    @PutMapping("delete-education")
    public ResponseEntity deleteEducation(@RequestParam("id") int id) {
        if (!userService.deleteEducationhistory(id)) {
            return ResponseEntity.badRequest().body("invalid data");
        }
        return ResponseEntity.ok().build();
    }


    /**
     * this will update about-tab in edit profile page
     */
    @PutMapping("update-about")
    public ResponseEntity updateAbout(@RequestParam HashMap<String, String> data) {
        // if there is error in data OR faild to save on db
        if (!userValidatePart.updateAboutUserInfoValidate(data) || !userService.updateAbouteUserInfo(data)) {
            return ResponseEntity.badRequest().body("invalid data");
        }
        return ResponseEntity.ok().build();
    }

    /**
     * this will update/insert/delete Education-history in personal-tab > edit profile page
     * infor included : user image, firstname, lastname, gender, birthday, nationality, living-place, email and mobile number
     */
    @PutMapping("update-personal")
    public ResponseEntity updatePersonal(User user, @RequestParam HashMap<String, String> data) {
        ArrayList<String> errorFields = new ArrayList<>();
        System.out.println(user);
        userValidatePart.updateOptionalPersonalInfoValidate(data, errorFields);
        userService.updateOptionUserPersonalInfo(data);

        userValidatePart.updatePersonalInfoValidate(user, errorFields);
        if (user.getEmail() != null && user.getEmail().equals(userService.getCurrentUserEmail())) {
            user.setEmail(null);
        } else if (user.getEmail() != null && userService.duplicateEmail(user.getEmail())) {
            user.setEmail(null);
            errorFields.add("\nemail 'already used'");
        }

        userService.updateUserPersonalInfo(user);

        if (errorFields.size() != 0) {
            String bodyResponse = "operation succeeded, falid to update " + Arrays.toString(errorFields.toArray()) + " you may need to check constraint";
            return ResponseEntity.ok(bodyResponse);
        }
        return ResponseEntity.ok("updated successfully");
    }

    /**
     * this will update or delete user profile image
     */
    @PutMapping("update-profileimg")
    public ResponseEntity updateUserProfileImg(@RequestParam(value = "profileImg",required = false) MultipartFile profileImg) {
        String oldImg = userService.findCurrentUerProfileImg();
        boolean success = true;
        String newImgUrl;

        if (profileImg == null || profileImg.isEmpty()) {
            success = success && uplodeFille.deleteUserProfileImg(oldImg);
            success = success && userService.updateProfileImg(null);
        }else {
            newImgUrl = uplodeFille.upladeUserprofileImage(profileImg, oldImg);
            success = success && (newImgUrl!=null) && userService.updateProfileImg(newImgUrl);
        }

        return success ? ResponseEntity.ok("updated successfully")  : ResponseEntity.badRequest().body("error occured");
    }

}
