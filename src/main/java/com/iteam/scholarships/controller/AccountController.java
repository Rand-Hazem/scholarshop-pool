package com.iteam.scholarships.controller;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.service.AccountService;
import com.iteam.scholarships.validate.UserValidatePart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;

@Controller
@RequestMapping("/user/account/")
public class AccountController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private UserValidatePart userValidatePart;



    @GetMapping("accept")
    public String accepted(@RequestParam("token") String token, Model model) {
        // invalid token
        if (token == null || token.trim().isEmpty()) {
            model.addAttribute("message", "invalid link");
            return "error";
        }
        // can't verify account due to wrong token
        if (!accountService.verifyEmail(token)) {
            model.addAttribute("message", "failed to verify email");
            return "error";
        }
        return "profile";
    }

    /**
     * @return forget password page that request from user to enter email
     */
    @GetMapping("forgot-password")
    public String forgetPassword() {
        return "forgot-password";
    }

    @PostMapping("forgot-password")
    public String fotgotPassword(@RequestParam("email") String email, Model model) {
        if (accountService.requestResetPassword(email)) {
            model.addAttribute("emailSent", true);
        } else {
            model.addAttribute("failed", true);
        }

        return "forgot-password";
    }


    @GetMapping("reset-password")
    public String resetPassword(@RequestParam("token") String token, Model model) {
        // invalid token
        if (token == null || token.trim().isEmpty() || !accountService.validResetPasswordToken(token)) {
            model.addAttribute("message", "invalid link");
            return "error";
        }
        model.addAttribute("token", token);
        return "reset-password";
    }


    @PostMapping("reset-password")
    public String resetPassword(@RequestParam String token ,@RequestParam String password, @RequestParam String confirmPass, Model model) {
        User user = new User();
        user.setPassword(password);
        user.setConfirmPass(confirmPass);
        // invalid data
        if(!userValidatePart.updatePasswordValidate(user, model)){
            return "reset-password";
        }
        // db access to reset pass
        if (accountService.resetPassword(token, password)) {
            model.addAttribute("success", true);
        } else {
            model.addAttribute("failed", true);
        }

        return "reset-password";
    }


}
