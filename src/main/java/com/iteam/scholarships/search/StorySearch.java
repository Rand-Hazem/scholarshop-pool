package com.iteam.scholarships.search;

import com.iteam.scholarships.entity.storydb.Story;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class StorySearch {

    @PersistenceContext
    EntityManager entityManager;


    public FullTextQuery searchStoryQuery(String text){

        //Step-1-  get the full text entity manager
        FullTextEntityManager fullTextEntityManager =
                org.hibernate.search.jpa.Search.
                        getFullTextEntityManager(entityManager);

        //Step-2- create the query using Hibernate Search query DSL
        QueryBuilder queryBuilder =
                fullTextEntityManager.getSearchFactory()
                        .buildQueryBuilder().forEntity(Story.class).get();


        // Step-3- query to search by keywords
        org.apache.lucene.search.Query query =
                queryBuilder
                        .phrase().withSlop(2)
                        .onField("title")
                        .boostedTo(5)
                        .andField("user.firstName")
                        .andField("user.lastName")
                        .sentence(text.toLowerCase()).createQuery();

        //Step-4- wrap Lucene query in an Hibernate Query object
        org.hibernate.search.jpa.FullTextQuery jpaQuery =
                fullTextEntityManager.createFullTextQuery(query, Story.class);

        return (FullTextQuery) jpaQuery;


    }

    @Transactional
    public int searchStoryTotalCount(String searchText) {

        FullTextQuery jpaQuery = searchStoryQuery(searchText);

        int usersCount = jpaQuery.getResultSize();

        return usersCount;
    }

    @Transactional
    public List<Story> searchStory(String searchText, int pageNo, int resultsPerPage) {

        FullTextQuery jpaQuery = searchStoryQuery(searchText);

        jpaQuery.setMaxResults(resultsPerPage);
        jpaQuery.setFirstResult((pageNo-1) * resultsPerPage);

        List<Story> storyList = jpaQuery.getResultList();

        return storyList;
    }

}
