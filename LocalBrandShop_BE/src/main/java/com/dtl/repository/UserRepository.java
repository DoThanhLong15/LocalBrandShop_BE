/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.repository;

import com.dtl.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface UserRepository {
    User getUserByUsername(String username);

    void addOrUpdateUser(User user);

    List<User> getUsers(Map<String, String> params);
    
    User getUserById(int id);
}
