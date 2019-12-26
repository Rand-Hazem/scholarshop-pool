package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.scholarshipdb.SavedScholarship;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SavedScholarshipRepository extends CrudRepository<SavedScholarship, Integer> {


    SavedScholarship findByScholarshipAndUser(Scholarship scholarship, User user);

    int deleteByScholarshipAndUser(Scholarship scholarship, User user);

}
