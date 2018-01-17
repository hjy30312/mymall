<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<%String path = request.getContextPath();%>
<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <title>注册</title>
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
    </style>
</head>

<body>


<div class="header">
    <div class="am-g">
        <h1>Web ide</h1>
    </div>
    <hr />
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>注册</h3>
        <hr>
        <form class="am-form">
            <br>
            <label for="username">账号:</label>
            <input type="text" name="username" id="username"/>
            <br>
            <label for="password">密码:</label>
            <input type="password" name="password" id="password"/>
            <br>
            <label for="password">手机号:</label>
            <input type="text" name="phone" id="phone"/>
            <br>
            <label for="password">找到密码问题:</label>
            <input type="text" name="phone" id="question"/>
            <br>
            <label for="password">找到密码问题:</label>
            <input type="text" name="phone" id="answer"/>
            <div class="am-cf">
                <input type="submit"  id="submit" value="注 册"  class="am-btn am-btn-primary am-btn-sm am-fl">
            </div>
        </form>

        <p>© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </div>
</div>
</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $("#submit").click(function() {

        var username = $("#username").val();
        var password = $("#password").val();
        var phone = $("#phone").val();
        var question = $("#question").val();
        var answer = $("#answer").val();
        $.ajax({
            type: "post",
            url: "/user/register.do",
            data: {
                username: username,
                password: password,
                phone:phone,
                question:question,
                answer:answer
            },
            success: function(data) {
                //注册成功
                if(data.status === 0) {
                    alert("注册成功");
//                    window.location.href="跳转的url,后边也可以拼接点data中数据作为参数";
                } else {
                    alert("用户名已存在");
                }
            }
        });
    })
</script>
</html>
