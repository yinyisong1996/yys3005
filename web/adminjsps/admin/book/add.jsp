<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>

<style type="text/css">
	body {background: rgb(254,238,189);}
</style>
  </head>
  
  <body>
    <h1>Add Books</h1>
    <p style="font-weight: 900; color: red">${msg }</p>
    <form action="<c:url value='/adminBookServlet/add'/>" method="post" enctype="multipart/form-data">
		Book Name：<input style="width: 150px; height: 20px;" type="text" name="bname"/><font color="red">*</font><br/><br/>
		Book Image：<input style="width: 223px; height: 20px;" type="file" name="bimage"/><font color="red">*</font><br/><br/>
		Book Price：<input style="width: 150px; height: 20px;" type="text" name="price"/><font color="red">*</font><br/><br/>
		Book Pages：<input type="text" name="page"><br/><br/>
		ISBN: <input type="text" name="ISBN"><br/><br/>
		Stock Number: <input type="text" name="stock"><br/><br/>
		Author：<select style="width: 150px; height: 20px;" name="author_id"><br/><br/>
		<c:forEach items="${authorList}" var="author">
			<option value="${author.auther_id }" <c:if test="${author.auther_id == 1 }">selected='selected'</c:if> >${author.auther_name }</option>
		</c:forEach>
	</select><br/><br/>
		Catagory：<select style="width: 150px; height: 20px;" name="cid">
    		<c:forEach items="${categoryList }" var="c">
    			<option value="${c.cid }">${c.cname }</option>	
    		</c:forEach>
    	</select>
    	<br/><br/>
    	<input type="submit" value="Add to Books"/>
    </form>
	<style>
		body{text-align:center}
	</style>
  </body>
</html>
