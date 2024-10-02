<%-- 
    Document   : form
    Created on : Aug 19, 2024, 7:22:05 PM
    Author     : LONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/products/form/save" var="action" />

<div style="background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); padding: 20px;">
<h1 style="color: #000; margin-bottom: 20px;">Quản lý sản phẩm</h1>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>
<form:form method="post" action="${action}" modelAttribute="product" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />

    <div class="mb-3 mt-3">
        <label for="name" class="form-label">Tên sản phẩm</label>
        <form:input path="name" type="text" class="form-control" id="name" placeholder="Tên sản phẩm..." name="name" />
    </div>
    <div class="mb-3 mt-3">
        <label for="description" class="form-label">Mô tả</label>
        <form:textarea path="description" type="text" class="form-control" id="description" placeholder="Mô tả..." name="description" rows="4"/>
    </div>
    <div class="mb-3 mt-3">
        <label for="price" class="form-label">Giá sản phẩm (VNĐ)</label>
        <form:input path="price" type="number" class="form-control" id="price" placeholder="Giá sản phẩm..." name="price" min="0"/>
    </div>
    <div class="mb-3 mt-3">
        <label for="categoryId" class="form-label">Danh mục </label>
        <form:select class="form-select" path="categoryId" id="categoryId">
            <option value="noCate" disabled selected>Chọn danh mục</option>
            <c:forEach items="${categories}" var="category">
                <c:choose>
                    <c:when test="${category.id == product.categoryId.id}">
                        <option value="${category.id}" selected>${category.name}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${category.id}">${category.name}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3 mt-3">
        <label>Số lượng theo size</label>
        <c:choose>
            <c:when test="${product.id != null}">
                <c:forEach items="${product.productQuantityCollection}" varStatus="status" var="pgForm">
                    <div class="container mb-3 mt-3">
                        <label class="col-1">${pgForm.sizeId.size}</label>
                        <form:hidden path="productQuantityCollection[${status.index}].id"/>
                        <form:input path="productQuantityCollection[${status.index}].quantity" min="0" type="number"/>
                        
                        <form:hidden path="productQuantityCollection[${status.index}].productId"/>
                        
                        <form:hidden path="productQuantityCollection[${status.index}].sizeId.id"/>
                        <form:hidden path="productQuantityCollection[${status.index}].sizeId.size"/>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <c:forEach items="${product.productQuantityForms}" varStatus="status" var="pgForm">
                    <div class="container mb-3 mt-3">
                        <label class="col-1">${pgForm.sizeName}</label>
                        <form:input path="productQuantityForms[${status.index}].quantity" min="0" type="number"/>
                        <form:hidden path="productQuantityForms[${status.index}].sizeId"/>
                        <form:hidden path="productQuantityForms[${status.index}].sizeName"/>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${product.id != null}">
        <div class="mb-3 mt-3">
            <label>Ảnh sản phẩm</label>
            <div class="container d-flex align-items-center">
                <c:forEach items="${product.productImageCollection}" varStatus="status" var="productImage">
                    <div class="p-1 col-1">
                        <img src="${productImage.image}" width="100%"/>
                        <form:hidden path="productImageCollection[${status.index}].id"/>
                        <form:hidden path="productImageCollection[${status.index}].image"/>
                        <form:hidden path="productImageCollection[${status.index}].productId"/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <div class="mb-3 mt-3">
        <label>Thêm ảnh</label>
        <div class="dropzone mb-3 mt-3" id="productImagesDropzone"></div>
        <form:input path="files" type="file" id="files" name="files" multiple="true" hidden="true"/>
    </div>
    <div class="mb-3 mt-3">
        <form:hidden path="id" />
        <form:hidden path="rating" />
        <form:hidden path="ratingCount" />
        <button class="btn btn-success" type="submit">
            <c:choose>
                <c:when test="${product.id != null}">
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
<!--<script src="<c:url value="/js/UploadImage.js" />"></script>-->
<script>
    Dropzone.autoDiscover = false;

    let productImagesDropzone = new Dropzone("#productImagesDropzone", {
        url: "#", // URL upload
        paramName: "files", // Tên của trường file
        maxFilesize: 2, // Giới hạn kích thước file (MB)
        acceptedFiles: "image/*", // Chỉ chấp nhận các file hình ảnh
        autoProcessQueue: false, // Không tự động upload, để khi submit form mới upload
        addRemoveLinks: true, // Thêm link để xóa ảnh
        init: function () {
            let myDropzone = this;

            // Khi form submit, process queue của Dropzone trước
            document.querySelector("form").addEventListener("submit", function (e) {
                e.preventDefault();
                e.stopPropagation();

                let fileInput = document.getElementById("files");
                let dataTransfer = new DataTransfer();

                myDropzone.getAcceptedFiles().forEach(function (file) {
                    dataTransfer.items.add(file);
                });

                fileInput.files = dataTransfer.files;

                this.submit();
            });

            // Sau khi tất cả ảnh được upload, submit form
            myDropzone.on("queuecomplete", function () {
                document.querySelector("form").submit();
            });

            // Xử lý lỗi
            myDropzone.on("error", function (file, response) {
                console.log("Error uploading file");
            });
        }
    });
</script>
