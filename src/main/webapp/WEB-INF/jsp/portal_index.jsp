<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<%String path = request.getContextPath();%>
<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/homepage.css"/>
    <title>登陆</title>

<body>
<!--遗留问题：
1、图片显示的div中容器撑破的现象
2、container属性的实质性问题
3、图片对应数据如何存放的问题  该有什么属性
4、分页技术怎样设置翻页动态效果-->




<!--导航-->
<div id="main">
    <div class="headerBar">
        <!--顶部导航-->
        <div class="topBar">
            <!--共用div-->
            <div class="comWidth">
                <!--收藏-->
                <div class="collect">
                    <a href="#" class="collection">收藏网页</a>
                </div>
                <!--登录、注册-->
                <div class="login-register">
                    欢迎来到该网页！<a href="#">[登录]</a><a href="#">[免费注册]</a>
                </div>
            </div>
        </div>
        <!--logo导航-->
        <div class="logoBar">
            <div class="comWidth">
                <!--左侧logo-->
                <div class="L-logoContent">
                    <div class="logo">
                        <a href="#"><img src="shopclass/logo.jpg" alt="电商网"></a>
                    </div>
                </div>
                <!--右侧搜索-->
                <div class="R-search">
                    <div class="search_box">
                        <input type="text" class="search_text">
                        <input type="button" value="搜 索" class="search_btn">
                    </div>
                    <div class="shopCar">
                        <span class="shopText">购物车</span>
                        <span class="shopNum">0</span>
                    </div>
                </div>
            </div>
        </div>

        <!--内容导航栏-->
        <div class="contentBar">
            <div class="contentWidth">
                <ul>
                    <li class="nav">全部商品分类</li>
                </ul>
            </div>
        </div>

    </div>

    <!--正文内容-->
    <div class="details">
        <!--左侧分类导航-->
        <div class="left-classfied  fl">
            <div class="sidebar">
                <ul class="menu fl">
                    <p class="classfiled">分类一</p>
                    <li><a href="#" id="tagtest">分类1</a></li>
                    <li><a href="#">分类2</a></li>
                    <li><a href="#">分类3</a></li>
                    <li><a href="#">分类4</a></li>
                    <p class="classfiled">分类二</p>
                    <li><a href="#">分类1</a></li>
                    <li><a href="#">分类2</a></li>
                    <li><a href="#">分类3</a></li>
                    <li><a href="#">分类4</a></li>
                    <p class="classfiled">分类三</p>
                    <li><a href="#">分类1</a></li>
                    <li><a href="#">分类2</a></li>
                    <li><a href="#">分类3</a></li>
                    <li><a href="#">分类4</a></li>
                    <p class="classfiled">分类四</p>
                    <li><a href="#">分类1</a></li>
                    <li><a href="#">分类2</a></li>
                    <li><a href="#">分类3</a></li>
                    <li><a href="#">分类4</a></li>
                    <p class="classfiled">分类五</p>
                    <li><a href="#">分类1</a></li>
                    <li><a href="#">分类2</a></li>
                    <li><a href="#">分类3</a></li>
                    <li><a href="#">分类4</a></li>
                </ul>
            </div>
        </div>

        <!--右侧图片显示-->
        <div class="right-show fr">
            <!--分类一对应的具体分类-->
            <div class="show fl">
                <!--图片拼接-->
                <!--图片属性：   图片、单价、描述、查看-->
                <!--每行放4个图片及介绍      图片设计的大小为 200x200    一页16张图片-->
                <ul class="show_list" id="content">

                </ul>


                <form action="" method="post">
                    <table border="" cellspacing="" cellpadding="">

                            <!--横1-->
                            <%--<td>--%>
                                <%--<div class="thumbnail" >--%>
                                    <%--<img src="img/1.jpg">--%>
                                    <%--<div class="caption">--%>
                                        <%--<h3 id="trade-name">名称</h3>                   <!--数据库动态获取数据-->--%>
                                        <%--<p id="trade-description">--%>
                                            <%--描述：这是第一个产品--%>
                                        <%--</p>--%>
                                        <%--<p>--%>
                                            <%--<label for="">单价：￥</label>--%>
                                            <%--<a id="trade-prices">30</a>--%>
                                            <%--&nbsp;&nbsp;&nbsp;--%>
                                            <%--<label for="">销售量：</label>--%>
                                            <%--<a id="trade-salenum">3000</a>--%>
                                        <%--</p>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</td>--%>


                    </table>
                    <!--若需要提交表单则添加-->
                    <!--<input type="submit" value=""/>-->
                </form>
            </div>
        </div>
        <!--</div>-->
        <!--分页技术-->
        <div class="page-next">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
    <!--底部链接-->
    <div class="footer">
        <div class="bottomcontent">
            <p>
                <a href="#">网站简介</a><i>|</i>
                <a href="#">网站公告</a><i>|</i>
                <a href="#">招纳贤士</a><i>|</i>
                <a href="#">联系我们</a><i>|</i>
                客服热线：400-675-1234
            </p>
            <p>
                Copyright © 2016 - 2018 xx版权所有&nbsp;&nbsp;&nbsp;
                京ICP备09037834号&nbsp;&nbsp;&nbsp;
                京ICP证B1034-8373号&nbsp;&nbsp;&nbsp;
                某市公安局XX分局备案编号：123456789123
            </p>
            <p class="web">
                <a href="#"><img src="shopclass/webLogo.jpg" alt="logo"></a>
                <a href="#"><img src="shopclass/webLogo.jpg" alt="logo"></a>
                <a href="#"><img src="shopclass/webLogo.jpg" alt="logo"></a>
                <a href="#"><img src="shopclass/webLogo.jpg" alt="logo"></a>
            </p>
        </div>
    </div>
