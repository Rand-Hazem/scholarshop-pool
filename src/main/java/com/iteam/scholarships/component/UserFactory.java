package com.iteam.scholarships.component;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.enums.UserType;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class UserFactory {
    public void FillMissingDataForUserRegistration(User user, Map<String, String > data){
        boolean studentReqister = data.getOrDefault("registerAsStudent", "").equals("true");
        boolean advertiserReqister = data.getOrDefault("registerAsAdvertiser", "").equals("true");

        if (studentReqister) {
            user.setType(UserType.STUDENT);
            user.setAdvertiser(null);
        } else if (advertiserReqister) {
            user.setType(UserType.ADVERTISER);
            user.getAdvertiser().setMobileNum(data.getOrDefault("advertiserMobileCode","")+" "+data.getOrDefault("advertiser.mobileNum",""));
            if (user.getAdvertiser().getOrganization().getName().equals("other")) {
                user.getAdvertiser().getOrganization().setName(data.getOrDefault("otherOrganization", ""));
            }
        }
    }

}
