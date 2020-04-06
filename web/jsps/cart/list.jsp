<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

    <style>
        * {
            font-size: 11pt;
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
    <h1>Shopping Cart</h1>

    <c:choose>
        <c:when test="${empty sessionScope.mycart or fn:length(sessionScope.mycart.allCartItem) eq 0}">
            <img src="<c:url value='/images/cart.png'/>" width="200"/>
            <br>
            <h1>Your shopping cart is empty, let's go shopping!!</h1>
        </c:when>
        <c:otherwise>
            <table border="1" width="100%" cellspacing="0" background="black">
                <tr>
                    <td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
                        <a href="<c:url value='/cartServlet/clearItem'/>">Empty My Cart</a>
                    </td>
                </tr>
                <tr>
                    <th>Image</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Amount</th>
                    <th>Total</th>
                    <th>Edit</th>
                </tr>
                <c:forEach items="${sessionScope.mycart.allCartItem}" var="mycartItem">
                    <tr>
                        <td><div><img width="106" height="150" src="<c:url value='/${mycartItem.book.bimage }'/>"/></div></td>
                        <td>${mycartItem.book.bname }</td>
                        <td>${mycartItem.book.auther_name }</td>
                        <td>$${mycartItem.book.price}</td>
                        <td>${mycartItem.count }</td>
                        <td>$${mycartItem.subtotal}</td>
                        <td><a href="<c:url value='/cartServlet/deleteItem?bid=${mycartItem.book.bid }&count=${mycartItem.count}'/>">Delete</a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
                        Total: $${sessionScope.mycart.total}
                    </td>
                </tr>
                <tr>
                    <td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
<%--                        <a id="buy" href="<c:url value='/orderServlet/addOrder'/>"></a>--%>
                        <form action="<c:url value='/orderServlet/addOrder'/>">
                            <button>Check Out</button>
                        </form>

                    </td>
                </tr>
            </table>

        </c:otherwise>


    </c:choose>













</body>
</html>
