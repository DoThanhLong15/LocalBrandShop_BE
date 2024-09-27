/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.SaleOrder;
import com.dtl.repository.SaleOrderRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityNotFoundException;
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
public class SaleOrderRepositoryImpl implements SaleOrderRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public void saveSaleOrder(SaleOrder saleOrder) {
        Session s = this.factory.getObject().getCurrentSession();
        if (saleOrder.getId() != null) {
            s.update(saleOrder);
        } else {
            s.save(saleOrder);
        }
    }

    @Override
    public List<SaleOrder> getSaleOrderList(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<SaleOrder> q = b.createQuery(SaleOrder.class);
        Root root = q.from(SaleOrder.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String userId = params.get("userId");

            if (userId != null && !userId.isEmpty()) {
                Predicate p = b.equal(root.get("userId"), Integer.parseInt(userId));
                predicates.add(p);
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

        return s.createQuery(q).getResultList();
    }

    @Override
    public SaleOrder getSaleOrderById(int saleOrderId) {
        Session s = this.factory.getObject().getCurrentSession();

        SaleOrder saleOrder = s.get(SaleOrder.class, saleOrderId);

        if (saleOrder == null) {
            throw new EntityNotFoundException("saleOrder.notFound.errMsg");
        }

        return saleOrder;
    }

    @Override
    public void deleteSaleOrder(SaleOrder saleOrder) {
        Session s = this.factory.getObject().getCurrentSession();
        s.delete(saleOrder);
    }

    @Override
    public void deleteSaleOrder(int saleOrderId) {
        Session s = this.factory.getObject().getCurrentSession();
        SaleOrder saleOrder = this.getSaleOrderById(saleOrderId);
        s.delete(saleOrder);
    }

}
