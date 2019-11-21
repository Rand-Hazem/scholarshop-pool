package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.AccountState;
import com.iteam.scholarships.enums.UserType;
import com.iteam.scholarships.validate.FieldMatch;
import com.iteam.scholarships.validate.Gender;
import org.hibernate.annotations.LazyGroup;
import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;
import org.springframework.context.annotation.Lazy;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@FieldMatch(first = "password", secound = "confirmPass", message = "passwoed and confrim password must match")
@Entity
public class User {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private AccountState state;

    @Column(nullable = false) @Enumerated(EnumType.STRING)
    private UserType type;

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false) @Temporal(TemporalType.DATE) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date birthday;

    @Column(nullable = false)
    private String password;

    @Transient
    private String confirmPass;

    @Transient
    private boolean dataChangedFromCopy = false;

    @Column(nullable = false, columnDefinition = "char(1)")
    private Character gender;

    @Column(name = "img_url",nullable = true)
    private String imgUrl;

    @OneToOne(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Advertiser advertiser;

    @OneToOne(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Student student;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<UserOptionalInfo> userOptionalInfoList;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<WorkHistory> workHistoryList;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<EducationHistory> educationHistoryList;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<Story> storyList;

    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<StoryRate> listStoryRate; // this has no setter or getter, it's just for relation


    public User(){
        userOptionalInfoList = new ArrayList<>();
        workHistoryList = new ArrayList<>();
        educationHistoryList = new ArrayList<>();
        setState(AccountState.PENDING_APPROVAL);
    }

    public User(int id){
        this.id =id;
    }

    public User(String firstName, String lastName, String email, Date birthday, AccountState state, UserType type,
                String password, String confirmPass, Character gender) {
        this.state = state;
        this.type = type;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.birthday = birthday;
        this.password = password;
        this.confirmPass = confirmPass;
        this.gender = gender;
    }

    public User(int id, UserType type, String email, String password) { // use in user-repository
        this.id = id;
        this.type = type;
        this.email = email;
        this.password = password;
    }

    public User(String firstName, String lastName, String email) { // use in user-repository
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    public User(int id, UserType type, String firstName, String lastName, String imgUrl) {
        this.id=id;
        this.type = type;
        this.firstName = firstName;
        this.lastName = lastName;
        this.imgUrl = imgUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Size(min = 3, message = "first name at least 3 char")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Size(min = 3, message = "last name at least 3 char")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @NotBlank(message = "this field is required")
    @Email(message = "invalid email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @NotNull(message = "this field is required")
    @Past(message = "invalid birthday")
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public void setBirthday(String s){
        try {
            setBirthday(new SimpleDateFormat("yyyy-mm-dd").parse(s));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @NotBlank
    @Size.List({
            @Size(min = 6, message = "password must be at least of 6 digit"),
            @Size(max = 32, message = "password must be at most of 32 digit")
    })
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @NotBlank(message = "this field is required")
    @Size.List({
            @Size(min = 6, message = "password must be at least of 6 digit"),
            @Size(max = 32, message = "password must be at most of 32 digit")
    })
    public String getConfirmPass() {
        return confirmPass;
    }

    public void setConfirmPass(String confirmPass) {
        this.confirmPass = confirmPass;
    }

    public AccountState getState() {
        return state;
    }

    public void setState(AccountState state) {
        this.state = state;
    }

    public UserType getType() {
        return type;
    }

    public void setType(UserType type) {
        this.type = type;
    }

    @NotNull(message = "this field is requeired")
    @Gender
    public Character getGender() {
        return gender;
    }

    public void setGender(Character gender) {
        this.gender = gender;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Valid
    public Advertiser getAdvertiser() {
        return advertiser;
    }

    public void setAdvertiser(Advertiser advertiser) {
        this.advertiser = advertiser;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public List<UserOptionalInfo> getUserOptionalInfoList() {
        return userOptionalInfoList;
    }

    public void setUserOptionalInfoList(List<UserOptionalInfo> userOptionalInfoList) {
        this.userOptionalInfoList = userOptionalInfoList;
    }

    public List<WorkHistory> getWorkHistoryList() {
        return workHistoryList;
    }

    public void setWorkHistoryList(List<WorkHistory> workHistoryList) {
        this.workHistoryList = workHistoryList;
    }

    public List<EducationHistory> getEducationHistoryList() {
        return educationHistoryList;
    }

    public void setEducationHistoryList(List<EducationHistory> educationHistoryList) {
        this.educationHistoryList = educationHistoryList;
    }

    public boolean isDataChangedFromCopy() {
        return dataChangedFromCopy;
    }

    public void setDataChangedFromCopy(boolean dataChangedFromCopy) {
        this.dataChangedFromCopy = dataChangedFromCopy;
    }

    public List<Story> getStoryList() {
        return storyList;
    }

    public void setStoryList(List<Story> storyList) {
        this.storyList = storyList;
    }

    public void copyFrom(User user){
        if(user.getFirstName() != null){
            this.setFirstName(user.getFirstName());
            dataChangedFromCopy= true;
        }
        if(user.getLastName() != null){
            this.setLastName(user.getLastName());
            dataChangedFromCopy= true;
        }
        if(user.getBirthday() != null){
            this.setBirthday(user.getBirthday());
            dataChangedFromCopy= true;
        }
        if(user.getEmail() != null){
            this.setEmail(user.getEmail());
            dataChangedFromCopy= true;
        }
        if(user.getGender() != null){
            this.setGender(user.getGender());
            dataChangedFromCopy= true;
        }
        if(user.getImgUrl() != null){
            this.setImgUrl(user.getImgUrl());
            dataChangedFromCopy= true;
        }
    }

    public boolean isDataChanged(){
        return dataChangedFromCopy;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", state=" + state +
                ", type=" + type +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", birthday=" + birthday +
                ", password='" + password + '\'' +
                ", confirmPass='" + confirmPass + '\'' +
                ", gender=" + gender +
                '}';
    }
}
