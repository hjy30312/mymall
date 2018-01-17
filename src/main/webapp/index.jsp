<%@ page language="java"  contentType="text/html; charset=UTF-8" %>

<html>
<body>
<h2>Hello World!</h2>



springmvc上传文件
<form name="form1" action="/manage/product/upload.do" method="post" enctype="multipart/form-data">
    <input type="file" name="upload_file" />
    <input type="submit" value="springmvc上传文件" />
</form>


富文本图片上传文件
<form name="form2" action="/manage/product/richtext_img_upload.do" method="post" enctype="multipart/form-data">
    <input type="file" name="upload_file" />
    <input type="submit" value="富文本图片上传文件" />
</form>

<div class="submit_form">
    <form class="form-horizontal">
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="shop_name">商品名称：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="shop_name" placeholder="请输入商品名称">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="shop_subhead">商品副标题：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="shop_subhead" placeholder="请输入商品副标题">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="price">商品单价：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="price" placeholder="请输入商品单价">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="quantity">库存数量：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="quantity" placeholder="请输入商品库存数量">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="state">商品状态：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="state" placeholder="请输入商品状态">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="classify">商品分类：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="classify" placeholder="请输入商品分类">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="details">商品详情：</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" id="details" placeholder="请输入商品详情">
            </div>
        </div>
        <div class="form-group form-group-sm">
            <label class="col-sm-2 control-label" for="images">商品主图：</label>
            <div class="col-sm-10">
                <input class="form-control" type="file" id="images">
            </div>
        </div>
        <button type="submit" class="btn btn-primary" style="position: relative;left: 125px;width: 200px;">Submit</button>
    </form>
</div>

</div>



</body>
</html>