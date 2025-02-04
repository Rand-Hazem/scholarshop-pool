package com.iteam.scholarships.entity;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.validate.MobileNumber;
import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
public class Advertiser {

    @Id
    private int id;

    @Column(name = "work_email", nullable = false)
    private String workEmail;

    @Column(nullable = false)
    private String mobileNum;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @MapsId
    private User user;

    @OneToOne(cascade = CascadeType.PERSIST, optional = false)
    @JoinColumn(name = "organization_id", nullable = false)
    private Organization organization;

    @OneToMany(mappedBy = "advertiser", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<Scholarship> scholarshipList;

    public Advertiser() {
    }

    public Advertiser(int id) {
        this.id=id;
    }

    public Advertiser(String workEmail, String mobileNum) {
        this.workEmail = workEmail;
        this.mobileNum = mobileNum;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Valid
    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    @NotBlank(message = "email requried")
    @Email
    public String getWorkEmail() {
        return workEmail;
    }

    public void setWorkEmail(String workEmail) {
        this.workEmail = workEmail;
    }

    @MobileNumber(message = "invalid mobile number")
    public String getMobileNum() {
        return mobileNum;
    }

    public void setMobileNum(String mobileNum) {
        this.mobileNum = mobileNum;
    }

    public String getMobileCode() {
        if (this.mobileNum != null) {
            String arr[] = this.mobileNum.split(" ");
            return arr[0].length() > 5 ? "" : arr[0];
        }
        return "";
    }

    public String getMobileNumNoCode() {
        if (this.mobileNum != null) {
            String arr[] = this.mobileNum.split(" ");
            return arr.length == 2 ? arr[1] : "";
        }
        return "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void copyFrom(Advertiser advertiser){
        if(advertiser.getMobileNum() != null){
            setMobileNum(advertiser.getMobileNum());
        }
        if(advertiser.getWorkEmail() != null){
            setWorkEmail(advertiser.getWorkEmail());
        }
    }

    @Override
    public String toString() {
        return "Advertiser{" +
                "Id=" + id +
                ", organization=" + organization +
                ", workEmail='" + workEmail + '\'' +
                ", mobileNum='" + mobileNum + '\'' +
                '}';
    }
}
