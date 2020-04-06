
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book List</title>

    <style>
        body {
            font-size: 10pt;
        }
        .icon {
            margin:10px;
            border: solid 2px gray;
            width: 160px;
            height: 180px;
            text-align: center;
            float: left;
        }
    </style>

</head>

<body>
    <c:forEach items="${bookList}" var="book">
        <c:if test="${book.del==0}">
            <div class="icon">
                <a href="<c:url value='/bookServlet/load?bid=${book.bid}'/>"><img width="106" height="150" src="<c:url value='/${book.bimage}'/>" border="0"/></a>
                <br/>
                <a href="<c:url value='/bookServlet/load?bid=${book.bid}'/>">${book.bname}</a>
            </div>
        </c:if>

    </c:forEach>

</body>
</html>
