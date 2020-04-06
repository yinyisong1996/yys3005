
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</div>
<form action="${pageContext.request.contextPath}/regist" method="post">
    <h2>Username: <input type="text" name="username"><br/><br/></h2>
    <h2>Nickname:  <input type="text" name="account_name"><br/><br/></h2>
    <h2>password:  <input type="password" name="password"><br/><br/></h2>
    <h2> Sex:  <input type="radio" name="gener" value="1">Male</h2>
    <h2>   <input type="radio" name="gener" value="0">Female </h2>
    <br/><br/>
    <h2>Phone:  <input type="text" name="phone"><br/><br/> </h2>
    <h2>Email:  <input type="text" name="email"><br/><br/> </h2>
    <h2>Address <input type="text" name="address"><br/><br/> </h2>
    <h2><button>Submit</button> </h2>
</form>

<body  style="text-align:center;">

<div style="margin-right:auto;margin-left:auto;"></div>

</body>


</body>
</html>
