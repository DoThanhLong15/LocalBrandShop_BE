/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.Rating;
import com.dtl.repository.RatingRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author LONG
 */
@Repository
@Transactional
public class RatingRepositoryImpl implements RatingRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    private static List<Predicate> buildPredicate(Map<String, String> params, Root root, CriteriaBuilder b) {
        List<Predicate> predicates = new ArrayList<>();

        String userId = params.get("userId");
        if (userId != null && !userId.isEmpty()) {
            Predicate p = b.equal(root.get("userId"), Integer.parseInt(userId));
            predicates.add(p);
        }

        String productId = params.get("productId");
        if (productId != null && !productId.isEmpty()) {
            Predicate p = b.equal(root.get("productId"), Integer.parseInt(productId));
            predicates.add(p);
        }

        return predicates;
    }

    @Override
    public List<Rating> getRatingList(Map<String, String> params, Integer page, Integer pageSize) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Rating> q = b.createQuery(Rating.class);
        Root root = q.from(Rating.class);
        q.select(root);

        if (params != null && !params.isEmpty()) {
            List<Predicate> predicates = buildPredicate(params, root, b);

            if (!predicates.isEmpty()) {
                q.where(predicates.toArray(Predicate[]::new));
            }
        }

        Query query = s.createQuery(q);

        int start = (page - 1) * pageSize;
        query.setFirstResult(start);
        query.setMaxResults(pageSize);

        return query.getResultList();
    }

    @Override
    public Rating getRatingById(Integer ratingId) {
        Session s = this.factory.getObject().getCurrentSession();

        Rating rating = s.get(Rating.class, ratingId);

        if (rating == null) {
            throw new EntityNotFoundException("rating.notFound.errMsg");
        }

        return rating;
    }

    @Override
    public void saveRating(Rating rating) {
        Session s = this.factory.getObject().getCurrentSession();
        if (rating.getId() != null) {
            s.update(rating);
        } else {
            s.save(rating);
        }
    }

    @Override
    public void deleteRating(Rating rating) {
        Session s = this.factory.getObject().getCurrentSession();
        s.delete(rating);
    }

    @Override
    public void deleteRating(Integer ratingId) {
        Session s = this.factory.getObject().getCurrentSession();
        Rating rating = this.getRatingById(ratingId);
        s.delete(rating);
    }

    @Override
    public long countRatings(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Long> q = b.createQuery(Long.class);
        Root root = q.from(Rating.class);
        q.select(b.count(root));

        if (params != null && !params.isEmpty()) {
            List<Predicate> predicates = buildPredicate(params, root, b);

            if (!predicates.isEmpty()) {
                q.where(predicates.toArray(Predicate[]::new));
            }
        }

        Query query = s.createQuery(q);
        return (long) query.getSingleResult();
    }
}
