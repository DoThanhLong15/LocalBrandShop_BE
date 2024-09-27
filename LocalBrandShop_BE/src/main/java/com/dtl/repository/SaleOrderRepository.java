/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.repository;

import com.dtl.pojo.SaleOrder;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface SaleOrderRepository {

    void saveSaleOrder(SaleOrder saleOrder);

    List<SaleOrder> getSaleOrderList(Map<String, String> params);

    SaleOrder getSaleOrderById(int saleOrderId);

    void deleteSaleOrder(SaleOrder saleOrder);

    void deleteSaleOrder(int saleOrderId);
}
