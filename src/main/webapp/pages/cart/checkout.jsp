<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:04 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>结算页面</title>
    <%@include file="/pages/common/header.jsp"%>
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }
    </style>
</head>
<body>

<%@include file="/pages/common/navigation.jsp"%>

<div id="main">

    <h1>你的订单已结算，订单号为${checkCode}</h1>


</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
