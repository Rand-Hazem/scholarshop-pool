package com.iteam.scholarships.entity;

import com.iteam.scholarships.convertor.ListStringConvertor;
import com.iteam.scholarships.enums.StoryType;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Story {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String hostCountry;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date startDate;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endDate;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private StoryType storyType;

    @Column(nullable = false)
    private String providerOrganization;

    @Column(nullable = false)
    private String field;

    @Column(nullable = false)
    private String storyInShort;

    @Column(nullable = false)
    private String aboutInstitution;

    @Column(nullable = false)
    private int likeCount = 0;

    @Column(nullable = false)
    private float rate = 0;

    @Convert(converter = ListStringConvertor.class)
    private List<String> imgList;

    private String aboutOpportunity;

    private String aboutAccommodation;

    private String aboutCityLiving;

    private String aboutTransportation;

    private String aboutTradition;

    private String recommendationAndAdvice;

    @Column(name = "user_id", insertable = false, updatable = false)
    private int userId;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User user;

    public Story() {
        imgList = new ArrayList<>(3);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank
    @Size(min = 10, message = "at least 10 charater")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @NotBlank
    public String getHostCountry() {
        return hostCountry;
    }

    public void setHostCountry(String hostCountry) {
        this.hostCountry = hostCountry;
    }

    @NotBlank
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @NotNull
    @Past
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @NotNull
    @Past
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @NotNull
    public StoryType getStoryType() {
        return storyType;
    }

    public void setStoryType(StoryType storyType) {
        this.storyType = storyType;
    }

    @NotBlank
    public String getProviderOrganization() {
        return providerOrganization;
    }

    public void setProviderOrganization(String providerOrganization) {
        this.providerOrganization = providerOrganization;
    }

    @NotBlank
    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    @NotBlank
    public String getStoryInShort() {
        return storyInShort;
    }

    public void setStoryInShort(String storyInShort) {
        this.storyInShort = storyInShort;
    }

    @NotBlank
    public String getAboutOpportunity() {
        return aboutOpportunity;
    }

    public void setAboutOpportunity(String aboutOpportunity) {
        this.aboutOpportunity = aboutOpportunity;
    }

    @NotBlank
    public String getAboutInstitution() {
        return aboutInstitution;
    }

    public void setAboutInstitution(String aboutInstitution) {
        this.aboutInstitution = aboutInstitution;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public List<String> getImgList() {
        return imgList;
    }

    public void setImgList(List<String> imgList) {
        this.imgList = imgList;
    }

    public String getAboutAccommodation() {
        return aboutAccommodation;
    }

    public void setAboutAccommodation(String aboutAccommodation) {
        this.aboutAccommodation = aboutAccommodation;
    }

    public String getAboutCityLiving() {
        return aboutCityLiving;
    }

    public void setAboutCityLiving(String aboutCityLiving) {
        this.aboutCityLiving = aboutCityLiving;
    }

    public String getAboutTransportation() {
        return aboutTransportation;
    }

    public void setAboutTransportation(String aboutTransportation) {
        this.aboutTransportation = aboutTransportation;
    }

    public String getAboutTradition() {
        return aboutTradition;
    }

    public void setAboutTradition(String aboutTradition) {
        this.aboutTradition = aboutTradition;
    }

    public String getRecommendationAndAdvice() {
        return recommendationAndAdvice;
    }

    public void setRecommendationAndAdvice(String recommendationAndAdvice) {
        this.recommendationAndAdvice = recommendationAndAdvice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Story{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", hostCountry='" + hostCountry + '\'' +
                ", city='" + city + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", storyType=" + storyType +
                ", providerOrganization='" + providerOrganization + '\'' +
                ", field='" + field + '\'' +
                ", storyInShort='" + storyInShort + '\'' +
                ", aboutInstitution='" + aboutInstitution + '\'' +
                ", aboutOpportunity='" + aboutOpportunity + '\'' +
                ", aboutAccommodation='" + aboutAccommodation + '\'' +
                ", aboutCityLiving='" + aboutCityLiving + '\'' +
                ", aboutTransportation='" + aboutTransportation + '\'' +
                ", aboutTradition='" + aboutTradition + '\'' +
                ", recommendationAndAdvice='" + recommendationAndAdvice + '\'' +
                "\n"+user+
                '}';
    }
}
