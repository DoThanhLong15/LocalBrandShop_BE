<%-- 
    Document   : form
    Created on : Aug 19, 2024, 7:27:10 PM
    Author     : LONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/categories/form/save" var="action" />

<div style="background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px;">
    <h1 style="color: #000; margin-bottom: 20px;">Quản lý danh mục</h1>

    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">
            ${errMsg}
        </div>
    </c:if>
    <form:form method="post" action="${action}" modelAttribute="category" enctype="multipart/form-data">
        <form:errors path="*" element="div" cssClass="alert alert-danger" />

        <div class="mb-3 mt-3">
            <label for="name" class="form-label">Tên danh mục</label>
            <form:input path="name" type="text" class="form-control" id="name" placeholder="Tên danh mục..." name="name" />
        </div>
        <div class="mb-3 mt-3">
            <label for="description" class="form-label">Mô tả</label>
            <form:input path="description" type="text" class="form-control" id="description" placeholder="Mô tả..." name="description"/>
        </div>
        <div class="mb-3 mt-3">
            <form:hidden path="id" />
            <button class="btn btn-success" type="submit">
                <c:choose>
                    <c:when test="${category.id != null}">
                        Cập nhật
                    </c:when>
                    <c:otherwise>
                        Thêm
                    </c:otherwise>
                </c:choose>
            </button>
        </div>
    </form:form>
</div>