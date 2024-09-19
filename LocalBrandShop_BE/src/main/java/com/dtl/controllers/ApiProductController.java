/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.ProductDTO;
import com.dtl.DTO.ProductDetailDTO;
import com.dtl.pojo.Product;
import com.dtl.pojo.ProductImage;
import com.dtl.service.ProductImageService;
import com.dtl.service.ProductService;
import com.dtl.service.impl.ProductServiceImpl;
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
@RequestMapping("/api/products")
@CrossOrigin
public class ApiProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private ProductImageService productImageService;

    @GetMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> getProductList(@RequestParam Map<String, String> params) {
        Map<String, Object> response = new HashMap<>();

        List<ProductDTO> productList = this.productService.getProducts(params).stream()
                .map(product -> {
                    List<ProductImage> imageList = this.productImageService.getProductImagesByProductId(product.getId());
                    product.setProductImageCollection(imageList);

                    return new ProductDTO(product);
                })
                .collect(Collectors.toList());

        Integer totalProduct = this.productService.getTotalProduct();
        Integer pageSize = ProductServiceImpl.getPageSize();

        String keyword = "";
        int page = 1;
        if (params != null && !params.isEmpty()) {

            String paramKeyword = params.get("q");
            if (paramKeyword != null && !paramKeyword.isEmpty()) {
                keyword = paramKeyword;
            }

            String paramPage = params.get("page");
            if (paramPage != null && !paramPage.isEmpty()) {
                page = Integer.parseInt(paramPage);
            }
        }

        response.put("data", productList);
        response.put("keyword", keyword);
        response.put("page", page);
        response.put("total", totalProduct);
        response.put("pageSize", pageSize);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/{productId}")
    @CrossOrigin
    public ResponseEntity<Object> getProductDetail(@PathVariable(value = "productId") int productId) {
        Map<String, Object> response = new HashMap<>();

        Product product = this.productService.getProductById(productId);

        List<ProductImage> imageList = this.productImageService.getProductImagesByProductId(product.getId());
        product.setProductImageCollection(imageList);
        
        response.put("data", new ProductDetailDTO(product));

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
