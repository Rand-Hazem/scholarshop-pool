package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.scholarshipdb.ScholarshipApplicantRequirement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScholarshipApplicantRequirementRepository extends JpaRepository<ScholarshipApplicantRequirement, Integer> {
}
