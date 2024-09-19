/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.components.ErrorResponseUtil;
import java.util.Locale;
import javax.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author LONG
 */
@Controller
@ControllerAdvice
public class HomeController {
    
    @Autowired
    private ErrorResponseUtil errorResponseUtil;

    @GetMapping("/")
    public String index(Model model) {

        return "home";
    }
    
    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<Object> handleEntityNotFoundException(Exception ex, Locale locale) {
        System.out.println(ex.getMessage());
        return errorResponseUtil.buildErrorResponse(ex.getMessage(), locale);
    }
}
