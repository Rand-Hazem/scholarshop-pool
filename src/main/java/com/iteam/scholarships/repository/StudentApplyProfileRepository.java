package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.scholarshipdb.StudentApplyProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentApplyProfileRepository extends JpaRepository<StudentApplyProfile, Integer> {
}
