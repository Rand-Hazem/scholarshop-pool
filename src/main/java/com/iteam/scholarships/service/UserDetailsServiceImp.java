package com.iteam.scholarships.service;

import com.iteam.scholarships.component.AuthentecatedUser;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.enums.UserType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;


@Service
public class UserDetailsServiceImp implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userService.findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException(email);
        }

        SimpleGrantedAuthority authority;
        ArrayList<GrantedAuthority> authorities = new ArrayList<>();

        int advertiserId = -1,studentId = -1;
        if (user.getType() == UserType.ADMIN) {
            authority = new SimpleGrantedAuthority("admin");
        } else if (user.getType() == UserType.ADVERTISER) {
            authority = new SimpleGrantedAuthority("advertiser");
            advertiserId = user.getAdvertiser().getId();
        } else {
            authority = new SimpleGrantedAuthority("student");
            studentId = user.getStudent().getId();
        }
        authorities.add(authority);
        AuthentecatedUser authentecatedUser = new AuthentecatedUser(user.getEmail(), user.getPassword(), authorities, user.getId(), user.getType());
        authentecatedUser.setStudentId(studentId);
        authentecatedUser.setAdvertiserId(advertiserId);

        return authentecatedUser;
    }
}
