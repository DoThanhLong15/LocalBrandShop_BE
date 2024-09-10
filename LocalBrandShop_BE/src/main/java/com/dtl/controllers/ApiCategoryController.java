/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.CategoryDTO;
import com.dtl.DTO.CategoryDetailDTO;
import com.dtl.service.CategoryService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LONG
 */
@RestController
@RequestMapping("/api/categories")
@CrossOrigin
public class ApiCategoryController {

    @Autowired
    private CategoryService cateService;
    
    @GetMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> getCategoryList(@RequestParam Map<String, String> params) {
        Map<String, Object> response = new HashMap<>();

        List<CategoryDTO> categoryList = this.cateService.getCategories(params).stream()
                .map(category -> new CategoryDTO(category))
                .collect(Collectors.toList());

        String keyword = "";
        if (params != null && !params.isEmpty()) {
            
            String paramKeyword = params.get("q");
            if (paramKeyword != null && !paramKeyword.isEmpty()) {
                keyword = paramKeyword;
            }
        }

        response.put("data", categoryList);
        response.put("keyword", keyword);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    
    @GetMapping("/{cateId}")
    @CrossOrigin
    public ResponseEntity<Object> getCategory(@PathVariable(value = "cateId") int cateId) {
        Map<String, Object> response = new HashMap<>();

        CategoryDetailDTO  category = new CategoryDetailDTO(this.cateService.getCategoryById(cateId));
        response.put("data", category);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
