<%-- 
    Document   : 
    Created on : Sep 30, 2024, 5:51:24 PM
    Author     : nhanl
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<c:url value="/products/list" var="product_list" />
<c:url value="/products/form" var="product_form" />

<div class="content maincontent">
    <h1>Danh sách sản phẩm</h1>
    <div class="search-bar maincontent">
        <form action="${product_list}">
            <input type="text" id="kw" placeholder="Tìm sản phẩm..." name="q">
            <button class="search-btn maincontent" type="submit">Tìm</button>
        </form>
        <a href="${product_form}"><button class="add-btn maincontent" >Thêm</button></a>
    </div>

    <table class="maincontent">
        <thead>
            <tr>
                <th>Tên cột 1</th>
                <th>Tên cột 2</th>
                <th>Tên cột 3</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Dữ liệu 1</td>
                <td>Dữ liệu 2</td>
                <td>Dữ liệu 3</td>
                <td>
                    <button class="edit-btn maincontent">Sửa</button>
                    <button class="delete-btn maincontent">Xóa</button>
                </td>
            </tr>
            <!-- Thêm các dòng dữ liệu khác ở đây -->
        </tbody>
    </table>
    <div class="pagination maincontent">
        <button>&lt;</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>&gt;</button>
    </div>
</div>

<script src="<c:url value="/js/Utils.js" />"></script>




