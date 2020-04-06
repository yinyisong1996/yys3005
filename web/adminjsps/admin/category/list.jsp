<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <style type="text/css">
        body {background: rgb(254,238,189);}
        table {font-family: 宋体; font-size: 11pt; border-color: rgb(78,78,78);  width: 60%;}
        #th {background: rgb(78,78,78);}
    </style>
</head>

<body>
<h2 style="text-align: center;">Catagories</h2>
<table align="center" border="1" cellpadding="0" cellspacing="0">
    <tr id="th" bordercolor="rgb(78,78,78)">
        <th>Collection Name</th>
        <th>To-Do</th>
    </tr>
    <c:forEach items="${categoryList }" var="c">
        <tr bordercolor="rgb(78,78,78)">
            <td>${c.cname }</td>
            <td>
                <a href="<c:url value='/adminCategoryServlet/queryByCid?cid=${c.cid }'/>">Edit</a> |
                <a onclick="return confirm('Do you confirm to delete?')" href="<c:url value='/adminCategoryServlet/del?cid=${c.cid }'/>">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
