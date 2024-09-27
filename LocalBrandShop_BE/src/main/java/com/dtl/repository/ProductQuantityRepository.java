/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.repository;

import com.dtl.pojo.ProductQuantity;
import java.util.List;

/**
 *
 * @author LONG
 */
public interface ProductQuantityRepository {

    List<ProductQuantity> getProductQuantityByProductId(int productId);

    ProductQuantity getProductQuantity(int productId, int sizeId);
    
    void saveProductQuantity(ProductQuantity productQuantity);
}
