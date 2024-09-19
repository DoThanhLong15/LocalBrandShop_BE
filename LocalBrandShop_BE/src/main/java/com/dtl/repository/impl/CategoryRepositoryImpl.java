/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository.impl;

import com.dtl.pojo.Category;
import com.dtl.repository.CategoryRepository;
import com.dtl.repository.ProductRepository;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Query;
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
public class CategoryRepositoryImpl implements CategoryRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private ProductRepository productRepo;

    @Override
    public void addOrUpdateCategory(Category category) {
        Session s = this.factory.getObject().getCurrentSession();
        if (category.getId() != null) {
            s.update(category);
        } else {
            s.save(category);
        }
    }

    @Override
    public List<Category> getCategories(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Category> q = b.createQuery(Category.class);
        Root root = q.from(Category.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("q");
            if (kw != null && !kw.isEmpty()) {
                Predicate p1 = b.like(root.get("name"), String.format("%%%s%%", kw));
                predicates.add(p1);
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

        return s.createQuery(q).getResultList();
    }

    @Override
    public Category getCategoryById(int id) {
        Session s = this.factory.getObject().getCurrentSession();

        Category category = s.get(Category.class, id);

        if (category == null) {
            throw new EntityNotFoundException("Không tìm thấy category: " + id);
        }

        return category;
    }

    @Override
    public void deleteCategory(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Category category = this.getCategoryById(id);

        Map<String, String> params = new HashMap<>();
        params.put("cateId", category.getId().toString());

        category.setProductCollection(this.productRepo.getProducts(params));

        if (!category.getProductCollection().isEmpty()) {
            throw new IllegalStateException("Tồn tại sản phẩm trong danh mục này!");
        }

        s.delete(category);
    }

}
