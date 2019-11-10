package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.Advertiser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertiserRepository extends JpaRepository<Advertiser, Integer> {

   Advertiser save(Advertiser advertiser);

}
