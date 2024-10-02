<%-- 
    Document   : header
    Created on : Aug 13, 2024, 2:50:46 PM
    Author     : LONG
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<!--<div class="menu-bar">
    <div class="menu-title">Tiêu đề</div>
    <div class="user-info">
        <div class="user-name">Tên người dùng</div>
        <img src="avatar.jpg" alt="User Avatar" class="user-avatar">
    </div>
</div>-->

<!--Đây là do tui không còn lựa chọn nào khác!-->
<div class="menu-bar" style="
     display: flex;
     justify-content: space-between;
     align-items: center;
     width: 100%;
     height: 80px;
     background-color: white;
     border-radius: 10px;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
     padding: 0 20px;
     margin: 0px auto;
     margin-bottom: 20px;">
    <div class="menu-title" style="
         font-weight: bold;
         color: #0900B3;
         font-size: 30px;">Admin site</div>
    <div class="user-info" style="display: flex;
         align-items: center;">
        <div class="user-name" style="
             color: black;
             margin-right: 15px;
             font-size: 17px;
             font-weight:bold;
             ">Xin chao Admin!</div>
        <img src="https://res.cloudinary.com/dxfewpnlk/image/upload/v1727789342/fvvzv7d7y74afod8uhyt.jpg" alt="User Avatar" class="user-avatar" style="width: 50px;
             height: 50px;
             border-radius: 50%;">
    </div>
</div>
