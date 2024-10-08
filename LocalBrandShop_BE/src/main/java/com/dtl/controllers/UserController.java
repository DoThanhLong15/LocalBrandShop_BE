/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.controllers;

import com.dtl.pojo.User;
import com.dtl.service.UserService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author LONG
 */
@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String userList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("users", this.userService.getUsers(params));

        return "userList";
    }
    
    @GetMapping("/form")
    public String userForm(Model model) {
        model.addAttribute("user", new User());

        return "userForm";
    }

    @GetMapping("/form/{userId}")
    public String detailsView(Model model, @PathVariable(value = "userId") int id) {
        model.addAttribute("user", this.userService.getUserById(id));

        return "userForm";
    }

    @PostMapping("/form/save")
    public String userForm(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult rs) {
        System.out.println(user);
        if(user.getRole() == null || user.getRole().isEmpty()){
            user.setRole("ROLE_USER");
        }
        
        if (rs.hasErrors()) {
            return "userForm";
        }

        try {
            this.userService.addOrUpdateUser(user);
            
            return "redirect:/users/list";
        } catch (Exception ex) {
            model.addAttribute("errMsg", ex.getMessage());
        }

        return "userForm";
    }
}
