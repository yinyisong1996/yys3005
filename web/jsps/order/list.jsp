<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>



    <style type="text/css">
        * {
            font-size: 11pt;
        }
        div {
            border: solid 2px gray;
            width: 75px;
            height: 75px;
            text-align: center;
        }
        li {
            margin: 10px;
        }

        #buy {
            background: url(<c:url value='/images/all.png'/>) no-repeat;
            display: inline-block;

            background-position: 0 -902px;
            margin-left: 30px;
            height: 36px;
            width: 146px;
        }
        #buy:HOVER {
            background: url(<c:url value='/images/all.png'/>) no-repeat;
            display: inline-block;

            background-position: 0 -938px;
            margin-left: 30px;
            height: 36px;
            width: 146px;
        }
    </style>
</head>

<body>
<h1>My Orders</h1>

<table border="1" width="100%" cellspacing="0" background="black">
    <c:forEach items="${orderList }" var="order">
        <tr bgcolor="gray" bordercolor="gray">
            <td colspan="6">
                Order Number: ${order.oid }　Order Time:<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.ordertime }"/>　Total Amount: $<font color="red"><b>${order.alltotal }</b></font>　
                <c:choose>
                    <c:when test="${order.state eq 1 }">
                        <a href="<c:url value='/orderServlet/toPay?oid=${order.oid }'/>">Waiting For Payment</a>
                        <br/>
                        <a href="<c:url value='/orderServlet/deleteOrder?oid=${order.oid }'/>">Delete Order</a>
                    </c:when>
                    <c:when test="${order.state eq 2 }">Waiting For Shipment</c:when>
                    <c:when test="${order.state eq 3 }">
                        <a href="<c:url value='/orderServlet/confirm?oid=${order.oid }'/>">Order Delivered!</a>
                    </c:when>
                    <c:when test="${order.state eq 4 }">Order Completed</c:when>
                </c:choose>
            </td>
        </tr>
        <c:forEach items="${order.orderItemList }" var="orderItem">
            <tr bordercolor="gray" align="center">
                <td width="15%">
                    <div><img  src="<c:url value='/${orderItem.book.bimage }'/>" height="75"/></div>
                </td>
                <td>Book Name: ${orderItem.book.bname }</td>
                <td>Price: $${orderItem.book.price }</td>
                <td>Author: ${orderItem.book.auther_name }</td>
                <td>Amount: ${orderItem.count }</td>
                <td>Total: $${orderItem.subtotal }</td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>
</body>
</html>
