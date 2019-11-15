package com.iteam.scholarships.component;

import com.iteam.scholarships.enums.UserType;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class AuthentecatedUser extends User {

    private int id;
    private UserType userType;

    public AuthentecatedUser(String username, String password, Collection<? extends GrantedAuthority> authorities, int id, UserType userType) {
        super(username, password, authorities);
        this.id=id;
        this.userType=userType;
    }

    public AuthentecatedUser(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities, int id, UserType userType) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.id=id;
        this.userType=userType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserType getUserType() {
        return userType;
    }

}
