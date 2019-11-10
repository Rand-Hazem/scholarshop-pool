package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.VerificationToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

// it extends CrudRepository because only CRUD needed
@Repository
public interface VerificationTokenRepository extends CrudRepository<VerificationToken, Integer> {

    VerificationToken findByToken(String token);
    VerificationToken findByUser(User user);
}
