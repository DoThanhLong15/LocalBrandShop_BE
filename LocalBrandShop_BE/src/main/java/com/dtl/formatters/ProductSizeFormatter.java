/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.formatters;

import com.dtl.pojo.ProductSize;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author LONG
 */
public class ProductSizeFormatter implements Formatter<ProductSize>{

    @Override
    public String print(ProductSize size, Locale locale) {
        return String.valueOf(size.getId());
    }

    @Override
    public ProductSize parse(String sizeId, Locale locale) throws ParseException {
        ProductSize size = new ProductSize();
        size.setId(Integer.parseInt(sizeId));
        
        return size;
    }
    
}
