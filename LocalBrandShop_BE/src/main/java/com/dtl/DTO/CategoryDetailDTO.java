/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

import com.dtl.pojo.Category;

/**
 *
 * @author LONG
 */
public class CategoryDetailDTO extends CategoryDTO{
    private String desctiption;
    
    public CategoryDetailDTO() {
        super();
    }
    
    public CategoryDetailDTO(Category category) {
        super(category);
        this.desctiption = category.getDescription();
    }

    /**
     * @return the desctiption
     */
    public String getDesctiption() {
        return desctiption;
    }

    /**
     * @param desctiption the desctiption to set
     */
    public void setDesctiption(String desctiption) {
        this.desctiption = desctiption;
    }
}
