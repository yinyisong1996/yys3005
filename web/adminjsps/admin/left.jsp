<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


    <script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
    <script language="javascript">
        var bar1 = new Q6MenuBar("bar1", "Ultimate BookStore");
        function load() {
            bar1.colorStyle = 2;
            bar1.config.imgDir = "<c:url value='/menu/img/'/>";
            bar1.config.radioButton=false;
            bar1.add("Catagory Admin", "View Catagories", "<c:url value='/adminCategoryServlet/list'/>", "body");
            bar1.add("Catagory Admin", "Add Catagories", "<c:url value='/adminjsps/admin/category/add.jsp'/>", "body");

            bar1.add("Book Admin", "View Books", "<c:url value='/adminBookServlet/list'/>", "body");
            bar1.add("Book Admin", "Add Books", "<c:url value='/adminBookServlet/addPre'/>", "body");



            var d = document.getElementById("menu");
            d.innerHTML = bar1.toString();
        }
    </script>

</head>

<body onload="load()" style="margin: 0px; background: #87CECB;">
<div id="menu"></div>

</body>
</html>
