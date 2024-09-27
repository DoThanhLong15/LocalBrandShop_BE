/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.SaleOrder;
import com.dtl.pojo.User;
import com.dtl.repository.SaleOrderRepository;
import com.dtl.service.SaleOrderService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class SaleOrderServiceimpl implements SaleOrderService{
    
    @Autowired
    private SaleOrderRepository saleOrderRepo;

    @Override
    public void saveSaleOrder(SaleOrder saleOrder) {
        this.saleOrderRepo.saveSaleOrder(saleOrder);
    }

    @Override
    public List<SaleOrder> getSaleOrderList(Map<String, String> params) {
        return this.saleOrderRepo.getSaleOrderList(params);
    }

    @Override
    public SaleOrder getSaleOrderById(int saleOrderId) {
        return this.saleOrderRepo.getSaleOrderById(saleOrderId);
    }

    @Override
    public void deleteSaleOrder(SaleOrder saleOrder) {
        this.saleOrderRepo.deleteSaleOrder(saleOrder);
    }

    @Override
    public void deleteSaleOrder(int saleOrderId) {
        this.saleOrderRepo.deleteSaleOrder(saleOrderId);
    }

    @Override
    public boolean isSaleOrderOwner(User user, User owner) {
        return user.getId().equals(owner.getId());
    }
    
}
