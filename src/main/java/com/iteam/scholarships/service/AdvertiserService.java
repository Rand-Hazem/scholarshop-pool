package com.iteam.scholarships.service;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.Advertiser;
import com.iteam.scholarships.repository.AdvertiserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;

@Transactional
@Service
public class AdvertiserService {

    @Autowired
    private AdvertiserRepository advertiserRepository;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private CurrentUser currentUser;


    public Advertiser save(Advertiser advertiser) {
        return advertiserRepository.save(advertiser);
    }

    public Advertiser findCurrent(){
        return advertiserRepository.findById(currentUser.getAdvertiserId()).orElse(null);
    }

    public Advertiser register(Advertiser advertiser) {
        return save(advertiser);
    }

    public boolean updateAccount(Advertiser advertiser){
        Advertiser fetched = findCurrent();
        if(fetched == null){
            return false;
        }
        fetched.copyFrom(advertiser);
        fetched.getOrganization().copyFrom(advertiser.getOrganization());

       return advertiserRepository.save(fetched) != null;
    }

}
