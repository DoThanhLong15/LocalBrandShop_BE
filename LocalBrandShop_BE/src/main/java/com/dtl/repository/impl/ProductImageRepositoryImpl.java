/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.ProductImage;
import com.dtl.repository.ProductImageRepository;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
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
public class ProductImageRepositoryImpl implements ProductImageRepository {
    
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<ProductImage> getProductImagesByProductId(int productId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<ProductImage> query = builder.createQuery(ProductImage.class);
        Root root = query.from(ProductImage.class);

        Predicate predicate = builder.equal(root.get("productId"), productId);
        query.select(root).where(predicate);

        return s.createQuery(query).getResultList();
    }

}
