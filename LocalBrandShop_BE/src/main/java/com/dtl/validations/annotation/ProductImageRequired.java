/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.validations.annotation;

import com.dtl.validations.validators.ProductImageRequiredValidator;
import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * @author LONG
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ProductImageRequiredValidator.class)
public @interface ProductImageRequired {
    String message() default "Ảnh sản phẩm không được để trống";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}