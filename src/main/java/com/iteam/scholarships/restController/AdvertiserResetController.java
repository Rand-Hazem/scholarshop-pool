package com.iteam.scholarships.restController;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.service.AdvertiserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

@RestController
@RequestMapping("/advertiser/")
public class AdvertiserResetController {


    @Autowired
    private AdvertiserService advertiserService;

    /**
     * update advertiser account in accout-tab > editProfile
     */
    @PutMapping("update-account")
    @PreAuthorize("hasAuthority('advertiser')")
    public ResponseEntity updateAccount(Advertiser advertiser, @RequestParam HashMap<String, String> data) {
        advertiser.setMobileNum(data.getOrDefault("countryCode", "") + " " + data.getOrDefault("mobileNumber", ""));
        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        Set<ConstraintViolation<Advertiser>> errors = validatorFactory.getValidator().validate(advertiser);

        if (!errors.isEmpty()) {
           String errorResponseBody = "";
           for(ConstraintViolation e : errors){
               errorResponseBody += e.getPropertyPath()+", ";
           }
            return ResponseEntity.badRequest().body("failed to update, invalid data" + errorResponseBody);
        }

        if (advertiserService.updateAccount(advertiser)) {
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().body("failed to update, internal server error");
    }

}