</div>
<!--此处的style不能移动位置    主要是针对这个html的body-->
<style type="text/css">
    body{
        font-size: 12px;
        overflow-x: hidden;
    }
</style>

</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!--字符串拼接模板-->
<script>
    var format = function (str, data) {
        var html = '';
        if (data instanceof Array) {
            for (var i = 0, len = data.length; i < len; i++) {
                html += arguments.callee(str, data[i]);
            }
            return html;
        } else {
            return str.replace(/{#(\w+)#}/g, function (match, key) {
                return typeof data === 'string' ? data : (typeof data[key] === 'undefined' ? '' : data[key]);
            });
        }
    };
</script>

<%--前台界面初始化--%>
<script type="text/javascript" >
    $(document).ready(function () {
        //加载初始化数据
        loadInit(100006,"");
    });

    //加载初始化数据
    function loadInit(categoryId,keyword){
        //在这里写你要加载的数据（可以采用jquery的ajax调用，异步、同步均可以）
        //可以使用arguments.length == 1  在函数内部通过判断参数来实现重载
        $.ajax({
            type: "post",
            url: "/product/list.do",
            data: {
                categoryId: categoryId,
                keyword:keyword,
                pageSize:9
            },
            success: function(result) {
                console.log(result);
                var data = result.data;
                console.log(data);
                var list = data.list;
                console.log(list);

                var html = "<li>" +
                    "<div class='thumbnail'>" +
                    "<img src='{#imageHost#}094fb710-a9b1-44a7-aa8c-dce17fa30a66.jpg'>" +
                    "<div class=\"caption\">"+
                    "<h5 id=\"trade-name\">{#name#}</h5>" +
                    "<p id=\"trade-description\">{#subtitle#}</p>" +
                    "<p>"  +
                        "<label for=''>单价:</label>" +
                        "<a id='trade-prices'>{#price#}</a>" +
                        "&nbsp;&nbsp;&nbsp;" +
                        "<label for=''>库存:</label>" +
                        "<a id='trade-salenum'>3000</a>" +
                    "</p>" +
                "</div>"+
                "</div></li>";

                var element = format(html, list);
                console.log(element)
                $("#content").append(element);
            }
        });
    }
</script>

</html>
