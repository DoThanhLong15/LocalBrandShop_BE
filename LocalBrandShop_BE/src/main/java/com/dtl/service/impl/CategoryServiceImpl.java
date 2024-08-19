/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.Category;
import com.dtl.repository.CategoryRepository;
import com.dtl.service.CategoryService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository cateRepo;

    @Override
    public void addOrUpdateCategory(Category category) {
        this.cateRepo.addOrUpdateCategory(category);
    }

    @Override
    public List<Category> getCategories(Map<String, String> params) {
        return this.cateRepo.getCategories(params);
    }

    @Override
    public Category getCategoryById(int id) {
        return this.cateRepo.getCategoryById(id);
    }

    @Override
    public void deleteCategory(int id) {
        this.cateRepo.deleteCategory(id);
    }

}
