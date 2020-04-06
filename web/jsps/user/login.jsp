
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


</head>
<body>
<h1>Please Enter Username and Password</h1>
    <form action="${pageContext.request.contextPath}/login" method="post" >
        Username：<input type="text" name="username"><br>
        Password：<input type="text" name="password"><br>
        <button>Login In</button>
    </form>

<body  style="text-align:center;">

<div style="margin-right:auto;margin-left:auto;"></div>

</body>



</body>
</html>
