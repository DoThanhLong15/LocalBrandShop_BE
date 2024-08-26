/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.repository;

import com.dtl.pojo.ProductImage;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface ProductImageRepository {
    List<ProductImage> getProductImages(Map<String, String> params);
}
