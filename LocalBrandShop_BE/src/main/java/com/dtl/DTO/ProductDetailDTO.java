/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

import com.dtl.pojo.Product;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author LONG
 */
public class ProductDetailDTO extends ProductDTO{
    private String description;
    private Integer ratingCount;
    private CategoryDTO category;
    private List<ProductImageDTO> productImage;
    
    public ProductDetailDTO() {
        super();
    }
    
    public ProductDetailDTO(Product product) {
        super(product);
        
        this.description = product.getDescription();
        this.category = new CategoryDTO(product.getCategoryId());
        this.ratingCount = product.getRatingCount();
        this.productImage = product.getProductImageCollection()
                .stream()
                .map(image -> new ProductImageDTO(image))
                .collect(Collectors.toList());
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the ratingCount
     */
    public Integer getRatingCount() {
        return ratingCount;
    }

    /**
     * @param ratingCount the ratingCount to set
     */
    public void setRatingCount(Integer ratingCount) {
        this.ratingCount = ratingCount;
    }  

    /**
     * @return the category
     */
    public CategoryDTO getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    /**
     * @return the productImage
     */
    public List<ProductImageDTO> getProductImage() {
        return productImage;
    }

    /**
     * @param productImage the productImage to set
     */
    public void setProductImage(List<ProductImageDTO> productImage) {
        this.productImage = productImage;
    }
}
