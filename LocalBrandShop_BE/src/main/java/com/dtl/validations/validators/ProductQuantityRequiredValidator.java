/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.validations.validators;

import com.dtl.dataTranferObj.ProductQuantityForm;
import com.dtl.pojo.Product;
import com.dtl.validations.annotation.ProductQuantityRequired;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 *
 * @author LONG
 */
public class ProductQuantityRequiredValidator implements ConstraintValidator<ProductQuantityRequired, Product> {

    @Override
    public void initialize(ProductQuantityRequired constraintAnnotation) {

    }

    @Override
    public boolean isValid(Product product, ConstraintValidatorContext context) {
        if (product.getId() == null) {
            if (product.getProductQuantityForms() == null) {
                return false;
            }
            
            return product.getProductQuantityForms().stream()
                    .anyMatch(quantity -> quantity.getQuantity() > 0);
        }

        return product.getProductQuantityCollection().stream()
                .anyMatch(quantity -> quantity.getQuantity() > 0);
    }

}
