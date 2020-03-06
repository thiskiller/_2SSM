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
    <title>图书管理</title>
    <%@include file="/pages/common/header.jsp"%>
    <script>
        $(function () {
            $(".delete").click(function () {
                if(!confirm("您确定删除"+$(this).parents("tr").children(":first").html()+"吗？")){
                    return false;
                }
            })
            $("#search").click(function () {
                   window.location.href = '/managers/getAll?pageNum='+$('#pn_input').val()
            })
        })
    </script>
</head>
<body>
<%@include file="/pages/common/manager_navigation.jsp"%>

<div id="main">
    <table>
        <tr>
            <td>名称</td>
            <td>价格</td>
            <td>作者</td>
            <td>销量</td>
            <td>库存</td>
            <td colspan="2">操作</td>
        </tr>
        <c:forEach items="${bookInfo.list}" var="book">
            <tr>
                <td>${book.name}</td>
                <td>${book.price}</td>
                <td>${book.author}</td>
                <td>${book.sales}</td>
                <td>${book.stock}</td>
                <td><a class="edit" href="/managers/getOne?id=${book.id}&pageNum=${bookInfo.pageNum}">修改</a></td>
                <td><a class="delete" href="/managers/deleteOne?id=${book.id}&pageNum=${bookInfo.pageNum}">删除</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><a href="/pages/manager/book_add.jsp?pageNum=${bookInfo.pageNum}">添加图书</a></td>
        </tr>
    </table>
</div>
<div id="page_nav">
    <a href="/managers/getAll?pageNum=1">首页</a>
    <c:if test="${bookInfo.hasPreviousPage}">
        <a href="/managers/getAll?pageNum=${bookInfo.prePage}">上一页</a>
    </c:if>
    <c:forEach items="${bookInfo.navigatepageNums}" var="navigator">
        <c:if test="${bookInfo.pageNum==navigator}">
            【${bookInfo.pageNum}】
        </c:if>
        <c:if test="${bookInfo.pageNum!=navigator}">
            <a href="/managers/getAll?pageNum=${navigator}">${navigator}</a>
        </c:if>
    </c:forEach>

    <c:if test="${bookInfo.hasNextPage}">
        <a href="/managers/getAll?pageNum=${bookInfo.nextPage}">下一页</a>
    </c:if>
    <a href="/managers/getAll?pageNum=${bookInfo.pages}">末页</a>
    共${bookInfo.pages}页，${bookInfo.total}条记录 到第<input value="${bookInfo.pageNum}"  name="pn" id="pn_input"/>页
    <input id="search" type="button"  value="确定">
</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
