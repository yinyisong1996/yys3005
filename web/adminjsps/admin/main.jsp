
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>


    <style type="text/css">
        *{
            font-size:10pt;
        }
        body{
            text-align:center;
            margin: 0px;
        }
        .table{
            width:100%;
            height:100%;
            border:1px solid gray;
            border-collapse: collapse;
        }
        .table td{
            border:1px solid gray;
        }
        iframe {
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
<table class="table" align="center">
    <tr style="background:#4682B4; height: 120px; ">
        <td colspan="2" align="center">
            <iframe frameborder="0" src="<c:url value='/adminjsps/admin/top.jsp'/>" name="top"></iframe>
        </td>
    </tr>
    <tr>
        <td width="265" style="padding:5px;" align="center" valign="top">
            <iframe frameborder="0" width="120" src="<c:url value='/adminjsps/admin/left.jsp'/>" name="left"></iframe>
        </td>
        <td>
            <iframe frameborder="0" src="<c:url value='/adminjsps/admin/body.jsp'/>" name="body"></iframe>
        </td>
    </tr>
</table>
</body>
</html>
