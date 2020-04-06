<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center; font-size: 30pt;">Ultimate BookStore</h1>
<div style="font-size: 11pt;">
    <c:choose>
        <c:when test="${empty sessionScope.storeUser.uid }">
            <h3><a href="${pageContext.request.contextPath}/login" target="_parent">Log In</a></h3>
            <h3><a href="${pageContext.request.contextPath}/toRegist" target="_parent">Sign Up</a></h3>
<%--            <a href="${pageContext.request.contextPath}/toLoginView" target="_parent">Login</a>--%>
<%--            <a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">Login</a> |&nbsp;--%>
<%--            <a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">Register</a>--%>
        </c:when>
        <c:otherwise>
            <h3>Hello!: ${sessionScope.storeUser.uname }&nbsp;|&nbsp;</h3>>
            <a href="<c:url value='/jsps/cart/list.jsp'/>" target="body">My Cart</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="<c:url value='/orderServlet/query'/>" target="body">My Orders</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/exit" target="_parent">Log out</a>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
