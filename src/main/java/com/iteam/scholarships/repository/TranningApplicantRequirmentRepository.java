package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.scholarshipdb.TranningApplicantRequirment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TranningApplicantRequirmentRepository extends JpaRepository<TranningApplicantRequirment, Integer> {
}
