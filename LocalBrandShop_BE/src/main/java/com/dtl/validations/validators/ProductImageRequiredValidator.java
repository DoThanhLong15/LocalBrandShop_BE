/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.validations.validators;

import com.dtl.pojo.Product;
import com.dtl.validations.annotation.ProductImageRequired;
import java.util.List;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LONG
 */
public class ProductImageRequiredValidator implements ConstraintValidator<ProductImageRequired, Product>{

    @Override
    public void initialize(ProductImageRequired constraintAnnotation) {
        
    }

    @Override
    public boolean isValid(Product product, ConstraintValidatorContext context) {
        if (product.getId() == null) {
            List<MultipartFile> files = product.getFiles();
            return files != null && !files.isEmpty() && files.stream().noneMatch(MultipartFile::isEmpty);
        }
        
        return true;
    }
    
}
