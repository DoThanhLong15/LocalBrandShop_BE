/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.DTO.UserDTO;
import com.dtl.components.ErrorResponseUtil;
import com.dtl.components.JwtService;
import com.dtl.pojo.User;
import com.dtl.service.UserService;
import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LONG
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {

    @Autowired
    private JwtService jwtService;
    @Autowired
    private UserService userService;
    @Autowired
    private ErrorResponseUtil errorResponseUtil;

    @PostMapping("/login")
    @CrossOrigin
    public ResponseEntity<Object> login(@RequestBody User user, Locale locale) {
        Map<String, Object> response = new HashMap<>();

        if (this.userService.authUser(user.getUsername(), user.getPassword()) == true) {
            String token = this.jwtService.generateTokenLogin(user.getUsername());
            response.put("token", token);

            return new ResponseEntity<>(response, HttpStatus.OK);
        }

        return this.errorResponseUtil.buildErrorResponse("user.login.fail.errMsg", locale, HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/register",
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE}, 
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @CrossOrigin
    public ResponseEntity<Object> register(@Valid @ModelAttribute User user, BindingResult bindingResult, Locale locale) {
        Map<String, Object> response = new HashMap<>();

        if (bindingResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                errors.put(error.getField(), error.getDefaultMessage());
            }
            response.put("error", errors);

            return this.errorResponseUtil.buildErrorResponse(response, locale, HttpStatus.BAD_REQUEST);
        }

        try {
            user.setRole("ROLE_USER");
            this.userService.addOrUpdateUser(user);

            return new ResponseEntity<>(HttpStatus.CREATED);
        } catch (Exception ex) {
            System.out.println(ex.getCause().getMessage());
            String exception = ex.getCause().getMessage();

            if (exception.contains("email")) {
                return errorResponseUtil.buildErrorResponse("user.email.exist.errMsg", locale, HttpStatus.BAD_REQUEST);
            }

            if (exception.contains("username")) {
                return errorResponseUtil.buildErrorResponse("user.username.exist.errMsg", locale, HttpStatus.BAD_REQUEST);
            }
            
            return errorResponseUtil.buildErrorResponse("system.errMsg", locale, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping(path = "/users/current-user", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin(origins = "http://localhost:3000", allowCredentials = "true")
    public ResponseEntity<Object> getCurrentUser(Principal user) {
        UserDTO u = new UserDTO(this.userService.getUserByUsername(user.getName()));

        return new ResponseEntity<>(u, HttpStatus.OK);
    }
}
