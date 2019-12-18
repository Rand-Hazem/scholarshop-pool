package com.iteam.scholarships.search;
import com.iteam.scholarships.entity.User;
import org.apache.lucene.search.Sort;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class UserSearch {

    @PersistenceContext
    private EntityManager entityManager;

    private FullTextEntityManager fullTextEntityManager;

    public UserSearch() {
    }

    public QueryBuilder getQueryBuilder() {
         fullTextEntityManager = Search.getFullTextEntityManager(entityManager);

        QueryBuilder queryBuilder = fullTextEntityManager
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(User.class)
                .get();

        return queryBuilder;
    }


    public List<User> searchUserName(String username){
        QueryBuilder queryBuilder = getQueryBuilder();

        org.apache.lucene.search.Query query =
                queryBuilder
                .keyword()
                .onFields("firstName", "lastName")
                .matching(username)
                .createQuery();

        // sort user names
        Sort sort = queryBuilder
                .sort()
                .byField("firstName")
                .andByField("lastName")
                .createSort();

        org.hibernate.search.jpa.FullTextQuery jpaQuery = fullTextEntityManager.createFullTextQuery(query, User.class);

        jpaQuery.setSort(sort);

        List<User> result = jpaQuery.getResultList();

        return result;
    }



}
