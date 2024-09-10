/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

/**
 *
 * @author LONG
 */
public class ProductQuantityForm {

    private int productId;
    private int sizeId;
    private boolean selected;
    private int quantity;
    private String sizeName;

    /**
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the sizeId
     */
    public int getSizeId() {
        return sizeId;
    }

    /**
     * @param sizeId the sizeId to set
     */
    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    /**
     * @return the selected
     */
    public boolean isSelected() {
        return selected;
    }

    /**
     * @param selected the selected to set
     */
    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the sizeName
     */
    public String getSizeName() {
        return sizeName;
    }

    /**
     * @param sizeName the sizeName to set
     */
    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }
}
