package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.scholarshipdb.SavedScholarship;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SavedScholarshipRepository extends JpaRepository<SavedScholarship, Integer> {


    SavedScholarship findByScholarshipAndStudentId(Scholarship scholarship, int studentId);

    int deleteByScholarshipAndStudentId(Scholarship scholarship, int studentId);

    Page<SavedScholarship> findAllByStudentId(int id, Pageable paging);

}
