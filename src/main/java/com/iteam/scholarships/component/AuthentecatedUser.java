package com.iteam.scholarships.component;

import com.iteam.scholarships.enums.UserType;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class AuthentecatedUser extends User {

    private int id;
    private int studentId = -1;
    private int advertiserId = -1;
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

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getAdvertiserId() {
        return advertiserId;
    }

    public void setAdvertiserId(int advertiserId) {
        this.advertiserId = advertiserId;
    }

    public UserType getUserType() {
        return userType;
    }

}
