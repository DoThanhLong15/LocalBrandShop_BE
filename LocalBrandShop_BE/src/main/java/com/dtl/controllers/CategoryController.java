/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.components.ErrorResponseUtil;
import com.dtl.pojo.Category;
import com.dtl.service.CategoryService;
import java.util.Locale;
import java.util.Map;
import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author LONG
 */
@Controller
@RequestMapping("/categories")
public class CategoryController {
    @Autowired
    private CategoryService cateService;
    @Autowired
    private ErrorResponseUtil errorResponseUtil;
    
    @GetMapping("/list")
    public String categoryList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("categories", this.cateService.getCategories(params));

        return "categoryList";
    }
    
    @GetMapping("/form")
    public String categoryForm(Model model) {
        model.addAttribute("category", new Category());

        return "categoryForm";
    }

    @GetMapping("/form/{cateId}")
    public String categoryForm(Model model, @PathVariable(value = "cateId") int id) {
        model.addAttribute("category", this.cateService.getCategoryById(id));

        return "categoryForm";
    }
    
    @PostMapping("/form/save")
    public String categorySave(Model model, @ModelAttribute(value = "category") @Valid Category category,
            BindingResult rs) {
        
        if (rs.hasErrors()) {
            return "categoryForm";
        }

        try {
            this.cateService.addOrUpdateCategory(category);
            
            return "redirect:/categories/list";
        } catch (Exception ex) {
            model.addAttribute("errMsg", ex.getMessage());
        }

        return "categoryForm";
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteCategory(@PathVariable("id") int id, Locale locale) {
        try {
            this.cateService.deleteCategory(id);
            return ResponseEntity.noContent().build();
        } catch (EntityNotFoundException ex) {
            System.out.println(ex.getMessage());
            return errorResponseUtil.buildErrorResponse("category.notFound.errMsg", locale);
        } catch (IllegalStateException ex) {
            System.out.println(ex.getMessage());
            return errorResponseUtil.buildErrorResponse("category.hasProduct.errMsg", locale);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return errorResponseUtil.buildErrorResponse("system.errMsg", locale);
        }
    }
}
