package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.Organization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganizationRepository extends JpaRepository<Organization, Integer> {

    Organization save(Organization organization);

    @Query("select new com.iteam.scholarships.entity.Organization(o.name, o.location) " +
            "from Organization o " +
            "where o.state='ACCEPTED' order by o.name")
    List<Organization> findNameAndLocation();

}
