package com.iteam.scholarships.entity;

import com.iteam.scholarships.enums.OrganizationState;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Organization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private OrganizationState state;

    @Column(nullable = false)
    private String location;

    @Column(nullable = true)
    private String fax;

    @OneToMany(mappedBy = "organization", fetch = FetchType.LAZY)
    @Column(insertable = false, updatable = false)
    private List<Advertiser> advertisers;

    public Organization() {
        advertisers = new ArrayList<>();
        setState(OrganizationState.PENDING_APPROVAL);
    }

    public Organization(String name, String location) {
        // this constructor used in organization-repository
        this.name = name;
        this.location = location;
    }

    public Organization(String name, OrganizationState state, String location) {
        this();
        this.name = name;
        this.state = state;
        this.location = location;
    }

    public Organization(String name, OrganizationState state, String location, ArrayList<Advertiser> advertisers) {
        this.name = name;
        this.state = state;
        this.location = location;
        this.advertisers = advertisers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @NotBlank(message = "organization name required")
    @Size(min = 3, message = "invalid name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public OrganizationState getState() {
        return state;
    }

    public void setState(OrganizationState state) {
        this.state = state;
    }

    @NotBlank(message = "location is required")
    @Size(min = 6, message = "invalid location")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public List<Advertiser> getAdvertisers() {
        return advertisers;
    }

    public void setAdvertisers(ArrayList<Advertiser> advertisers) {
        this.advertisers = advertisers;
    }

    public void copyFrom(Organization organization) {
        if (organization.getName() != null) {
            setName(organization.getName());
        }
        if (organization.getLocation() != null) {
            setLocation(organization.getLocation());
        }
        // fax is optional
        setFax(organization.getFax());

    }

    @Override
    public String toString() {
        return "Organization{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", state=" + state +
                ", location='" + location + '\'' +
                '}';
    }
}
