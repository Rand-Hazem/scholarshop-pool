package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.ScholarshipApplicationDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScholarshipApplicationDetailRepository extends JpaRepository<ScholarshipApplicationDetail, Integer> {
}
