package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.User;
import com.iteam.scholarships.enums.AccountState;
import org.hibernate.Session;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select new com.iteam.scholarships.entity.User(u.id, u.type, u.email, u.password) " +
            "from User u where u.email=:email")
    User findByEmail(String email);





    @Query("select  new com.iteam.scholarships.entity.User(u.id, u.type, u.firstName, u.lastName, u.imgUrl) " +
            "from User u where u.id=:id")
    User findUserHeader(@Param("id") int id);


    @Query("select u.email from User u where u.id=:id")
    String findEmailById(@Param("id") int id);


    @Query("select u.password from User u where u.id=:id")
    String findPasswordById(@Param("id") int id);


    @Modifying
    @Query("update User u set u.state=:accountState where u.id=:id")
    int updateAccountState(@Param("id") int id, @Param("accountState") AccountState accountState);


    @Modifying
    @Query("update User u set u.password=:password where u.id=:id")
    int resetPassword(@Param("id") int id, @Param("password") String password);


    @Query("select u.imgUrl from User u where u.id=:id")
    String findImgUrlById(@Param("id") int id);


    @Modifying
    @Query("update User u set u.imgUrl=:imgUrl where u.id=:id")
    int updateImgUrl(@Param("id") int id, @Param("imgUrl") String password);


}
