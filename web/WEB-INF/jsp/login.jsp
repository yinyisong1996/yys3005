
<%@ page contentType="text/html;charset=UTF-8" language="java" %>.
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
</head>
<body style="background: lightblue">
<h1>Login Page</h1>

<form action="${pageContext.request.contextPath}/login" method="post">
    Username: <input type="text" name="username"><br/><br/>
    Password: <input type="password" name="password"><br/><br/>
    <h2><button>Log In</button></h2>
</form>
<style>
    body{text-align:center}
</style>
</body>

</html>
