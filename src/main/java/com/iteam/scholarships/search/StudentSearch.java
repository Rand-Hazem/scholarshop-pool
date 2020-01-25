package com.iteam.scholarships.search;

import com.iteam.scholarships.entity.scholarshipdb.AcademicInformation;
import com.iteam.scholarships.entity.scholarshipdb.Scholarship;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class StudentSearch {

    @PersistenceContext
    private EntityManager entityManager;

    public List<AcademicInformation> searchMatchScholarships(String text) {

        FullTextEntityManager fullTextEntityManager =
                org.hibernate.search.jpa.Search.
                        getFullTextEntityManager(entityManager);

        QueryBuilder queryBuilder =
                fullTextEntityManager.getSearchFactory()
                        .buildQueryBuilder().forEntity(AcademicInformation.class).get();

        org.apache.lucene.search.Query query =
                queryBuilder
                        .keyword()
                        .onFields("major", "teachingLanguage", "scholarship.type", "scholarship.country", "scholarship.degree", "scholarship.fundType")
                        .ignoreFieldBridge()
                        .matching(text)
                        .createQuery();

        org.hibernate.search.jpa.FullTextQuery jpaQuery =
                fullTextEntityManager.createFullTextQuery(query, AcademicInformation.class);

        List<AcademicInformation> scholarshipList = jpaQuery.setMaxResults(10).getResultList();
        System.out.println(scholarshipList.size());
        return scholarshipList;

    }

}


