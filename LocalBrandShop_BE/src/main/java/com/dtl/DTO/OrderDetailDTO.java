/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

import com.dtl.pojo.OrderDetail;
import com.dtl.pojo.Product;
import com.dtl.pojo.ProductSize;

/**
 *
 * @author LONG
 */
public class OrderDetailDTO {

    private Integer id;
    private Integer quantity;
    private Integer price;
    private ProductSizeDTO productSize;
    private ProductDTO product;

    public OrderDetailDTO() {

    }

    public OrderDetailDTO(OrderDetail orderDetail) {
        this.id = orderDetail.getId();
        this.quantity = orderDetail.getQuantity();
        this.price = orderDetail.getPrice();
        this.product = new ProductDTO(orderDetail.getProductId());
        this.productSize = new ProductSizeDTO(orderDetail.getProductSizeId());
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
     * @return the price
     */
    public Integer getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(Integer price) {
        this.price = price;
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

    /**
     * @return the product
     */
    public ProductDTO getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(ProductDTO product) {
        this.product = product;
    }
}
