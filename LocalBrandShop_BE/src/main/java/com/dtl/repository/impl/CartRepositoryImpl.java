/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.Cart;
import com.dtl.repository.CartRepository;
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
public class CartRepositoryImpl implements CartRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public Cart getCartById(int cartId) {
        Session s = this.factory.getObject().getCurrentSession();

        Cart cart = s.get(Cart.class, cartId);

        if (cart == null) {
            throw new EntityNotFoundException("cart.notFound.errMsg");
        }

        return cart;
    }

    @Override
    public void saveCart(Cart cart) {
        Session s = this.factory.getObject().getCurrentSession();
        if (cart.getId() != null) {
            s.update(cart);
        } else {
            s.save(cart);
        }
    }

    @Override
    public List<Cart> getCartList(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Cart> q = b.createQuery(Cart.class);
        Root root = q.from(Cart.class);
        q.select(root);

        if (params != null && !params.isEmpty()) {
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

            q.where(predicates.toArray(Predicate[]::new));
        }

        return s.createQuery(q).getResultList();
    }

    @Override
    public List<Cart> getCartListByUser(int userId) {

        if (userId < 0) {
            return null;
        }

        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Cart> q = b.createQuery(Cart.class);
        Root root = q.from(Cart.class);
        q.select(root);

        Predicate predicate = b.equal(root.get("userId"), userId);
        q.where(predicate);

        return s.createQuery(q).getResultList();
    }

    @Override
    public void deleteCart(int cartId) {
        Session s = this.factory.getObject().getCurrentSession();
        Cart cart = this.getCartById(cartId);
        s.delete(cart);
    }

    @Override
    public void deleteCart(Cart cart) {
        Session s = this.factory.getObject().getCurrentSession();
        s.delete(cart);
    }

}
