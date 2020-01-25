package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.scholarshipdb.ScholarshipApplicantStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ScholarshipApplicantStudentRepository extends JpaRepository<ScholarshipApplicantStudent, Integer> {


    @Query(value = "select case " +
            "when count(s)>0 " +
            "then true " +
            "else false " +
            "end " +
            "from ScholarshipApplicantStudent s where s.scholarshipId=:scholarshipId and s.studentId=:studentId")
    boolean isStudentApply(@Param("scholarshipId") int scholarshipId,@Param("studentId") int studentId);


    ScholarshipApplicantStudent findByScholarshipIdAndStudentId(int scholarshipId, int studentId);

}
