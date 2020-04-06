<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <style>
        body {
            font-size: 10pt;
        }
        div {
            margin:20px;
            border: solid 2px gray;
            width: 150px;
            height: 150px;
            text-align: center;
        }
        li {
            margin: 10px;
        }

        .stockNum{
            border: #FF5722 solid 2px;
        }


    </style>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <img width="106" height="150" src="<c:url value='/${bookMsg.bimage}'/>" border="0"/>
    </div>
    <ul>
        <li>Book Name: ${bookMsg.bname }</li>
        <li>ISBN: ${bookMsg.ISBN }</li>
        <li>Author: ${bookMsg.auther_name }</li>
        <li>Price: $${bookMsg.price }</li>
        <li class="stockNum" style="width: 200px">In Stock：${bookMsg.stock}</li>
    </ul>
    <form id="form" action="<c:url value='/cartServlet/addItem'/>" method="post">
<%--        <input type="hidden" name="method" value="add"/>--%>
        <input type="hidden" name="bid" value="${bookMsg.bid }"/>
        <input type="text" size="3" name="count" value="1"/>
        <button>Add to Cart</button>
    </form>
    <h4 style="color: red">${requestScope.errorNum}</h4>
    <h3 style="color: red">${errorStoreUser}</h3>
<%--    <a href="javascript:document.getElementById('form').submit();">Add to Cart</a>--%>

</body>
</html>
