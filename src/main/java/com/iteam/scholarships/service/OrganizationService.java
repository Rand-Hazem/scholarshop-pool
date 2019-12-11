package com.iteam.scholarships.service;

import com.iteam.scholarships.entity.Organization;
import com.iteam.scholarships.repository.OrganizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Service
public class OrganizationService {

    @Autowired
    OrganizationRepository orgRepository;

    public Organization save(Organization org){
        return orgRepository.save(org);
    }

    public List<Organization> getAllAcceptedOrgList(){
        return orgRepository.findNameAndLocation();
    }




}
