/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.ProductSize;
import com.dtl.repository.ProductSizeRepository;
import com.dtl.service.ProductSizeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class ProductSizeServiceImpl implements ProductSizeService {

    @Autowired
    private ProductSizeRepository productSizeRepo;

    @Override
    public List<ProductSize> getAllProductSize() {
        return this.productSizeRepo.getAllProductSize();
    }

    @Override
    public ProductSize getProductSizeById(int id) {
        return this.productSizeRepo.getProductSizeById(id);
    }

}
