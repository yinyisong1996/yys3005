
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base target="body"/>
    <style> .myClass{
        margin-top: 10px;
    }</style>
</head>
<body>
    <h3>Book Index</h3>
    <div>
        <form action="<c:url value='/bookServlet/search'/>" method="post">
            <input type="text" name="search">
            <button>Search</button>
        </form>
    </div>
    <div>
        <a href="<c:url value='/bookServlet/list'/>">All Catagories</a> <br/>
    </div>
    <c:forEach items="${categoryList}" var="category">
        <div class="myClass">
            <a href="<c:url value='/bookServlet/query?cid=${category.cid}'/>">${category.cname}</a> <br/>
        </div>
    </c:forEach>
</body>
</html>
