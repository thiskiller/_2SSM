
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:05 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑图书</title>
    <%@include file="/pages/common/header.jsp"%>
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color:red;
        }

        input {
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="/pages/common/manager_navigation.jsp"%>
<%
    String pageNum = (String)request.getParameter("pageNum");
    request.setAttribute("pageNum",pageNum);
%>
<div id="main">
    <form  action="/managers/saveBook?pageNum=${pageNum}">
        <table>
            <tr>
                <td>名称</td>
                <td>价格</td>
                <td>作者</td>
                <td>销量</td>
                <td>库存</td>
                <td colspan="2">操作</td>
            </tr>
            <tr>
                <td><input name="name"></input></td>
                <td><input name="price"></input></td>
                <td><input name="author"></input></td>
                <td><input name="sales"></input></td>
                <td><input name="stock"></input></td>
                <td><input type="submit" value="提交"/></td>
            </tr>
        </table>
    </form>
</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>