/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

import com.dtl.pojo.ProductSize;

/**
 *
 * @author LONG
 */
public class ProductSizeDTO {
    private Integer id;
    private String size;
    
    public ProductSizeDTO() {
        
    }
    
    public ProductSizeDTO(ProductSize productSize) {
        this.id = productSize.getId();
        this.size = productSize.getSize();
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the size
     */
    public String getSize() {
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setSize(String size) {
        this.size = size;
    }
    
    
}
