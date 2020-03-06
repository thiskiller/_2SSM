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
    <script>
        $(function () {
            $(".addCart").click(function () {
                var bookid = $(this).parent().children(".ids").val();
                $.ajax({
                    url:"/addToCar?id="+bookid,
                    success:function () {
                        window.location.reload();
                    }
                })
            })
            $("#search").click(function () {
                window.location.href = '/getAllBookByMoney?pageNum='+$('#pn_input').val()
            })
        })
    </script>
</head>
<body>
<%@include file="/pages/common/navigation.jsp"%>
<div id="main">
    <div id="book">
        <div class="book_cond">
            <form action="/getAllBookByMoney" method="get">
                价格：<input id="min" type="text" name="min" value="${min}"> 元 -
                <input id="max" type="text" name="max" value="${max}"> 元
                <input type="submit" value="查询" />
            </form>
        </div>
        <div style="text-align: center">
            <c:if test="${!empty sum}">
                <span>您的购物车中有${sum}件商品</span>
            </c:if>
            <c:if test="${empty sessionScope.bill.size()}">
                <span>您的购物车中没有商品</span>
            </c:if>
            <c:if test="${empty sessionScope.book}">
                <div>
                    <span style="color: red">&nbsp;</span>
                </div>
            </c:if>
            <c:if test="${!empty sessionScope.book}">
                <div>
                    您刚刚将<span style="color: red">${sessionScope.book}</span>加入到了购物车中
                </div>
            </c:if>
        </div>
        <c:forEach items="${bookInfo.list}" var="book">
            <div class="b_list">
                <div class="img_div">
                    <img class="book_img" alt="" src="${book.imgPath}" />
                </div>
                <div class="book_info">
                    <div class="book_name">
                        <span class="sp1">书名:</span>
                        <span class="sp2">${book.name}</span>
                    </div>
                    <div class="book_author">
                        <span class="sp1">作者:</span>
                        <span class="sp2">${book.author}</span>
                    </div>
                    <div class="book_price">
                        <span class="sp1">价格:</span>
                        <span class="sp2">${book.price}</span>
                    </div>
                    <div class="book_sales">
                        <span class="sp1">销量:</span>
                        <span class="sp2">${book.sales}</span>
                    </div>
                    <div class="book_amount">
                        <span class="sp1">库存:</span>
                        <span class="sp2">${book.stock}</span>
                    </div>
                    <div class="book_add">
                        <input class="ids" type="hidden" value="${book.id}">
                        <input type="button" class="addCart" value="加入购物车"></input>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div id="page_nav">
        <a href="/getAllBookByMoney?pageNum=1">首页</a>
        <c:if test="${bookInfo.hasPreviousPage}">
            <a href="/getAllBookByMoney?pageNum=${bookInfo.prePage}">上一页</a>
        </c:if>
        <c:forEach items="${bookInfo.navigatepageNums}" var="navigator">
            <c:if test="${bookInfo.pageNum==navigator}">
                【${bookInfo.pageNum}】
            </c:if>
            <c:if test="${bookInfo.pageNum!=navigator}">
                <a href="/getAllBookByMoney?pageNum=${navigator}">${navigator}</a>
            </c:if>
        </c:forEach>

        <c:if test="${bookInfo.hasNextPage}">
            <a href="/getAllBookByMoney?pageNum=${bookInfo.nextPage}">下一页</a>
        </c:if>
        <a href="/getAllBookByMoney?pageNum=${bookInfo.pages}">末页</a>
        共${bookInfo.pages}页，${bookInfo.total}条记录 到第<input value="${bookInfo.pageNum}" name="pn" id="pn_input"/>页
        <input id="search" type="button" value="确定">
    </div>

</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
