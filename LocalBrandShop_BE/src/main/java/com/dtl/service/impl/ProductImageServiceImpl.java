/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.ProductImage;
import com.dtl.repository.ProductImageRepository;
import com.dtl.service.ProductImageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class ProductImageServiceImpl implements ProductImageService {

    @Autowired
    private ProductImageRepository productImageRepo;

    @Override
    public List<ProductImage> getProductImagesByProductId(int productId) {
        return this.productImageRepo.getProductImagesByProductId(productId);
    }

}
