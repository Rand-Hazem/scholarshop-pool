package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.WorkHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkHistoryRepository extends JpaRepository<WorkHistory, Integer> {

    @Modifying
    @Query("delete from EducationHistory e where e.id=:id and e.user.id=:userId")
    int deleteByIdAndUser(@Param("id") int id, @Param("userId") int userId);

}
