package com.iteam.scholarships.enums;

public interface Scholarshipi {
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

    enum ApplicantDegreeRequired{
        NO_CONSTRAINT, PRIMARY_SCHOOL, SECONDARY_SCHOOL, DIPLOMA, BACHELOR, MASTER, DOCTORAL
    }

    enum EnglishLevel{
        A1, A2, C1, C2, B1, B2, NS
    }

    enum RequiredDocument{
        CV, MOTIVATION_LETTER, TRANSCRIPT_RECORDS, UNIVERSITY_CERTIFICATE, PASSPORT_COPY
        , PERSONAL_PHOTO, PROPOSAL, RECOMMENDATION_LETTER;

    }

    enum ApplicantResidentIn{
        ANY, NATIONALITY_COUNTY;
    }


}
