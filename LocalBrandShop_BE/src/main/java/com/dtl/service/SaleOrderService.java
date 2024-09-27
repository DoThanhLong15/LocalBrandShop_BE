/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.service;

import com.dtl.pojo.SaleOrder;
import com.dtl.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface SaleOrderService {
    
    void saveSaleOrder(SaleOrder saleOrder);

    List<SaleOrder> getSaleOrderList(Map<String, String> params);

    SaleOrder getSaleOrderById(int saleOrderId);

    void deleteSaleOrder(SaleOrder saleOrder);

    void deleteSaleOrder(int saleOrderId);
    
    boolean isSaleOrderOwner(User user, User owner);
}
