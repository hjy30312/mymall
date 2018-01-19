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
    <!--右侧内容-->
    <div class="main">
        <div class="cont" >
            <div class="details_operation clearfix" id="selectProduct">


            </div>



            <table class="table table-hover table-bordered table-striped table-condensed">
                <!--动态显示 -->
                <thead id="head">
                <!--表头-->
                </thead>
                <!--内容-->
                <tbody id="content">

                </tbody>

            </table>
            <div>
                <!--拼接按钮-->
                <ul class="pager" id="pager">

                </ul>
            </div>


        </div>
    </div>

    <!--左侧列表-->
    <div class="menu">
        <div class="cont">
            <div class="title">管理员</div>
            <ul class="mList">
                <li>
                    <button type="button" id="ProductList" class="btn btn-default">商品列表</button>
                    <br>
                </li>
                <li>
                    <button type="button" onclick='addProduct()' class="btn btn-default">添加商品</button>
                    <br>
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

<script>
    $(document).on('dblclick','.qqq',function () {

    });
</script>
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



<!--拼接商品列表头部-->
<script type="text/javascript">
    $(function () {
        $("#ProductList").click(function () {
            $.ajax({
                url: "/product/productHead.do",
                type: "post",
                dataType: "json",
                success: function (result) {
                    $("#head").empty();
                    console.log(result);
                    var json = eval(result);


                    var html = "<tr>"
                        +   "<td><span class=\"qqq\">{#id#}</span></td>"
                        +   "<td>{#name#}</td>"
                        +   "<td>{#price#}</td>"
                        +   "<td>{#picture#}</td>"
                        +   "<td>{#describe#}</td>"
                        +   "<td>{#functions#}</td>"
                        +   "</tr>";
                    var element = format(html, json);

                    <%--var template =  '<% for (var i = 0; i < json.list.length;i++) { %>'--%>
                    <%--+       '<td><%= name %></td>'--%>


                    $("#head").append(element);
                }
            });
        });
    });
</script>

<%--拼接商品搜索--%>
<script type="text/javascript">
        function addSearchProduct() {
            //界面
            var html = "<form class=\"form-inline\">\n" +
                "                <div class=\"form-group\">\n" +
                "                    <label for=\"productName\">名称</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" id=\"productName\" placeholder=\"如：发动机\">\n" +
                "                </div>\n" +
                "                <div class=\"form-group\">\n" +
                "                    <label for=\"productId\">商品ID</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" id=\"productId\" placeholder=\"如：52\">\n" +
                "                </div>\n" +
                "                <button type=\"button\" id=\"searchProduct\"  class=\"btn btn-default\">搜索</button>\n" +
                "            </form>"
            $("#selectProduct").append(html);
            $('button').on('click',function(){
            });
        }
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#selectProduct").delegate("button","click",function(){
            $("#searchProduct").click(function () {
                var productId = $("#productId").val();
                var productName = $("#productName").val();
                searchProductlist(productName, productId, 1, 10);
            });
        });
    });
</script>

<!--商品搜索显示  包含分页-->
<script type="text/javascript">
    function searchProductlist(productName,productId,pageNum,pageSize) {
        if (productName === undefined || productName === '' ||productName === null) {
            var str =  "&productId=" + productId + "&pageNum=" + pageNum
                    + "&pageSize=" + pageSize;
        } else {
            var str = "productName=" + productName+ "&productId=" + productId
                        + "&pageNum=" + pageNum + "&pageSize=" + pageSize;
        }
        console.log(str);
        $.ajax({
            url: "/manage/product/search.do",
            data: str,
            type: "post",
            dataType: "json",
            success: function (result) {
                console.log(result);
                var data = result.data;
                console.log(data);
                var list = data.list;
                $("#content").empty();
                $("#pager").empty();
                var html = "<tr>"
                    + "<td><span class='qqq'>{#id#}</span></td>"
                    + "<td>{#name#}</td>"
                    + "<td>{#price#}</td>"
                    + "<td>{#mainImage#}</td>"
                    + "<td><a class='btn btn-info' href='/product/{#id#}/detail' target='_blank'>link</a></td>"
                    + "<td>"
                    + "<button class='btn btn-default' type='button' onclick='setSaleStatus({#id#},1)' >上架</button>"
                    + "<button class='btn btn-default' type='button' onclick='setSaleStatus({#id#},0)' >下架</button>"
                    + "</td>"
                    + "</tr>";
                var element = format(html, list);
                var hasPreviousPage = data.hasPreviousPage;
                if(hasPreviousPage) {
                    //有上一页
                    var prebtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='searchProductlist(&quot;"+productName+"&quot;, &quot;"+productId+"&quot;,{#prePage#},{#pageSize#})'>上一页</button></li>";
                }else {
                    //没有则是第一页
                    var prebtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='searchProductlist(&quot;"+productName+"&quot;,&quot;"+productId+"&quot;,{#firstPage#},{#pageSize#})'>上一页</button></li>";
                }

                var hasNextPage = data.hasNextPage;
                if(hasNextPage) {
                    //有下一页
                    var nextbtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='searchProductlist(&quot;" + productName + "&quot;,&quot;"+productId+"&quot;,{#nextPage#},{#pageSize#})'>下一页</button></li>";
                }else {
                    var nextbtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='searchProductlist(&quot;" + productName + "&quot;,&quot;"+productId+"&quot;,{#lastPage#},{#pageSize#})'>下一页</button></li>";
                }
                var prebtn_element = format(prebtn_html, data)
                var nextbtn_element = format(nextbtn_html, data)

                $("#content").append(element);
                $("#pager").append(prebtn_element);
                $("#pager").append(nextbtn_element);
            }
        });
    }
