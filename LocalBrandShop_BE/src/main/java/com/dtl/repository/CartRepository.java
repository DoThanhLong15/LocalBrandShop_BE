/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.repository;

import com.dtl.pojo.Cart;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface CartRepository {

    Cart getCartById(int cartId);

    void saveCart(Cart cart);
    
    void deleteCart(int cartId);
    
    void deleteCart(Cart cart);

    List<Cart> getCartList(Map<String, String> params);

    List<Cart> getCartListByUser(int userId);
}
