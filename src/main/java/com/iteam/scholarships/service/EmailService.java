package com.iteam.scholarships.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Transactional
@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    private void sendEmail(SimpleMailMessage simpleMailMessage) {
        javaMailSender.send(simpleMailMessage);
    }


    private SimpleMailMessage getSimpleMailMessage(String sentTo) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom("graduation.project.ptuk@gmail.com");
        simpleMailMessage.setTo(sentTo);
        return simpleMailMessage;
    }

    public void sendRegisterdVerivicationEmail(String sentTo, String token) {
        SimpleMailMessage simpleMailMessage = getSimpleMailMessage(sentTo);
        simpleMailMessage.setSubject("verify you account on scholarship");
        simpleMailMessage.setText("Thanks for signing up with scholarship! You must follow this link to activate your account: " +
                "http://localhost:8080/user/account/accept?token=" + token);

        sendEmail(simpleMailMessage);
    }

    public void sendResetPasswordEmail(String sentTo, String token) {
        SimpleMailMessage simpleMailMessage = getSimpleMailMessage(sentTo);
        simpleMailMessage.setSubject("Reset your password on scholarship");
        simpleMailMessage.setText("your reqest to reset password, please click on link below, it will direct you to page where you" +
                "cas reset your password http://localhost:8080/user/account/reset-password?token=" + token+
                "\n\n and please note that this link is valid for one day only");

        sendEmail(simpleMailMessage);
    }


}
