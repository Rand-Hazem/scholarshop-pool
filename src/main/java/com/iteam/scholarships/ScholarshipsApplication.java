package com.iteam.scholarships;

import com.iteam.scholarships.service.UserService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class ScholarshipsApplication {

    public static void main(String[] args) {
        SpringApplication.run(ScholarshipsApplication.class, args);

    }

}
