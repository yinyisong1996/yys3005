<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML>
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


    </style>
</head>

<body>
<h1>Orders</h1>


<table border="1" width="100%" cellspacing="0" background="black">
    <tr bgcolor="gray" bordercolor="gray">
        <td colspan="6">
            Order Number：${myOrder.oid }　Order Time: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${myOrder.ordertime }"/>　Total Amount: $<font color="red"><b>${myOrder.alltotal }</b></font>
        </td>
    </tr>
    <c:forEach items="${myOrder.orderItemList }" var="orderItem">
        <tr bordercolor="gray" align="center">
            <td width="15%">
                <div><img src="<c:url value='/${orderItem.book.bimage }'/>" height="75"/></div>
            </td>
            <td>Book Name:${orderItem.book.bname }</td>
            <td>Price:$${orderItem.book.price }</td>
            <td>Author:${orderItem.book.auther_name }</td>
            <td>Amount:${orderItem.count }
                <font style="color: red">${orderItem.errorBookNum}</font>
            </td>

            <td>Total: $${orderItem.subtotal }</td>
        </tr>
    </c:forEach>
</table>
<br/>
<form method="post" action="<c:url value='/orderServlet/success'/>" id="form" target="body">
    Shipping Address：<input type="text" name="address" size="50" value="${sessionScope.storeUser.address}"/><br/>
<%--    <input type="hidden" name="method" value="pay"/>--%>
    <input type="hidden" name="oid" value="${myOrder.oid }"/>
    Choose a payment：<br/>
    <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>TD BANK
    <img width="150" height="80" src="<c:url value='/bank_img/TD_BANK.png'/>" align="middle"/>
    <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>RBC BANK
    <img width="150" height="80" src="<c:url value='/bank_img/RBC_BANK.png'/>" align="middle"/><br/><br/>
    <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>CIBC BANK
    <img width="150" height="80" src="<c:url value='/bank_img/CIBC_BANK.png'/>" align="middle"/>
    <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>Wechat Pay
    <img width="150" height="80" src="<c:url value='/bank_img/WECHAT_PAY.png'/>" align="middle"/><br/><br/>
    <button>Confirm My Payment</button>
</form>
<%--<a id="pay" href="javascript:document.getElementById('form').submit();">Confirm My Payment</a>--%>

</body>
</html>

