<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/2/27
  Time: 21:08 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>尚硅谷会员注册页面</title>
    <%@include file="/pages/common/header.jsp"%>
    <style type="text/css">
        .login_form{
            height:420px;
            margin-top: 25px;
        }
    </style>
    <script>
        $(function(){
            /*表单验证*/
            $('#sub_btn').click(function () {
                var usernameReg = /^[a-z0-9A-Z_-]{6,16}$/;
                var username = $("#username").val();
                var passwordReg = /^[a-z0-9A-Z_-]{6,16}$/;
                var password = $('#password').val();
                var repwd = $('#repwd').val();
                var emailReg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                var email = $('#email').val();
                if(!usernameReg.test(username)){
                    $("#errorMsg").html("用户名不符合规范");
                    return false;
                }
                if(!passwordReg.test(password)){
                    $("#errorMsg").html("密码不符合规范");
                    return false;
                }
                if(password!=repwd){
                    $("#errorMsg").html("两次密码不一致");
                    return false;
                }
                if(!emailReg.test(email)){
                    $("#errorMsg").html("邮箱地址不符合规范");
                    return false;
                }
            })
            /*防止用户名重复*/
            // $("#username").blur(function () {
            //     $.ajax({
            //         url: "/isRepeat",
            //         type: "POST",
            //         data:{
            //             "username":$("#username").val(),
            //         },
            //         success:function(){
            //             alert("刷新成功")
            //         }
            //     });
            // })
            /*更换验证码*/
            $("#img").click(function () {
                $("#img").prop("src","code.jpg?is="+Math.random());
            })
        })
    </script>
</head>
<body>
<div id="login_header">
    <img class="logo_img" alt="" src="/static/img/logo.gif" >
</div>

<div class="login_banner">

    <div id="l_content">
        <span class="login_word">欢迎注册</span>
    </div>
    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <h1>注册尚硅谷会员</h1>
                    <span class="errorMsg"  id="errorMsg">${errorMsg}</span>
                </div>
                <div class="form">
                    <form action="/regist" method="post">
                        <label>用户名称：</label>
                        <input class="itxt" type="text" placeholder="${empty username1?'请输入用户名':username1}" autocomplete="off" tabindex="1" name="username" id="username" value="${username}" />
                        <br />
                        <br />
                        <label>用户密码：</label>
                        <input class="itxt" type="password" placeholder="${empty password1?'请输入密码':password1}" autocomplete="off" tabindex="1" name="password" id="password" />
                        <br />
                        <br />
                        <label>确认密码：</label>
                        <input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
                        <br />
                        <br />
                        <label>电子邮件：</label>
                        <input class="itxt" type="text" placeholder="${empty email1?'请输入邮箱地址':email1}" autocomplete="off" tabindex="1" name="email" id="email" value="${email}"/>
                        <br />
                        <br />
                        <label>验证码：</label>
                        <input class="itxt" name="code" type="text" style="width: 130px;" id="code"/>
                        <img id="img" src="code.jpg" style="float: right; margin-right: 40px">
                        <br />
                        <br />
                        <input type="submit" value="注册" id="sub_btn" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
