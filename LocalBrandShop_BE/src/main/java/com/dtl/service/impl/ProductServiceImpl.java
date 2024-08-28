/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dtl.pojo.Product;
import com.dtl.pojo.ProductImage;
import com.dtl.pojo.ProductQuantity;
import com.dtl.repository.ProductImageRepository;
import com.dtl.repository.ProductQuantityRepository;
import com.dtl.repository.ProductRepository;
import com.dtl.repository.ProductSizeRepository;
import com.dtl.service.ProductService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private ProductSizeRepository productSizeRepo;
    @Autowired
    private ProductQuantityRepository productQuantityRepo;
    @Autowired
    private ProductImageRepository productImageRepo;

    @Override
    public void saveProduct(Product product) {
        if (product.getFiles() != null && !product.getFiles().isEmpty()) {
            product.setProductImageCollection(new ArrayList<>());

            product.getFiles().stream().forEach(file -> {
                try {
                    if (!file.isEmpty()) {
                        Map<String, Object> res = cloudinary.uploader().upload(file.getBytes(),
                                ObjectUtils.asMap("resource_type", "auto"));

                        ProductImage productImage = new ProductImage();
                        productImage.setImage(res.get("secure_url").toString());

                        product.getProductImageCollection().add(productImage);
                    }
                } catch (IOException ex) {
                    Logger.getLogger(ProductServiceImpl.class.getName()).log(Level.SEVERE, "Error uploading file: " + file.getOriginalFilename(), ex);
                }
            });
        }

        for (ProductImage image : product.getProductImageCollection()) {
            image.setProductId(product);
        }

        if (product.getId() == null) {
            if (!product.getProductQuantityForms().isEmpty()) {
                product.setProductQuantityCollection(new ArrayList<>());

                product.getProductQuantityForms().stream()
                        .forEach(pqForm -> {
                            ProductQuantity productQuantity = new ProductQuantity();
                            productQuantity.setProductId(product);
                            productQuantity.setSizeId(this.productSizeRepo.getProductSizeById(pqForm.getSizeId()));
                            productQuantity.setQuantity(pqForm.getQuantity());

                            product.getProductQuantityCollection().add(productQuantity);
                        });
            }
        }

        for (ProductQuantity quantity : product.getProductQuantityCollection()) {
            quantity.setProductId(product);
        }

        this.productRepo.saveProduct(product);
    }

    @Override
    public List<Product> getProducts(Map<String, String> params) {
        return this.productRepo.getProducts(params);
    }

    @Override
    public Product getProductById(int id) {
        Product product = this.productRepo.getProductById(id);

        product.setProductQuantityCollection(this.productQuantityRepo.getProductQuantityByProductId(id));
        product.setProductImageCollection(this.productImageRepo.getProductImagesByProductId(id));

        return product;
    }

    @Override
    public void deleteProduct(int id) {
        this.productRepo.deleteProduct(id);
    }

}
