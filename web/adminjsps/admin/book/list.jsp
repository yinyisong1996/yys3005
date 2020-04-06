<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>

<style type="text/css">
	body {
		font-size: 10pt;
		background: rgb(254,238,189);
	}
	.icon {
		margin:10px;
		border: solid 2px gray;
		width: 160px;
		height: 190px;
		text-align: center;
		float: left;
	}
</style>
  </head>
  
  <body>
  <c:forEach items="${bookList }" var="book">
      <c:if test="${book.del == 0 }">
          <div class="icon">
              <a href="<c:url value='/adminBookServlet/load?bid=${book.bid }'/>"><img width="106" height="150" src="<c:url value='/${book.bimage }'/>" border="0"/></a>
              <br/>
              <a href="<c:url value='/adminBookServlet/load?bid=${book.bid }'/>">${book.bname }</a>
          </div>
      </c:if>

  </c:forEach>
  </body>
 
</html>

