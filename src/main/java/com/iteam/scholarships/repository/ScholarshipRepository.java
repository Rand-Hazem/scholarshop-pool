package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import com.iteam.scholarships.enums.ScholarshipE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScholarshipRepository extends JpaRepository<Scholarship, Integer> {


    List<Scholarship> findAllByAdvertiser(Advertiser adv);
}
