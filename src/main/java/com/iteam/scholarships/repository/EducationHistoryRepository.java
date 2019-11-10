package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.EducationHistory;
import com.iteam.scholarships.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EducationHistoryRepository extends JpaRepository<EducationHistory, Integer> {

    @Modifying
    @Query("delete from EducationHistory e where e.id=:id and e.user.id=:userId")
    int deleteByIdAndUser(@Param("id") int id,@Param("userId") int userId);
}
