package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.entity.UserOptionalInfo;
import com.iteam.scholarships.enums.UserOptionalInfoKey;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserOptionalInfoRepository extends CrudRepository<UserOptionalInfo, Integer> {
    UserOptionalInfo findByKeyAndUser(UserOptionalInfoKey key, User user);

    List<UserOptionalInfo> findByUser(User user);
}
