package com.iteam.scholarships.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.JoinFormula;

import javax.persistence.*;

@Entity
public class StoryRate {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int value;

    @Column(name = "user_id", insertable = false, updatable = false)
    private int userId;

    @Column(name = "story_id", insertable = false, updatable = false)
    private int storyId;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    private  Story story;

    public StoryRate() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStoryId() {
        return storyId;
    }

    public void setStoryId(int storyId) {
        this.storyId = storyId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Story getStory() {
        return story;
    }

    public void setStory(Story story) {
        this.story = story;
    }
}
