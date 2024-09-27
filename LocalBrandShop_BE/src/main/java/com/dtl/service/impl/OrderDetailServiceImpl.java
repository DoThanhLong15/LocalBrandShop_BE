/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.OrderDetail;
import com.dtl.repository.OrderDetailRepository;
import com.dtl.service.OrderDetailService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class OrderDetailServiceImpl implements OrderDetailService{
    
    @Autowired
    private OrderDetailRepository orderDetailRepo;

    @Override
    public List<OrderDetail> getOrderDetailList(Map<String, String> params) {
        return this.orderDetailRepo.getOrderDetailList(params);
    }

    @Override
    public OrderDetail getOrderDetailById(int orderDetailId) {
        return this.orderDetailRepo.getOrderDetailById(orderDetailId);
    }

    @Override
    public void saveOrderDetail(OrderDetail orderDetail) {
        this.orderDetailRepo.saveOrderDetail(orderDetail);
    }

    @Override
    public void deleteOrderDetail(int orderDetailId) {
        this.orderDetailRepo.deleteOrderDetail(orderDetailId);
    }

    @Override
    public void deleteOrderDetail(OrderDetail orderDetail) {
        this.orderDetailRepo.deleteOrderDetail(orderDetail);
    }
    
}
