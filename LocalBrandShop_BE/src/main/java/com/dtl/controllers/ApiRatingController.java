/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.RatingDTO;
import com.dtl.components.ErrorResponseUtil;
import com.dtl.components.HandlePageParam;
import com.dtl.service.ProductService;
import com.dtl.service.RatingService;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LONG
 */
@RestController
@RequestMapping("/api/ratings")
@CrossOrigin
public class ApiRatingController {

    @Autowired
    private RatingService ratingService;
    @Autowired
    private ErrorResponseUtil errorResponseUtil;
    @Autowired
    private ProductService productService;
    @Autowired
    private HandlePageParam handlePageParam;

    @GetMapping("/")
    @CrossOrigin
    public ResponseEntity<Object> getCartListByUser(Principal principal, Locale locale,
            @RequestParam Map<String, String> params) {
        
        Integer page = handlePageParam.handlePage(params);
        Integer pageSize = HandlePageParam.getPAGE_SIZE();
        
        List<RatingDTO> ratingList = this.ratingService.getRatingList(params, page, pageSize)
                .stream()
                .map(rating -> new RatingDTO(rating))
                .collect(Collectors.toList());

        long ratingCount = this.ratingService.countRatings(params);

        Map<String, Object> response = new HashMap<>();
        response.put("data", ratingList);
        handlePageParam.responsePageObject(response, page, pageSize, (int) ratingCount);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
