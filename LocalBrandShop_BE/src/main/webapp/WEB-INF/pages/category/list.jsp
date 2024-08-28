<%-- 
    Document   : list
    Created on : Aug 19, 2024, 7:27:15 PM
    Author     : LONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:url value="/categories/list" var="category_list" />
<c:url value="/categories/form" var="category_form" />


<h1 class="text-center text-primary mt-3">DANH SÁCH DANH MỤC</h1>
<div class="row">
    <div class="col-md-2 col-12 bg-secondary">

        <form action="${category_list}">
            <div class="mb-3 mt-3">
                <label for="kw" class="form-label">Tên danh mục</label>
                <input type="text" class="form-control" id="kw" placeholder="Tên danh mục..." name="q">
            </div>
            <div class="mb-3 mt-3">
                <button class="btn btn-info" type="submit">Tìm kiếm</button>
            </div>
        </form>
    </div>
    <div class="col-md-10 col-12">
        <a class="btn btn-info m-1" href="${category_form}" />Thêm danh mục</a>
        <table class="table table-striped">
            <tr>
                <th>Id</th>
                <th>Tên danh mục</th>
                <th></th>
            </tr>
            <c:forEach items="${categories}" var="category">
                <tr id="category-${category.id}">
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>
                        <a href="${category_form}/${category.id}" class="btn btn-primary">Sửa</a>
                        
                        <c:url value="/categories/${category.id}" var="endpoint" />
                        <button onclick="deleteItem('${endpoint}', ${category.id}, 'category')" class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

        
<script src="<c:url value="/js/Utils.js" />"></script>