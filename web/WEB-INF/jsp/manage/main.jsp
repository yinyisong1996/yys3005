<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>
<%--    <link rel="stylesheet" href="../../../layui/css/layui.css">--%>

    <style type="text/css">
        *{
            font-size:10pt;
        }
        body{
            text-align:center;
        }
        .table{
            width:1024px;
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
        <tr style="background:	#00CED1; height: 120px; ">
            <td colspan="2" align="center">
                <iframe frameborder="0" src="<c:url value='/jsps/top.jsp'/>" name="top"></iframe>
            </td>
        </tr>
        <tr style="background:#FFDEAD">
            <td width="120" style="padding:5px;" align="center" valign="top">
                <iframe frameborder="0" width="120" src="<c:url value='/categoryServlet/findAll'/>" name="left"></iframe>
            </td>
            <td>
                <iframe frameborder="0" src="<c:url value='/jsps/body.jsp'/>" name="body"></iframe>
            </td>
        </tr>
    </table>





</body>

</html>
