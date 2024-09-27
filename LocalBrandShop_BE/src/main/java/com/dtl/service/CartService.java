/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.service;

import com.dtl.pojo.Cart;
import com.dtl.pojo.Product;
import com.dtl.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface CartService {

    Cart getCartById(int cartId);

    void saveCart(Cart cart);

    void deleteCart(int cartId);

    void deleteCart(Cart cart);

    List<Cart> getCartList(Map<String, String> params);

    List<Cart> getCartListByUser(int userId);

    boolean checkProductInCart(Cart cart, Cart newCart);

    boolean checkQuantityValid();

    boolean checkQuantityValid(Product product, Cart cart);

    boolean checkPriceValid();

    boolean checkPriceValid(Product product, Cart cart);
    
    boolean isCartOwner(User user, User owner);
}
