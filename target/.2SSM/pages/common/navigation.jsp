<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/3/4
  Time: 17:40 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${empty user}">
    <div id="header">
        <img class="logo_img" alt="" src="/static/img/logo.gif" >
        <span class="wel_word">网上书城</span>
        <div>
            <a href="/pages/user/login.jsp">登录</a> |
            <a href="/pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
            <a href="/pages/manager/manager.jsp">后台管理</a>
        </div>
    </div>
</c:if>
<c:if test="${!empty user}">
    <div id="header">
        <img class="logo_img" alt="" src="/static/img/logo.gif" >
        <span class="wel_word">网上书城</span>
        <div>
            <span>欢迎<span class="um_span">${user.username}</span>光临尚硅谷书城</span>
            <a href="/pages/cart/cart.jsp">购物车</a>
            <a href="/managers/myOrder">我的订单</a>
            <a href="/logout">注销</a>&nbsp;&nbsp;
            <a href="/index.jsp">返回</a>
        </div>
    </div>
</c:if>