</script>
<!--商品列表显示  包含分页-->
<script type="text/javascript">
    $(function () {
        $("#ProductList").click(function () {
            addSearchProduct();
            productlist(1,10);

        });
    });
</script>
<script type="text/javascript">
    function productlist(pageNum,pageSize) {
        //发送ajax
        $.ajax({
            url: "/manage/product/list.do",
            data: {
                pageNum: pageNum,
                pageSize: pageSize
            },
            type: "post",
            dataType: "json",
            success: function (result) {
                var data = result.data;
                console.log(data);
                var list = data.list;
                console.log(list);

                $("#content").empty();
                $("#pager").empty();
                var html = "<tr>"
                    + "<td><span class='qqq'>{#id#}</span></td>"
                    + "<td>{#name#}</td>"
                    + "<td>{#price#}</td>"
                    + "<td>{#mainImage#}</td>"
                    + "<td><a class='btn btn-info' href='/product/{#id#}/detail' target='_blank'>详情</a></td>"
                    + "<td>"
                    + "<button class='btn btn-default' type='button' onclick='setSaleStatus({#id#},1)' >上架</button>"
                    + "<button class='btn btn-default' type='button' onclick='setSaleStatus({#id#},0)' >下架</button>"
                    + "</td>"
                    + "</tr>";
                var element = format(html, list);

                var hasPreviousPage = data.hasPreviousPage;
                if(hasPreviousPage) {
                    //有上一页
                    var prebtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='productlist({#prePage#},{#pageSize#})'>上一页</button></li>";
                }else {
                    //没有则是第一页
                    var prebtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='productlist({#firstPage#},{#pageSize#})'>上一页</button></li>";
                }

                var hasNextPage = data.hasNextPage;
                if(hasNextPage) {
                    //有下一页
                    var nextbtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='productlist({#nextPage#},{#pageSize#})'>下一页</button></li>";
                }else {
                    var nextbtn_html =
                        "<li><button class='btn btn-default' type='button' onclick='productlist({#lastPage#},{#pageSize#})'>下一页</button></li>";
                }
                var prebtn_element = format(prebtn_html, data)
                var nextbtn_element = format(nextbtn_html, data)

                $("#content").append(element);
                $("#pager").append(prebtn_element);
                $("#pager").append(nextbtn_element);

            }
        });
    }
</script>
<!--商品上下架-->
<script type="text/javascript">
    function setSaleStatus(productId,status) {
        $.ajax({
            url: "/manage/product/set_sale_status.do",
            data: {
                productId:productId,
                status: status
            },
            type: "post",
            dataType: "json",
            success: function (result) {
                if(result.status === 0){
                    alert("修改产品状态成功");
                }

            }
        });
    }
</script>
<!--添加商品拼接-->
<script type="text/javascript">
    function addProduct() {
        $("#selectProduct").empty();
        $("#head").empty();
        $("#content").empty();
        $("#pager").empty();
        //界面
        var html = "<div class=\"submit_form\">\n" +
            "    <form class=\"form-horizontal\">\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"shop_name\">商品名称：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"shop_name\" placeholder=\"请输入商品名称\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"shop_subhead\">商品副标题：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"shop_subhead\" placeholder=\"请输入商品副标题\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"price\">商品单价：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"price\" placeholder=\"请输入商品单价\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"quantity\">库存数量：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"quantity\" placeholder=\"请输入商品库存数量\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"state\">商品状态：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"state\" placeholder=\"请输入商品状态\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"classify\">商品分类：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"classify\" placeholder=\"请输入商品分类\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"details\">商品详情：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"text\" id=\"details\" placeholder=\"请输入商品详情\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <div class=\"form-group form-group-sm\">\n" +
            "            <label class=\"col-sm-2 control-label\" for=\"images\">商品主图：</label>\n" +
            "            <div class=\"col-sm-10\">\n" +
            "                <input class=\"form-control\" type=\"file\" id=\"images\">\n" +
            "            </div>\n" +
            "        </div>\n" +
            "        <button type=\"submit\" class=\"btn btn-primary\" style=\"position: relative;left: 125px;width: 200px;\">提交</button>\n" +
            "    </form>\n" +
            "</div>\n" +
            "\n" +
            "</div>";
        $("#content").append(html);
    }
</script>

</html>