
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>

    <form action="<c:url value='/adminServlet/toView'/>" method="post">
        <br/>  <br/>  <br/>  <br/>  <br/>  <br/>  <br/>
        <h1>Admin Login: <input type="text" name="username" value=""/><br/></h1>
        <h1>Password: <input type="password" name="password"/><br/></h1>
       <button>Enter Admin Page</button>
    </form>
    <style>
        body{text-align:center}
    </style>
</body>
</html>
