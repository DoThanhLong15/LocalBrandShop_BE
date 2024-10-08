/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.formatters;

import com.dtl.pojo.Product;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LONG
 */
public class ProductFormatter implements Formatter<Product> {

    @Override
    public String print(Product product, Locale locale) {
        return String.valueOf(product.getId());
    }

    @Override
    public Product parse(String productId, Locale locale) throws ParseException {
        Product product = new Product();
        product.setId(Integer.parseInt(productId));
        
        return product;
    }

}
