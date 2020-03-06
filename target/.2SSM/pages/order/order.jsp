<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:07 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的订单</title>
    <%@include file="/pages/common/header.jsp"%>
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }
    </style>
    <script>
        $(function(){
            $('.a').click(function () {
            return false
         })
        })
    </script>
</head>
<body>

<%@include file="/pages/common/navigation.jsp"%>

<div id="main">

    <table>
        <tr>
            <td>日期</td>
            <td>金额</td>
            <td>状态</td>
            <td>详情</td>
        </tr>
        <c:forEach items="${orderlist}" var="order">
            <tr>
                <td>${order.date}</td>
                <td>${order.money}</td>
                <c:if test="${order.status==0}">
                    <td><a class="a" href="#">未发货</a></td>
                </c:if>
                <c:if test="${order.status==1}">
                    <td><a>已发货</a></td>
                </c:if>
                <td><a class="a" href="#">查看详情</a></td>
            </tr>
        </c:forEach>
    </table>

</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>