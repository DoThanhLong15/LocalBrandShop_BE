package com.dtl.repository.impl;


import com.dtl.pojo.OrderDetail;
import com.dtl.repository.OrderDetailRepository;
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author LONG
 */
@Repository
@Transactional
public class OrderDetailRepositoryImpl implements OrderDetailRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<OrderDetail> getOrderDetailList(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<OrderDetail> q = b.createQuery(OrderDetail.class);
        Root root = q.from(OrderDetail.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String productId = params.get("productId");
            if (productId != null && !productId.isEmpty()) {
                Predicate p = b.equal(root.get("productId"), Integer.parseInt(productId));
                predicates.add(p);
            }

            String saleOrderId = params.get("saleOrderId");
            if (saleOrderId != null && !saleOrderId.isEmpty()) {
                Predicate p = b.equal(root.get("saleOrderId"), Integer.parseInt(saleOrderId));
                predicates.add(p);
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

        return s.createQuery(q).getResultList();
    }

    @Override
    public OrderDetail getOrderDetailById(int orderDetailId) {
        Session s = this.factory.getObject().getCurrentSession();

        OrderDetail orderDetail = s.get(OrderDetail.class, orderDetailId);

        if (orderDetail == null) {
            throw new EntityNotFoundException("orderDetail.notFound.errMsg");
        }

        return orderDetail;
    }

    @Override
    public void saveOrderDetail(OrderDetail orderDetail) {
        Session s = this.factory.getObject().getCurrentSession();
        if (orderDetail.getId() != null) {
            s.update(orderDetail);
        } else {
            s.save(orderDetail);
        }
    }

    @Override
    public void deleteOrderDetail(int orderDetailId) {
        Session s = this.factory.getObject().getCurrentSession();
        OrderDetail orderDetail = this.getOrderDetailById(orderDetailId);
        s.delete(orderDetail);
    }

    @Override
    public void deleteOrderDetail(OrderDetail orderDetail) {
        Session s = this.factory.getObject().getCurrentSession();
        s.delete(orderDetail);
    }

}
