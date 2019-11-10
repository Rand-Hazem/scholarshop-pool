package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.ResetPasswordToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResetPasswordRepository extends CrudRepository<ResetPasswordToken, Integer> {

    ResetPasswordToken findByToken(String token);
}
