/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.ProductQuantity;
import com.dtl.repository.ProductQuantityRepository;
import java.util.List;
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
public class ProductQuantityRepositoryImpl implements ProductQuantityRepository{
    
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<ProductQuantity> getProductQuantityByProductId(int productId) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<ProductQuantity> query = builder.createQuery(ProductQuantity.class);
        Root root = query.from(ProductQuantity.class);

        Predicate predicate = builder.equal(root.get("productId"), productId);
        query.select(root).where(predicate);

        return s.createQuery(query).getResultList();
    }
    
}
