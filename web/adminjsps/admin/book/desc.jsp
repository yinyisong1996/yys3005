<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>

<style type="text/css">
body {
	font-size: 10pt;
	background: rgb(254, 238, 189);
}

div {
	margin: 20px;
	border: solid 2px gray;
	width: 150px;
	height: 150px;
	text-align: center;
}

li {
	margin: 10px;
}
</style>
</head>

<body>
	<div>
		<img width="106" height="150" src="<c:url value='/${book.bimage }'/>" border="0" />
	</div>
	<form style="margin:20px;" id="form"
		action="<c:url value='/adminBookServlet/update'/>" method="post">
		<input type="hidden" name="bid" value="${book.bid }"/>
		Book Name：<input type="text" name="bname" value="${book.bname }" /><br />
		Book Price：$<input type="text" name="price" value="${book.price }" /><br />
<%--		图书作者：<input type="text" name="author" value="${book.auther_name }" /><br />--%>
		Author：<select style="width: 150px; height: 20px;" name="author">
		<c:forEach items="${authorList}" var="author">
			<option value="${author.auther_id }" <c:if test="${author.auther_id eq book.author_id }">selected='selected'</c:if> >${author.auther_name }</option>
		</c:forEach>
	</select><br/>
		Catagory：<select style="width: 150px; height: 20px;" name="cid">
			<c:forEach items="${categoryList }" var="category">
				<option value="${category.cid }" <c:if test="${category.cid eq book.cid }">selected='selected'</c:if> >${category.cname }</option>
     		</c:forEach>
    	</select><br/>
  	<input type="submit" value="Submit"/>
  </form>
	<form action="<c:url value='/adminBookServlet/del'/>" method="post">
		<input type="hidden" name="bid" value="${book.bid }"/>
		<input type="submit" value="Delete" onclick="return confirm('Do you confirm to delete?？');"/>
	</form>

  </body>
</html>
