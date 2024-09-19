/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.service;

import com.dtl.pojo.ProductQuantity;
import java.util.List;

/**
 *
 * @author LONG
 */
public interface ProductQuantityService {
    List<ProductQuantity> getProductQuantityByProductId(int productId);
}
