/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.service;

import com.dtl.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface ProductService {
    void saveProduct(Product product);

    List<Product> getProducts(Map<String, String> params);
    
    Product getProductById(int id);
    
    void deleteProduct(int id);
    
    int getTotalProduct();
}
