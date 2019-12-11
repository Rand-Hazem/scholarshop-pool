package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.AcademicInformation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AcademicInformationRepository extends JpaRepository<AcademicInformation, Integer> {
}
