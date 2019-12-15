package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.scholarshipdb.TrainingInformation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrainingInformationRepository extends JpaRepository<TrainingInformation, Integer> {

//    int deleteById(int id);


}
