/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.Cart;
import com.dtl.pojo.Product;
import com.dtl.pojo.ProductQuantity;
import com.dtl.pojo.User;
import com.dtl.repository.CartRepository;
import com.dtl.repository.ProductQuantityRepository;
import com.dtl.service.CartService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepo;
    @Autowired
    private ProductQuantityRepository productQuantityRepo;

    @Override
    public Cart getCartById(int cartId) {
        return this.cartRepo.getCartById(cartId);
    }

    @Override
    public void saveCart(Cart cart) {
        this.cartRepo.saveCart(cart);
    }

    @Override
    public void deleteCart(int cartId) {
        this.cartRepo.deleteCart(cartId);
    }

    @Override
    public List<Cart> getCartList(Map<String, String> params) {
        return this.cartRepo.getCartList(params);
    }

    @Override
    public List<Cart> getCartListByUser(int userId) {
        return this.cartRepo.getCartListByUser(userId);
    }

    @Override
    public void deleteCart(Cart cart) {
        this.cartRepo.deleteCart(cart);
    }

    @Override
    public boolean checkProductInCart(Cart cart, Cart newCart) {
        if(cart.getProductSizeId().getId() == newCart.getProductSizeId().getId()){
            return true;
        }
        
        return false;
    }

    @Override
    public boolean checkQuantityValid() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean checkPriceValid() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean checkQuantityValid(Product product, Cart cart) {
        ProductQuantity productQuantity = this.productQuantityRepo.getProductQuantity(product.getId(), cart.getProductSizeId().getId());
        
        if(productQuantity.getQuantity() < cart.getQuantity()){
            return false;
        }
        
        return true;
    }

    @Override
    public boolean checkPriceValid(Product product, Cart cart) {
        return product.getPrice() <= (cart.getPrice() / cart.getQuantity());
    }

    @Override
    public boolean isCartOwner(User user, User owner) {
        return user.getId().equals(owner.getId());
    }
}
