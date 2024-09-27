/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.DTO;

import com.dtl.pojo.SaleOrder;
import java.util.Date;
import java.util.List;
import javax.validation.constraints.NotNull;

/**
 *
 * @author LONG
 */
public class SaleOrderDTO {

    private Integer id;
    private Date createdDate;
    private Date updatedDate;
    @NotNull(message = "{saleOrder.address.notNull.errMsg}")
    private String address;
    private String status;
    @NotNull(message = "{saleOrder.order.notNull.errMsg}")
    private List<OrderDetailDTO> orderDetailList;

    public SaleOrderDTO() {

    }

    public SaleOrderDTO(SaleOrder saleOrder) {
        this.id = saleOrder.getId();
        this.createdDate = saleOrder.getCreatedDate();
        this.updatedDate = saleOrder.getUpdatedDate();
        this.address = saleOrder.getAddress();
        this.status = saleOrder.getOrderStatusId().getStatus();
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the createdDate
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     * @param createdDate the createdDate to set
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    /**
     * @return the updatedDate
     */
    public Date getUpdatedDate() {
        return updatedDate;
    }

    /**
     * @param updatedDate the updatedDate to set
     */
    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the orderDetailList
     */
    public List<OrderDetailDTO> getOrderDetailList() {
        return orderDetailList;
    }

    /**
     * @param orderDetailList the orderDetailList to set
     */
    public void setOrderDetailList(List<OrderDetailDTO> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }
}
