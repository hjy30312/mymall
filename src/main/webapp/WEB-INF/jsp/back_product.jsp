<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<%String path = request.getContextPath();%>
<!doctype html>
<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <link rel="stylesheet" href="<%=path%>/style/backstage.css">
</head>


<body>
<div class="head">
    <div class="logo fl"><a href="#"></a></div>
    <h3 class="head_text fr">慕课电子商务后台管理系统</h3>
</div>

<div class="content clearfix">
    <div class="main">
        <!--右侧内容-->
        <div class="cont">
            <div class="title">产品管理</div>
            <div class="details">
                <div class="details_operation clearfix">
                    <div class="bui_select">
                        <input type="button" value="添&nbsp;&nbsp;加" class="add">
                    </div>
                    &nbsp;&nbsp;&nbsp;
                    <div class="bui_select">
                        <input type="button" value="添&nbsp;&nbsp;加" class="add">
                    </div>
                    <div class="fr">
                        <div class="text">
                            <span>商品名称：</span>
                            <div class="bui_select">
                                <select name="" id="" class="select">
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                </select>
                            </div>
                        </div>
                        <div class="text">
                            <span>上架时间：</span>
                            <div class="bui_select">
                                <select name="" id="" class="select">
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                    <option value="1">测试内容</option>
                                </select>
                            </div>
                        </div>
                        <div class="text">
                            <span>搜索</span>
                            <input type="text" value="" class="search">
                        </div>
                    </div>
                </div>
                <!--表格-->
                <table class="table table-hover table-bordered table-striped table-condensed">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>名称</th>
                        <th>价格</th>
                        <th>库存数量</th>
                        <th>详情页</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${list}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.stock}</td>
                            <td>
                                <a class="btn btn-info" href="/product/${product.id}/detail" target="_blank">link</a>
                            </td>
                            <td>

                            </td>
                        </tr>
                    </c:forEach>

                    <tr>
                        <!--这里的id和for里面的c1 需要循环出来-->
                        <td><input type="checkbox" id="c1" class="check"><label for="c1" class="label">001</label></td>
                        <td>后台设计</td>
                        <td>测试内容</td>
                        <td>测试内容</td>
                        <td>测试内容</td>
                        <td align="center">
                            <input type="button" value="修改" class="btn">
                            <input type="button" value="上架" class="btn">
                            <input type="button" value="下架" class="btn">
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--左侧列表-->
    <div class="menu">
        <div class="cont">
            <div class="title">管理员</div>
            <ul class="mList">
                <li>
                    <h3><span>-</span>商品管理</h3>
                    <dl>
                        <dd><a href="#">商品修改</a></dd>
                        <dd><a href="#">商品分类</a></dd>
                    </dl>
                </li>
                <li>
                    <h3><span>+</span>订单管理</h3>
                    <dl>
                        <dd><a href="#">订单修改</a></dd>
                        <dd><a href="#">订单又修改</a></dd>
                        <dd><a href="#">订单总是修改</a></dd>
                        <dd><a href="#">测试内容你看着改</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

</div>
</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

</html>