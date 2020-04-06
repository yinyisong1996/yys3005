<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <style type="text/css">
        body {background: rgb(254,238,189);}
    </style>
</head>

<body>
<h1>Add Collection</h1>
<p style="font-weight: 900; color: red">${msg }</p>
<form action="<c:url value='/adminCategoryServlet/add'/>" method="post">
    Collection Name：<input type="text" name="cname"/>
    <input type="submit" value="Confirm"/>
</form>
</body>
</html>
