<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:05 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<div id="main">
    <form:form  action="/managers/saveBook?pageNum=${pageNum}"  modelAttribute="book">
        <table>
            <tr>
                <td>名称</td>
                <td>价格</td>
                <td>作者</td>
                <td>销量</td>
                <td>库存</td>
                <td colspan="2">操作</td>
            </tr>
            <%--效果差强人意，主要为增强from:from的理解--%>
            <tr>
                <form:input  path="id" type="hidden"></form:input>
                <td><form:input path="name"></form:input></td>
                <td><form:input path="price"></form:input></td>
                <td><form:input path="author"></form:input></td>
                <td><form:input path="sales"></form:input></td>
                <td><form:input path="stock"></form:input></td>
                <td><input type="submit" value="提交"/></td>
            </tr>
        </table>
    </form:form>
</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>