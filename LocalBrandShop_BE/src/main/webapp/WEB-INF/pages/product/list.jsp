<%-- 
    Document   : list
    Created on : Aug 19, 2024, 7:22:19 PM
    Author     : LONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:url value="/products/list" var="product_list" />
<c:url value="/products/form" var="product_form" />


<h1 class="text-center text-primary mt-3">DANH SÁCH SẢN PHẨM</h1>
<div class="row">
    <div class="col-md-2 col-12 bg-secondary">

        <form action="${product_list}">
            <div class="mb-3 mt-3">
                <label for="kw" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" id="kw" placeholder="Tên sản phẩm..." name="q">
            </div>
            <div class="mb-3 mt-3">
                <label for="fromPrice" class="form-label">Từ giá (VNĐ):</label>
                <input type="number" class="form-control" id="fromPrice" placeholder="Từ giá..." name="fromPrice">
            </div>
            <div class="mb-3 mt-3">
                <label for="toPrice" class="form-label">Đến giá (VNĐ):</label>
                <input type="number" class="form-control" id="toPrice" placeholder="Đến giá..." name="toPrice">
            </div>
            <div class="mb-3 mt-3">
                <label for="cateId" class="form-label">Danh mục</label>
                <select class="form-select" name="cateId" id="cateId">
                    <option value="all" selected disabled>Chọn danh mục</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3 mt-3">
                <button class="btn btn-info" type="submit">Tìm kiếm</button>
            </div>
        </form>
    </div>
    <div class="col-md-10 col-12">
        <a class="btn btn-info m-1" href="${product_form}" />Thêm sản phẩm</a>
        <table class="table table-striped">
            <tr>
                <th>Id</th>
                <th>Tên sản phẩm</th>
                <th></th>
            </tr>
            <c:forEach items="${products}" var="product">
                <tr id="category-${product.id}">
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>
                        <a href="${product_form}/${product.id}" class="btn btn-primary">Sửa</a>

                        <c:url value="/api/products/${product.id}" var="endpoint" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<script src="<c:url value="/js/Utils.js" />"></script>