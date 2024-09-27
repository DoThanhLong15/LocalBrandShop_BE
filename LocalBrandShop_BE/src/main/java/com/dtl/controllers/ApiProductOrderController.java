/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.OrderDetailDTO;
import com.dtl.DTO.SaleOrderDTO;
import com.dtl.components.ErrorResponseUtil;
import com.dtl.components.TimeCheckUtil;
import com.dtl.pojo.Cart;
import com.dtl.pojo.OrderDetail;
import com.dtl.pojo.ProductImage;
import com.dtl.pojo.ProductQuantity;
import com.dtl.pojo.SaleOrder;
import com.dtl.pojo.SaleOrderStatus;
import com.dtl.pojo.User;
import com.dtl.service.CartService;
import com.dtl.service.OrderDetailService;
import com.dtl.service.ProductImageService;
import com.dtl.service.ProductQuantityService;
import com.dtl.service.SaleOrderService;
import com.dtl.service.UserService;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LONG
 */
@RestController
@RequestMapping("/api/sale-orders")
@CrossOrigin
public class ApiProductOrderController {

    @Autowired
    private SaleOrderService saleOrderService;
    @Autowired
    private ErrorResponseUtil errorResponseUtil;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductImageService productImageService;
    @Autowired
    private ProductQuantityService productQuantityService;

    @GetMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> getSaleOrderList(Principal principal, Locale locale) {
        Map<String, Object> response = new HashMap<>();

        User user = this.userService.getUserByUsername(principal.getName());

        Map<String, String> params = new HashMap<>();
        params.put("userId", user.getId().toString());
        List<SaleOrderDTO> saleOrderList = this.saleOrderService.getSaleOrderList(params)
                .stream()
                .map(saleOrder -> {
                    return new SaleOrderDTO(saleOrder);
                }).collect(Collectors.toList());

        response.put("data", saleOrderList);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @GetMapping("/{saleOrderId}")
    @CrossOrigin
    public ResponseEntity<Object> getOrderDetail(Principal principal, Locale locale,
            @PathVariable(value = "saleOrderId") Integer saleOrderId) {
        Map<String, Object> response = new HashMap<>();

        User user = this.userService.getUserByUsername(principal.getName());
        SaleOrder saleOrder = this.saleOrderService.getSaleOrderById(saleOrderId);

        if (!this.saleOrderService.isSaleOrderOwner(user, saleOrder.getUserId())) {
            return this.errorResponseUtil.buildErrorResponse("user.permission.deny", locale, HttpStatus.FORBIDDEN);
        }

        SaleOrderDTO saleOrderDTO = new SaleOrderDTO(saleOrder);

        Map<String, String> params = new HashMap<>();
        params.put("saleOrderId", saleOrderId.toString());
        List<OrderDetailDTO> orderDetailList = this.orderDetailService.getOrderDetailList(params)
                .stream()
                .map(orderDetail -> {
                    Integer productId = orderDetail.getProductId().getId();
                    List<ProductImage> imageList = this.productImageService.getProductImagesByProductId(productId);
                    orderDetail.getProductId().setProductImageCollection(imageList);

                    return new OrderDetailDTO(orderDetail);
                })
                .collect(Collectors.toList());

        saleOrderDTO.setOrderDetailList(orderDetailList);

        response.put("data", saleOrderDTO);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> addReceipt(@Valid @RequestBody SaleOrderDTO saleOrderDTO,
            BindingResult bindingResult, Principal principal, Locale locale) {

        Map<String, Object> response = new HashMap<>();

        User user = this.userService.getUserByUsername(principal.getName());

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                errors.put(error.getField(), error.getDefaultMessage());
            }
            response.put("error", errors);

            return this.errorResponseUtil.buildErrorResponse(response, locale, HttpStatus.BAD_REQUEST);
        }

        SaleOrder saleOrder = new SaleOrder();
        saleOrder.setAddress(saleOrderDTO.getAddress());
        saleOrder.setOrderStatusId(new SaleOrderStatus(1)); // NOT DO

        List<Cart> cartList = new ArrayList<>();
        List<OrderDetail> orderDetailList = saleOrderDTO.getOrderDetailList()
                .stream()
                .map(orderDetailDTO -> {
                    Cart cart = this.cartService.getCartById(orderDetailDTO.getId());
                    cartList.add(cart);

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setPrice(cart.getPrice());
                    orderDetail.setQuantity(cart.getQuantity());
                    orderDetail.setProductId(cart.getProductId());
                    orderDetail.setProductSizeId(cart.getProductSizeId());
                    orderDetail.setSaleOrderId(saleOrder);

                    return orderDetail;
                }).collect(Collectors.toList());
        saleOrder.setOrderDetailCollection(orderDetailList);
        saleOrder.setUserId(user);

        this.saleOrderService.saveSaleOrder(saleOrder);

        cartList.forEach(cart -> {
            ProductQuantity productQuantity = this.productQuantityService
                    .getProductQuantity(cart.getProductId().getId(), cart.getProductSizeId().getId());

            Integer currentQuantity = productQuantity.getQuantity();
            productQuantity.setQuantity(currentQuantity - cart.getQuantity());
            this.productQuantityService.saveProductQuantity(productQuantity);

            this.cartService.deleteCart(cart);
        });

        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @DeleteMapping("/{saleOrderId}")
    @CrossOrigin
    public ResponseEntity<Object> deleteCart(@PathVariable(value = "saleOrderId") Integer saleOrderId,
            Principal principal, Locale locale) {

        User user = this.userService.getUserByUsername(principal.getName());
        SaleOrder saleOrder = this.saleOrderService.getSaleOrderById(saleOrderId);

        if (!this.saleOrderService.isSaleOrderOwner(user, saleOrder.getUserId())) {
            return this.errorResponseUtil.buildErrorResponse("user.permission.deny", locale, HttpStatus.FORBIDDEN);
        }
        
        if(!TimeCheckUtil.isWithinLast24Hours(saleOrder.getCreatedDate())){
            return this.errorResponseUtil.buildErrorResponse("saleOrder.delete.deny.errMsg", locale, HttpStatus.BAD_REQUEST);
        }

        this.saleOrderService.deleteSaleOrder(saleOrder);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
