package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.NotificationType;

import javax.persistence.*;

@Entity
public class Notification {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private int senderId;

    @Column(name = "receiver_id", nullable = false, insertable = false, updatable = false)
    private int receiverId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "receiver_id")
    private User receiverUser;

    @Column(nullable = false)
    private String link;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private NotificationType type;

    @Column(nullable = false)
    private boolean opend;

    public Notification() {
        opend= false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public User getReceiverUser() {
        return receiverUser;
    }

    public void setReceiverUser(User receiverUser) {
        this.receiverUser = receiverUser;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public NotificationType getType() {
        return type;
    }

    public void setType(NotificationType type) {
        this.type = type;
    }

    public boolean isOpend() {
        return opend;
    }

    public void setOpend(boolean opend) {
        this.opend = opend;
    }

    @Override
    public String toString() {
        String msg = "";
        switch (getType()){
            case STORY_LIKE: msg = "like your story";break;
            case STORY_RATE: msg = "rate your story";break;
        }
        return msg;
    }
}
