/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.ProductQuantityForm;
import com.dtl.pojo.Product;
import com.dtl.pojo.ProductSize;
import com.dtl.service.CategoryService;
import com.dtl.service.ProductService;
import com.dtl.service.ProductSizeService;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService cateService;
    @Autowired
    private ProductSizeService productSizeService;

    @ModelAttribute
    public void commonAttributes(Model model) {
        model.addAttribute("categories", this.cateService.getCategories(null));
    }

    @GetMapping("/list")
    public String productList(Model model, @RequestParam Map<String, String> params) {
        
        model.addAttribute("products", this.productService.getProducts(params));

        return "productList";
    }

    @GetMapping("/form")
    public String productForm(Model model) {
        Product product = new Product();

        product.setProductQuantityForms(createQuantityForm(product));
        model.addAttribute("product", product);

        return "productForm";
    }

    @GetMapping("/form/{productId}")
    public String productForm(Model model, @PathVariable(value = "productId") int id) {
        Product product = this.productService.getProductById(id);

        model.addAttribute("product", product);

        return "productForm";
    }

    @PostMapping("/form/save")
    public String categorySave(Model model,
            @ModelAttribute(value = "product") @Valid Product product,
            BindingResult rs) {

        if (rs.hasErrors()) {
            product.setFiles(null);

            return "productForm";
        }

        try {
            this.productService.saveProduct(product);

            return "redirect:/products/list";
        } catch (Exception ex) {
            System.out.println(ex);
            model.addAttribute("errMsg", ex.getMessage());
        }

        return "productForm";
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable("id") int id) {
        this.productService.deleteProduct(id);
        
        System.out.println(id);
        
        return ResponseEntity.noContent().build();
    }

    private List<ProductQuantityForm> createQuantityForm(Product product) {
        List<ProductSize> productSizeList = this.productSizeService.getAllProductSize();

        List<ProductQuantityForm> productQuantityForm = productSizeList.stream()
                .map(size -> {
                    return createQuantity(size);
                })
                .collect(Collectors.toList());

        return productQuantityForm;
    }

    private ProductQuantityForm createQuantity(ProductSize size) {
        ProductQuantityForm form = new ProductQuantityForm();
        form.setSizeId(size.getId());
        form.setSelected(false);
        form.setQuantity(0);
        form.setSizeName(size.getSize());

        return form;
    }
}
