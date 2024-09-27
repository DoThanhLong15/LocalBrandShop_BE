/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.CartDTO;
import com.dtl.components.ErrorResponseUtil;
import com.dtl.pojo.Cart;
import com.dtl.pojo.Product;
import com.dtl.pojo.ProductImage;
import com.dtl.pojo.ProductSize;
import com.dtl.pojo.User;
import com.dtl.service.CartService;
import com.dtl.service.ProductImageService;
import com.dtl.service.ProductService;
import com.dtl.service.ProductSizeService;
import com.dtl.service.UserService;
import java.security.Principal;
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
@RequestMapping("/api/carts")
@CrossOrigin
public class ApiCartController {

    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductSizeService productSizeService;
    @Autowired
    private ProductImageService productImageService;
    @Autowired
    private ErrorResponseUtil errorResponseUtil;

    @GetMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> getCartListByUser(Principal principal, Locale locale) {
        Map<String, Object> response = new HashMap<>();

        User user = this.userService.getUserByUsername(principal.getName());

        List<CartDTO> cartList = this.cartService.getCartListByUser(user.getId())
                .stream()
                .map(cart -> {
                    Integer productId = cart.getProductId().getId();
                    List<ProductImage> imageList = this.productImageService.getProductImagesByProductId(productId);
                    cart.getProductId().setProductImageCollection(imageList);

                    return new CartDTO(cart);
                })
                .collect(Collectors.toList());

        response.put("data", cartList);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> addToCart(@Valid @RequestBody Cart cart,
            BindingResult bindingResult, Principal principal, Locale locale) {
        Map<String, Object> response = new HashMap<>();

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                errors.put(error.getField(), error.getDefaultMessage());
            }
            response.put("error", errors);

            return this.errorResponseUtil.buildErrorResponse(response, locale, HttpStatus.BAD_REQUEST);
        }

        User user = this.userService.getUserByUsername(principal.getName());

        Map<String, String> params = new HashMap<>();
        params.put("userId", user.getId().toString());
        params.put("productId", cart.getProductId().getId().toString());
        List<Cart> oldCart = this.cartService.getCartList(params);
        if (!oldCart.isEmpty()) {
            for (Cart temp : oldCart) {
                if (this.cartService.checkProductInCart(temp, cart)) {
                    return this.errorResponseUtil.buildErrorResponse("cart.hasProduct.errMsg", locale, HttpStatus.BAD_REQUEST);
                }
            }
        }

        ProductSize productSize = this.productSizeService.getProductSizeById(cart.getProductSizeId().getId());
        Product product = this.productService.getProductById(cart.getProductId().getId());

        if (!this.cartService.checkQuantityValid(product, cart)) {
            return this.errorResponseUtil.buildErrorResponse("cart.quantity.invalid.errMsg", locale, HttpStatus.BAD_REQUEST);
        }

        if (!this.cartService.checkPriceValid(product, cart)) {
            return this.errorResponseUtil.buildErrorResponse("cart.price.invalid.errMsg", locale, HttpStatus.BAD_REQUEST);
        }

        cart.setUserId(user);
        this.cartService.saveCart(cart);

        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @DeleteMapping("/{cartId}")
    @CrossOrigin
    public ResponseEntity<Object> deleteCart(@PathVariable(value = "cartId") int cartId, Principal principal, Locale locale) {

        User user = this.userService.getUserByUsername(principal.getName());
        Cart cart = this.cartService.getCartById(cartId);
        
        if(!this.cartService.isCartOwner(user, cart.getUserId())){
            return this.errorResponseUtil.buildErrorResponse("user.permission.deny", locale, HttpStatus.FORBIDDEN);
        }

        this.cartService.deleteCart(cart);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
