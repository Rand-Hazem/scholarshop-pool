package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.*;
import com.iteam.scholarships.enums.AccountState;
import com.iteam.scholarships.enums.UserType;
import com.iteam.scholarships.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Transactional
@Service
public class UserService {

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserOptionalInfoRepository userOptionalInfoRepository;
    @Autowired
    private WorkHistoryRepository workHistoryRepository;
    @Autowired
    private EducationHistoryRepository educationHistoryRepository;
    @Autowired
    private AdvertiserService advertiserService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private CurrentUser currentUser;

    private void encryptUserPassword(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    }

    public User save(User user) {
        return userRepository.save(user);
    }

    public User find(int id) {
        return userRepository.findById(id).orElse(new User());
    }

    public User getCurrentUserWithId() {
        return new User(currentUser.getId());
    }

    public String findCurrentUserPassword() {
        return userRepository.findPasswordById(currentUser.getId());
    }

    public String getCurrentUserEmail(){
        return userRepository.findEmailById(currentUser.getId());
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean duplicateEmail(String email) {
        User user = userRepository.findByEmail(email);
        return user != null;
    }


    public User findCurrent() {
        return userRepository.findById(currentUser.getId()).orElse(null);
    }

    public User registerUser(User user) {
        encryptUserPassword(user);
        if (user.getType().equals(UserType.STUDENT)) {
            user.setAdvertiser(null);
            user.getStudent().setUser(user);
        } else if (user.getType().equals(UserType.ADVERTISER)) {
            user.setStudent(null);
            user.getAdvertiser().setUser(user);
        } else {
            // admin registration
        }

        userRepository.save(user);
        // send verivcation email
        accountService.sendEmailVerification(user);
        return user;
    }

    public boolean updateAccountState(int id, AccountState state) {
        return userRepository.updateAccountState(id, state) > 0;
    }

    public boolean checkCurrentUserOldPass(String oldPass) {
        String pass = findCurrentUserPassword();
        return bCryptPasswordEncoder.matches(oldPass, pass);
    }

    public boolean updatePassword(int id, String password) {
        password = bCryptPasswordEncoder.encode(password);
        return userRepository.resetPassword(id, password) > 0;
    }

    public boolean updatePassword(String newPass) {
        return updatePassword(currentUser.getId(), newPass);
    }



    /* ------------------- Profile Update  ---------------------------- */

    private boolean updateOptionalInfo(HashMap<String, String> data) {
        try {
            User user = getCurrentUserWithId();
            List<UserOptionalInfo> list = new ArrayList();
            for (String key : data.keySet()) {
                UserOptionalInfo userOptionalInfo = new UserOptionalInfo(user, key, data.get(key));
                if (userOptionalInfo.getKey() != null) {
                    list.add(userOptionalInfo);
                }
            }
            for (int i = 0; i < list.size(); i++) {
                UserOptionalInfo fetchedInfo = userOptionalInfoRepository.findByKeyAndUser(list.get(i).getKey(), list.get(i).getUser());
                if (list.get(i).deleteData() && fetchedInfo != null) {
                    userOptionalInfoRepository.delete(fetchedInfo);
                } else if (fetchedInfo != null) {
                    fetchedInfo.setData(list.get(i).getData());
                    userOptionalInfoRepository.save(fetchedInfo);
                } else {
                    userOptionalInfoRepository.save(list.get(i));
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean updateSocialLinks(HashMap<String, String> links) {
        return updateOptionalInfo(links);
    }

    public boolean updateAbouteUserInfo(HashMap<String, String> data) {
        return updateOptionalInfo(data);
    }

    public boolean saveWorkhistory(WorkHistory workHistory) {
        workHistory.setUser(getCurrentUserWithId());
        WorkHistory saved = workHistoryRepository.save(workHistory);
        return saved != null && saved.getId() > 0;
    }

    public boolean deleteWorkhistory(int historyId){
      return   workHistoryRepository.deleteByIdAndUser(historyId, currentUser.getId()) >0;
    }

    public boolean saveEducationhistory(EducationHistory educationHistory) {
        educationHistory.setUser(getCurrentUserWithId());
        EducationHistory saved = educationHistoryRepository.save(educationHistory);
        return saved != null && saved.getId() > 0;
    }


    public boolean deleteEducationhistory(int historyId){
        return   educationHistoryRepository.deleteByIdAndUser(historyId, currentUser.getId()) >0;
    }

    public boolean updateUserPersonalInfo(User user) {
        try {
            User currentUser = findCurrent();
            currentUser.copyFrom(user);
            boolean newEmail = user.getEmail() != null;
            if (currentUser.isDataChanged()) {
                if (newEmail) {
                    currentUser.setState(AccountState.PENDING_APPROVAL);
                }
                userRepository.save(currentUser);
            }
            if (newEmail) {
                accountService.sendEmailVerification(currentUser);
            }
            return true;
        } catch (Exception e) {
        }
        return false;
    }


    public boolean updateOptionUserPersonalInfo(HashMap<String, String> data) {
        HashMap<String, String> optionalData = new HashMap<>();
        if (data.containsKey("nationality")) {
            optionalData.put("nationality", data.get("nationality"));
        }
        if (data.containsKey("livingCity")) {
            optionalData.put("livingCity", data.get("livingCity"));
        }
        if (data.containsKey("mobileNumber") && !data.getOrDefault("mobileNumber", "").isBlank()) {
            optionalData.put("mobileNumber", data.get("countryCode") + " " + data.get("mobileNumber"));
        }
        return updateOptionalInfo(optionalData);
    }


    public String findProfileImg(int userId){
        return userRepository.findImgUrlById(userId);
    }

    public String findCurrentUerProfileImg(){
        return findProfileImg(currentUser.getId());
    }

    public boolean updateProfileImg(String imgUrl){
        return userRepository.updateImgUrl(currentUser.getId(), imgUrl) >0;
    }

}
