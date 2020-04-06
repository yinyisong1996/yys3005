<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>

<style type="text/css">
	body {background: rgb(254,238,189);}
</style>
  </head>
  
  <body>
    <h1>Edit Collection</h1>
    <form action="<c:url value='/adminCategoryServlet/update'/>" method="post">
    	<input type="hidden" name="cid" value="${category.cid }" />
        Collection Name：<input type="text" name="cname" value="${category.cname }"/>
    	<input type="submit" value="Confirm"/>
    </form>
  </body>
</html>
