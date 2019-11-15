package com.iteam.scholarships.component;

import com.iteam.scholarships.enums.UserType;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;


/**
 * CurrentUser class > Name provided by Amool <3
 */
@Component
public class CurrentUser {

    public Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    private AuthentecatedUser getAuthetecatedUser() {
        return (AuthentecatedUser) getAuthentication().getPrincipal();
    }

    public boolean isLogIn() {
        return !(getAuthentication() instanceof AnonymousAuthenticationToken);
    }

/*
    public void addUserTypeAtrrToModel(Model model){
        Authentication authentication = getAuthentication();
        if(authentication!=null && !authentication.getAuthorities().isEmpty()){
            model.addAttribute("userType", authentication.getAuthorities().toArray()[0]);
        }
    }
   */

    public String getEmail() {
        if (isLogIn()) {
            return getAuthentication().getName();
        }
        return "";
    }

    public int getId() {
        if (isLogIn()) {
            return getAuthetecatedUser().getId();
        }
        return -1;
    }

    public UserType getType() {
        if (isLogIn()) {
            return getAuthetecatedUser().getUserType();
        }
        return null;
    }

    public boolean isStudent() {
        return UserType.STUDENT.equals(getType());
    }

    public boolean isAdvertiser() {
        return UserType.ADVERTISER.equals(getType());
    }

    public boolean isAdmin() {
        return UserType.ADMIN.equals(getType());
    }

    public boolean matchId(int id){
        return isLogIn() && (id==getId());
    }

}
