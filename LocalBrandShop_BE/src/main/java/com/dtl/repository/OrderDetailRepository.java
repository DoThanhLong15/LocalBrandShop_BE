/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.repository;

import com.dtl.pojo.OrderDetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface OrderDetailRepository {

    List<OrderDetail> getOrderDetailList(Map<String, String> params);
    
    OrderDetail getOrderDetailById(int orderDetailId);
    
    void saveOrderDetail(OrderDetail orderDetail);
    
    void deleteOrderDetail(int orderDetailId);
    
    void deleteOrderDetail(OrderDetail orderDetail);
}
