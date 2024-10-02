<%-- 
    Document   : list
    Created on : Aug 13, 2024, 9:40:53 PM
    Author     : LONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:url value="/users/list" var="user_list" />
<c:url value="/users/form" var="user_form" />

<div style="background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px;">
    <h1 style="color: #000; margin-bottom: 20px;">Danh sách khách hàng</h1>
    <div class="row">
        <div class="col-md-2 col-12 bg-secondary">

            <form action="${user_list}">
                <div class="mb-3 mt-3">
                    <label for="kw" class="form-label">Tên người dùng</label>
                    <input type="text" class="form-control" id="kw" placeholder="Tên người dùng..." name="q">
                </div>
                <div class="mb-3 mt-3">
                    <button class="btn btn-info" type="submit">Tìm kiếm</button>
                </div>
            </form>
        </div>
        <div class="col-md-10 col-12">
            <a class="btn btn-info m-1" href="${user_form}" />Thêm người dùng</a>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Tên người dùng</th>
                    <th>Vai trò</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr id="user-${user.id}">
                        <td>${user.id}</td>
                        <td>${user.lastName} ${user.firstName}</td>
                        <td>${user.role}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.active == true}">
                                    <button class="btn btn-success">On</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-danger">Off</button>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${user_form}/${user.id}" class="btn btn-primary">Sửa</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>