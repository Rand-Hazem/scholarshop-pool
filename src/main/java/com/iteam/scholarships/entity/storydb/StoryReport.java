package com.iteam.scholarships.entity.storydb;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.storydb.Story;
import com.iteam.scholarships.enums.ReportContentType;

import javax.persistence.*;

@Entity
public class StoryReport {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = true) @Enumerated(EnumType.STRING)
    private ReportContentType reportContentType;

    @Column(nullable = true)
    private String message;

    @Column(name="story_id", nullable = false, insertable = false, updatable = false)
    private int storyId;

    @ManyToOne(fetch = FetchType.LAZY,optional = false) @JoinColumn(name = "story_id")
    private Story story;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    private User reporterUser;

    public StoryReport() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ReportContentType getReportContentType() {
        return reportContentType;
    }

    public void setReportContentType(ReportContentType reportContentType) {
        this.reportContentType = reportContentType;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStoryId() {
        return storyId;
    }

    public void setStoryId(int storyId) {
        this.storyId = storyId;
    }

    public Story getStory() {
        return story;
    }

    public void setStory(Story story) {
        this.story = story;
    }

    public User getReporterUser() {
        return reporterUser;
    }

    public void setReporterUser(User reporterUser) {
        this.reporterUser = reporterUser;
    }
}
