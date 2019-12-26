package com.iteam.scholarships.validate;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.enums.UserType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.SmartValidator;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

@Component
public class UserValidatePart {

    @Autowired
    private SmartValidator smartValidator;
    @Autowired
    private Validator validator;

    public void copyErrorToModel(Set<ConstraintViolation> validateSet, Model model) {
        for (ConstraintViolation a : validateSet) {
            model.addAttribute("error_" + a.getPropertyPath().toString(), a.getMessage());
        }
    }

    public boolean registerValidate(User user, BindingResult bindingResult) {
        smartValidator.validate(user, bindingResult);
        // ignore advertiser and organization error if its student-register
        int ignoredErroCount = 0;
        if (user.getType().equals(UserType.STUDENT)) {
            for (FieldError err : bindingResult.getFieldErrors()) {
                if (err.getField().startsWith("advertiser")) ignoredErroCount++;
            }
        }
        if (bindingResult.getErrorCount() - ignoredErroCount > 0) {
            return false;
        }
        return true;
    }

    public boolean updatePasswordValidate(User user, Model model) {
        Set<ConstraintViolation<User>> validateSet = validator.validateProperty(user, "password");
        validateSet.addAll(validator.validateProperty(user, "confirmPass"));

        if (!validateSet.isEmpty()) {
            for (ConstraintViolation<User> a : validateSet) {
                model.addAttribute("error_" + a.getPropertyPath().toString(), a.getMessage());
            }
            return false;
        }
        if (!user.getPassword().equals(user.getConfirmPass())) {
            model.addAttribute("error_confirmPass", "password and confirm dosn't match");
            return false;
        }
        return true;
    }


    public boolean updatePasswordValidate(User user) {
        Set<ConstraintViolation<User>> validateSet = validator.validateProperty(user, "password");
        validateSet.addAll(validator.validateProperty(user, "confirmPass"));

        if (!validateSet.isEmpty() || !user.getPassword().equals(user.getConfirmPass())) {
            return false;
        }
        return true;
    }

    public boolean socialLinkValidate(HashMap<String, String> links) {
        boolean valid = true;
        String facebookReg = "(?:(?:http|https):\\/\\/)?(?:www.)?facebook.com\\/(?:(?:\\w)*#!\\/)?(?:pages\\/)?(?:[?\\w\\-]*\\/)?(?:profile.php\\?id=(?=\\d.*))?([\\w\\-]*)?";
        String twitterReg = "http(?:s)?:\\/\\/(?:www\\.)?twitter\\.com\\/([a-zA-Z0-9_]+)";
        String linkedinReg = "((https?:\\/\\/)?((www|\\w\\w)\\.)?linkedin\\.com\\/)((([\\w]{2,3})?)|([^\\/]+\\/" +
                "(([\\w|\\d-&#?=])+\\/?){1,}))$";
        String linkReg = "^(http(s)?:\\/\\/)?(www\\.)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$";

        for (String key : links.keySet()) {
            switch (key) {
                case "facebook":
                    valid = valid && links.get(key).isBlank() || links.get(key).matches(facebookReg);
                    break;
                case "twitter":
                    valid = valid && links.get(key).isBlank() || links.get(key).matches(twitterReg);
                    break;
                case "linkedin":
                    valid = valid && links.get(key).isBlank() || links.get(key).matches(linkedinReg);
                    break;
                case "ownwebsite":
                    valid = valid && links.get(key).isBlank() || links.get(key).matches(linkReg);
                    break;
                default:
                    valid = false;
            }
            if (!valid) {
                return false;
            }
        }
        return true;
    }

    public boolean updateAboutUserInfoValidate(HashMap<String, String> data) {
        String bio = data.get("bio");
        return bio == null || bio.isBlank() || bio.length() > 6;
    }

    private boolean validateProperityRemoveFromHashAndSetNullIfNotValid(String prpName, User user) {
        Set<ConstraintViolation<User>> validateSet = validator.validateProperty(user, prpName);
        if (!validateSet.isEmpty()) {
            return false;
        }
        return true;
    }

    /**
     * validate mandatory user information in personal-tab>update-profile page
     */
    public boolean updatePersonalInfoValidate(User user, ArrayList<String> errorFields) {
        if(!validateProperityRemoveFromHashAndSetNullIfNotValid("firstName", user)){
           user.setFirstName(null);
           errorFields.add("first name");
        }
        if(!validateProperityRemoveFromHashAndSetNullIfNotValid("lastName", user)){
           user.setLastName(null);
           errorFields.add("last name");
        }
        if(!validateProperityRemoveFromHashAndSetNullIfNotValid("birthday", user)){
           user.setBirthday((Date) null);
           errorFields.add("birthday");
        }
        if(!validateProperityRemoveFromHashAndSetNullIfNotValid("email", user)){
           user.setEmail(null);
           errorFields.add("email");
        }
        if(!validateProperityRemoveFromHashAndSetNullIfNotValid("gender", user)){
           user.setGender(null);
           errorFields.add("gender");
        }
        return errorFields.size() == 0;
    }
    /**
     * validate mandatory user information in personal-tab>update-profile page
     */
    public boolean updateOptionalPersonalInfoValidate(HashMap<String, String >data, ArrayList<String> errorFields) {
        int length = errorFields.size();
        if(!data.getOrDefault("nationality", "").isBlank() && data.getOrDefault("nationality", "").trim().length()!=2){
            errorFields.add("nationality");
            data.remove("nationality");
        }
        if(!data.getOrDefault("livingCity", "").isBlank() && data.getOrDefault("livingCity", "").trim().length()<3){
            errorFields.add("livingCity");
            data.remove("livingCity");
        }
        if(!data.getOrDefault("mobileNumber", "").isBlank() && !data.getOrDefault("countryCode", "").isBlank() &&
                !new MobileNumberValidator().isValid(data.get("countryCode")+" "+data.getOrDefault("mobileNumber", ""), null)){
            errorFields.add("mobileNumber");
            errorFields.add("countryCode");
            data.remove("mobileNumber");
            data.remove("countryCode");
        }
        return errorFields.size()-length == 0;
    }



}
