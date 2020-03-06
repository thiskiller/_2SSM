<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/pages/common/header.jsp"%>
    <title>书城首页</title>
</head>
<body>
<jsp:forward page="/getAllBook?pageNum=1"></jsp:forward>
</body>
</html>
