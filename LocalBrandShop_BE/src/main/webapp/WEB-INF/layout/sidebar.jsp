<%-- 
    Document   : sidebar
    Created on : Oct 1, 2024, 11:46:51 AM
    Author     : nhanl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>


<c:url value="/" var="home"/>
<c:url value="/logout" var="logout"/>
<c:url value="/users/list" var="user_list"/>
<c:url value="/categories/list" var="category_list"/>
<c:url value="/products/list" var="product_list"/>
<c:url value="/stats" var="stats"/>

<!--<h2>Local <span class="brand">Brand</span> Shop</h2>
<div>
    <ul>
        <li><a href="#">Bảng điều khiển</a></li>
        <li><a href="$.{product_list}">Sản phẩm</a></li>
        <li><a href="$.{category_list}">Danh mục</a></li>
        <li><a href="$.{user_list}">Người dùng</a></li>
        <li><a href="#">Hóa đơn</a></li>
    </ul>
    <a href="$.{logout}" class="logout">Đăng xuất</a>
</div>-->


<h2 style="text-align: center; color: #333; font-weight: bold;">Local <span class="brand" style="color: red;">Brand</span> Shop</h2>
<div>
    <ul style="list-style-type: none; padding: 0; margin: 0;">
        <li style="margin: 30px 0; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
            <a href="${stats}" style="text-decoration: none; color: #333; font-size: 25px; font-weight: bold;">Bảng điều khiển</a></li>
        <li style="margin: 30px 0; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
            <a href="${product_list}" style="text-decoration: none; color: #333; font-size: 25px; font-weight: bold;">Sản phẩm</a></li>
        <li style="margin: 30px 0; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
            <a href="${category_list}" style="text-decoration: none; color: #333; font-size: 25px; font-weight: bold;">Danh mục</a></li>
        <li style="margin: 30px 0; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
            <a href="${user_list}" style="text-decoration: none; color: #333; font-size: 25px; font-weight: bold;">Người dùng</a></li>
        <li style="margin: 30px 0; padding: 5px 10px; border-radius: 5px; cursor: pointer;">
            <a href="#" style="text-decoration: none; color: #333; font-size: 25px; font-weight: bold;">Hóa đơn</a></li>
    </ul>
            <a href="${logout}" class="logout" style="text-decoration: none; width: 70%; margin-top: 30px; bottom: 30px; padding: 10px 20px; background-color: white; color: black; border: none; border-radius: 5px; cursor: pointer; position: absolute; font-size: 25px;"
       >Đăng xuất</a>
</div>