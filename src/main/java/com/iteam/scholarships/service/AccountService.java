package com.iteam.scholarships.service;

import com.iteam.scholarships.entity.ResetPasswordToken;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.VerificationToken;
import com.iteam.scholarships.enums.AccountState;
import com.iteam.scholarships.repository.ResetPasswordRepository;
import com.iteam.scholarships.repository.VerificationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;

@Transactional
@Service
public class AccountService {

    @Autowired
    private UserService userService;
    @Autowired
    private ResetPasswordRepository resetPasswordRepository;
    @Autowired
    private VerificationTokenRepository verificationTokenRepository;
    @Autowired
    private EmailService emailService;


    public void sendEmailVerification(User user) {
        VerificationToken fetched = verificationTokenRepository.findByUser(user);
        VerificationToken verificationToken = new VerificationToken(user);

        // if user email not verified and he update email
        if (fetched != null) {
            fetched.setToken(verificationToken.getToken());
            fetched.setCreatedDate(verificationToken.getCreatedDate());
            verificationTokenRepository.save(fetched);
        } else {
            verificationTokenRepository.save(verificationToken);
        }

        emailService.sendRegisterdVerivicationEmail(user.getEmail(), verificationToken.getToken());
    }


    public boolean verifyEmail(String token) {
        VerificationToken verificationToken = verificationTokenRepository.findByToken(token);
        if (verificationToken == null) {
            return false;
        }
        User user = verificationToken.getUser();
        boolean stateUpdated = userService.updateAccountState(user.getId(), AccountState.ACTIVE);
        verificationTokenRepository.delete(verificationToken);
        return stateUpdated;
    }


    public boolean requestResetPassword(String email) {
        User user = userService.findByEmail(email);
        if (user == null) {
            return false;
        }
        ResetPasswordToken resetPasswordToken = new ResetPasswordToken(user);
        resetPasswordRepository.save(resetPasswordToken);
        emailService.sendResetPasswordEmail(user.getEmail(), resetPasswordToken.getToken());
        return true;
    }

    /**
     * @param token contain only token string, and other data is empty,
     *              value of this onject will be affected
     * @return boolean if token found in db or not
     */
    public boolean validResetPasswordToken(String token) {
        ResetPasswordToken fetchedToken = resetPasswordRepository.findByToken(token);
        if (fetchedToken == null || fetchedToken.isExpired()) {
            return false;
        }
        return true;
    }

    public boolean resetPassword(String token, String password) {
        ResetPasswordToken resetPasswordToken = resetPasswordRepository.findByToken(token);
        if (resetPasswordToken == null) {
            return false;
        }
        userService.updatePassword(resetPasswordToken.getUser().getId(), password);
        resetPasswordRepository.deleteById(resetPasswordToken.getId());
        return true;
    }

}
