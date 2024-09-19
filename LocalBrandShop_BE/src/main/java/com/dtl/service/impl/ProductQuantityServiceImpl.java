/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.ProductQuantity;
import com.dtl.repository.ProductQuantityRepository;
import com.dtl.service.ProductQuantityService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class ProductQuantityServiceImpl implements ProductQuantityService{
    
    @Autowired
    private ProductQuantityRepository productQuantityRepo;

    @Override
    public List<ProductQuantity> getProductQuantityByProductId(int productId) {
        return this.productQuantityRepo.getProductQuantityByProductId(productId);
    }
    
}
