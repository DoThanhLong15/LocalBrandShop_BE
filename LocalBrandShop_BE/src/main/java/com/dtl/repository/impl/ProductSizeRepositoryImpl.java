/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.ProductSize;
import com.dtl.repository.ProductSizeRepository;
import java.util.List;
import javax.persistence.EntityNotFoundException;
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
public class ProductSizeRepositoryImpl implements ProductSizeRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<ProductSize> getAllProductSize() {
        Session s = this.factory.getObject().getCurrentSession();

        return s.createQuery("From ProductSize").getResultList();
    }

    @Override
    public ProductSize getProductSizeById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        
        ProductSize productSize = s.get(ProductSize.class, id);
        
        if (productSize == null) {
            throw new EntityNotFoundException("productSize.notFound.errMsg");
        }
        return productSize;
    }

}
