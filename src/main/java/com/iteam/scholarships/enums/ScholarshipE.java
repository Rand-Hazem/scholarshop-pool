package com.iteam.scholarships.enums;

public interface ScholarshipE {
    enum Type{
         INTERNSHIP, SCHOLARSHIP, EXCHANGE
    }

    enum FundType{
        FULL, PARTIAL, SALARY, NO
    }

    enum  FundCover{
        TUITION_FEE, TRAVEL_COSTS, VISA_COSTS, ACCOMMODATION, FOOD, PARTICIPATION_FEES, STIPEND_LIVING_ALLOWANCE
        , HEALTH_INSURANCE
    }

    enum TrainingLanguage{
        ENGLISH, HOST_COUNTRY_LANG, BOTH ,UNDEFINED
    }

    enum TeachingLanguage{
        ENGLISH, HOST_COUNTRY_LANG, BOTH ,UNDEFINED
    }

    enum Gender{
        MALE, FEMALE, BOTH
    }

    enum Degree{
        BACHELOR, BACHELOR_MASTER, BACHELOR_MASTER_DOCTORAL, MASTER, MASTER_DOCTORAL, DOCTORAL
    }

}
