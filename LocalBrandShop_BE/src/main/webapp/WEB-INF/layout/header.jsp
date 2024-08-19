<%-- 
    Document   : header
    Created on : Aug 13, 2024, 2:50:46 PM
    Author     : LONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>


<c:url value="/" var="home"/>
<c:url value="/logout" var="logout"/>
<c:url value="/users/list" var="user_list"/>
<c:url value="/categories/list" var="category_list"/>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${home}">Local Brand Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${category_list}">Danh mục</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${user_list}">Người dùng</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-danger" href="${logout}">
                        Đăng xuất
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>