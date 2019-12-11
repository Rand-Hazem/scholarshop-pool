package com.iteam.scholarships.restController;

import com.iteam.scholarships.entity.Organization;
import com.iteam.scholarships.service.OrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RestController
@RequestMapping("/api/")
public class APIRestController {

    @Autowired
    private OrganizationService organizationService;

    @GetMapping("organizations")
    public List<Organization> getAllOrganizations(){
        return organizationService.getAllAcceptedOrgList();
    }


    @GetMapping("universities")
    public String getAllUniversities(@RequestParam(required = false) String name){
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://universities.hipolabs.com/search?name="+name;
        return restTemplate.getForObject(url, String.class);
    }

}
