<%-- 
    Document   : base
    Created on : Aug 13, 2024, 2:50:38 PM
    Author     : LONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        
        <link rel="stylesheet" href="resources/css/style.css" type="text/css"/>
        <title>
            <tiles:insertAttribute name="title" />
        </title>
    </head>
    <body style="font-family: Arial, sans-serif; background-color: #EBEBEB; margin: 0; padding: 0;">

        <div class="container" style="display: flex; margin-top: 20px; width: 90%;">
            <div class="sidebar" style="width: 20%; padding: 20px; background-color: white; border-radius: 10px; height: 650px; position: relative; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <tiles:insertAttribute name="sidebar" />
            </div>
            <div class="main" style="flex: 1; padding: 0px 20px;">
                <div>
                    <tiles:insertAttribute name="header" />
                </div>
                <div >
                    <tiles:insertAttribute name="content" />
                </div>
            </div>
        </div>

        <tiles:insertAttribute name="footer" />

    </body>
</html>