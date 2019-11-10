package com.iteam.scholarships.controller;

import com.iteam.scholarships.component.CurrentUser;
import com.iteam.scholarships.entity.*;
import com.iteam.scholarships.enums.AccountState;
import com.iteam.scholarships.enums.OrganizationState;
import com.iteam.scholarships.enums.UserType;
import com.iteam.scholarships.repository.StudentRepository;
import com.iteam.scholarships.service.AdvertiserService;
import com.iteam.scholarships.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class TestDBController {

    @Autowired
    private UserService userService;
    @Autowired
    private AdvertiserService advertiserService;
    @Autowired
    StudentRepository studentRepository;



    @GetMapping("find-advertiser")
    public String findAdvertiser(@RequestParam int id){
       return userService.find(id).toString();
    }


    @GetMapping("find-student")
    public String findStudent(@RequestParam int id){
       return userService.find(id).toString();
    }


    @GetMapping("insert-advertiser")
    public String insertAdvertiser(){

        Organization org = new Organization();
        org.setState(OrganizationState.PENDING_APPROVAL);
        org.setName("RO company");
        org.setLocation("ER location bewisde sea");

        Advertiser advertiser = new Advertiser();
        advertiser.setOrganization(org);
        advertiser.setMobileNum("+972 5956864");
        advertiser.setWorkEmail("rand.haem@dkjcn.slk");

        User user= new User();
        user.setPassword("$2a$10$2fGz3DXlYMcTDPV0EbUH0ORorsCny41bPS9KVJJ8Psc5S9MJmgGrq");
        user.setBirthday("2015-12-6");
        user.setState(AccountState.PENDING_APPROVAL);
        user.setType(UserType.ADVERTISER);
        user.setEmail("rand.ha@hotm.com");
        user.setFirstName("Rand");
        user.setLastName("HAzem");
        user.setGender('F');

        advertiser.setUser(user);

        return advertiserService.save(advertiser).toString();
    }

    @GetMapping("insert-student")
    public String insertStudent(){

        Student student = new Student();

        University university = new University("ptuk", "palestine");

        User user= new User();
        user.setPassword("$2a$10$2fGz3DXlYMcTDPV0EbUH0ORorsCny41bPS9KVJJ8Psc5S9MJmgGrq");
        user.setBirthday("2015-12-6");
        user.setState(AccountState.PENDING_APPROVAL);
        user.setType(UserType.ADVERTISER);
        user.setEmail("rand.haol@hotm.com");
        user.setFirstName("Rand");
        user.setLastName("HAzem");
        user.setGender('F');

        student.setUniversity(university);
        student.setUser(user);

        return studentRepository.save(student).toString();
    }

    @GetMapping("test-u")
    public void test(){
        User user = new User( "Rand", "Hazem", "email", new Date(), AccountState.PENDING_APPROVAL, UserType.ADVERTISER
        , "123456a", "", 'F');

        Advertiser advertiser = new Advertiser("rantWeok@email", "+972 05957925");
        Organization organization = new Organization("org name", OrganizationState.PENDING_APPROVAL, "or location");
        advertiser.setOrganization(organization);
        user.setAdvertiser(advertiser);

        System.out.println("***************** User \n");
        System.out.println(user+"\n\n");


        advertiser.setUser(user);
        user.setAdvertiser(null);
        System.out.println("******************* advertiser \n");
        System.out.println(advertiser.getUser()+"\n\n");



        System.out.println(user.getAdvertiser());
    }


    @GetMapping("response-entity")
    public ResponseEntity<String> testResponseEntity(){
        System.out.println("********************************************************");
        System.out.println(((User)new CurrentUser().getAuthentication().getPrincipal()).getId());
        ResponseEntity responseEntity = new ResponseEntity("{error: msg}", HttpStatus.ACCEPTED);
        return ResponseEntity.badRequest()
                .header("error", "invalid data").body("body");
    }

    @GetMapping("test-mapping")
    public void testMapping(User user, Advertiser advertiser){
        System.out.println("\n\n"+user);
        System.out.println("\n\n"+advertiser);

    }

}
