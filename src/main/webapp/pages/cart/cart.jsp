<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:03 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>购物车</title>
    <%@include file="/pages/common/header.jsp"%>
</head>
<body>
<%@include file="/pages/common/navigation.jsp"%>
<c:if test="${empty bill}">
  <a style="margin: 100px;font-size: 20px" href="/index.jsp">你的购物车里没有东西，快去购物吧</a>
</c:if>
<c:if test="${!empty bill}">
    <div id="main">
        <table>
            <tr>
                <td>商品名称</td>
                <td>数量</td>
                <td>单价</td>
                <td>金额</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${bill.keySet()}" var="book">
                <tr>
                    <td>${book.name}</td>
                    <td>${bill.get(book)}</td>
                    <td>${book.price}</td>
                    <td>${bill.get(book)*book.price}</td>
                    <td><a href="deleteCartItem?id=${book.id}">删除</a></td>
                </tr>
            </c:forEach>
        </table>

        <div class="cart_info">
            <span class="cart_span">购物车中共有<span class="b_count">${sum}</span>件商品</span>
            <span class="cart_span">总金额<span class="b_price">${totalCount}</span>元</span>
            <span class="cart_span"><a href="/clearCart">清空购物车</a></span>
            <span class="cart_span"><a href="/checkout">去结账</a></span>
        </div>

    </div>
    <%@include file="/pages/common/footer.jsp"%>
</c:if>
</body>
