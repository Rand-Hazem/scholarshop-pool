package com.iteam.scholarships.service;

import com.iteam.scholarships.entity.Notification;
import com.iteam.scholarships.entity.Story;
import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.enums.NotificationType;
import com.iteam.scholarships.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private UserService userService;

    public boolean sendNotificatio(Notification notification) {
        notificationRepository.save(notification);
        return notification != null && notification.getId() > 0;
    }


    public boolean sendLikeRateNotification(Story story, NotificationType type) {

        Notification notification = new Notification();
        notification.setLink("/story/" + story.getId() + "/" + story.getUrlTitle());
        notification.setSenderId(userService.getCurrentUserWithId().getId());
        notification.setReceiverUser(new User(story.getUserId()));
        notification.setType(type);

        return sendNotificatio(notification);
    }


}
