package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.UserOptionalInfoKey;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;

@Entity
@Table(name = "user_optional_info")
public class UserOptionalInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "`key`", nullable = false)
    @Enumerated(EnumType.STRING)
    private UserOptionalInfoKey key;

    @Column(nullable = false)
    private String data;


    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(nullable = false)
    private User user;

    public UserOptionalInfo() {
    }

    public UserOptionalInfo(User user, UserOptionalInfoKey key, String data) {
        this.key = key;
        this.data = data;
        this.user = user;
    }

    public UserOptionalInfo(User user, String key, String data) {
        this.data = data;
        this.user = user;
        setKey(key);
    }

    private void setKey(@NotNull String key) {
        switch (key) {
            case "facebook":
                setKey(UserOptionalInfoKey.FACEBOOK_LINK);
                break;
            case "twitter":
                setKey(UserOptionalInfoKey.TWITTER_LINK);
                break;
            case "linkedin":
                setKey(UserOptionalInfoKey.LINKEDIN_LINK);
                break;
            case "ownwebsite":
                setKey(UserOptionalInfoKey.WEBSITE_LINK);
                break;
            case "bio":
                setKey(UserOptionalInfoKey.BIO);
                break;
            case "nationality":
                setKey(UserOptionalInfoKey.NATIONALITY);
                break;
            case "livingCity":
                setKey(UserOptionalInfoKey.LIVEING_CITY);
                break;
            case "mobileNumber":
                setKey(UserOptionalInfoKey.MOBILE);
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserOptionalInfoKey getKey() {
        return key;
    }

    public void setKey(UserOptionalInfoKey key) {
        this.key = key;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public boolean deleteData() {
        return data == null || data.isBlank();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public static HashMap<String, UserOptionalInfo> listToHashKeyName(List<UserOptionalInfo> list){
        HashMap<String, UserOptionalInfo> map = new HashMap<>();
        for(UserOptionalInfo info : list){
            map.put(info.getKey().name(), info);
        }
        return map;
    }

    @Override
    public String toString() {
        return "{" +
                "id=" + id +
                ", key=" + key +
                ", data='" + data + '\'' +
                '}';
    }
}
