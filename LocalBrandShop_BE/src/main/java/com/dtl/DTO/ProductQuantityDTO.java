/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

import com.dtl.pojo.ProductQuantity;

/**
 *
 * @author LONG
 */
public class ProductQuantityDTO {

    private Integer id;
    private Integer quantity;
    private ProductSizeDTO productSize;

    public ProductQuantityDTO() {

    }

    public ProductQuantityDTO(ProductQuantity productQuantity) {
        this.id = productQuantity.getId();
        this.quantity = productQuantity.getQuantity();
        this.productSize = new ProductSizeDTO(productQuantity.getSizeId());
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
     * @return the quantity
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the productSize
     */
    public ProductSizeDTO getProductSize() {
        return productSize;
    }

    /**
     * @param productSize the productSize to set
     */
    public void setProductSize(ProductSizeDTO productSize) {
        this.productSize = productSize;
    }
}
