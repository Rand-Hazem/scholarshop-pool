package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.StudentInterest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentInterestRepository extends CrudRepository<StudentInterest, Integer> {
}
