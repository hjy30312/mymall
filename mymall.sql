CREATE databse test2018;
user test2018;

--------1.客户表------
--DROP TABLE tblCustomer
create table tblCustomer(
    --客户ID
	CustomerID varchar(20) not null primary key ,
	--客户名称
	CustomerName nvarchar(50) no null unique,
	--客户密码
	CustomerPassword nvarchar(50) no null,
	--手机号
	CustomerPhone nvarchar(10),
	--找回密码问题
	CustomerQuestion nvarchar(50),
	--找回密码答案
	CustomerAnswer nvarchar(50),
	--备注
	CustomerRemark nvarchar(200)
)
--------2.地址表------
--drop table tblAddress
create table tblAddress(

	--地址ID
	AddressID varchar(20) not null primary key,
	--客户ID
	CustomerId varchar(20) not null references tblCustomer(CustomerID),
	--收货人名称
	ReceiverName nvarchar(20) no null,
	--收货人电话
	ReceiverPhone varchar(20) no null,
	--国家
	Country nvarchar(20),
	--省份
	Province nvarchar(20) no null,
	--城市
	City nvarchar(20) no null,
	--区/县
	Area nvarchar(20) no null,
	--详细地址
	DetailedAddress nvarchar(20) no null,
	--邮编
	PostCode varchar(20) no null,
	--缺省
	Default nvarchar(20) no null,
    --备注
	AddressRemark nvarchar(200)
)
--------3.分类表------
--drop table tblCatrgory
create table tblCatrgory(
	--分类ID
	CategoryID varchar(20) not null primary key,
	--父类ID
	ParentID varchar(20) references tblCatrgory(CategoryID),
	--类别名称
	CategoryID varchar(20) not null unique,
	--车型
	AutoStyling nvarchar(10) not null,
	--备注
	CatrgoryRemark nvarchar(200)
)
--------4.商品表------
--drop table tblProduct
create table tblProduct(
	--商品ID
	ProductID varchar(20) not null primary key,
	--分类ID
	CategoryID varchar(20) not null references tblCatrgory(CategoryID),
	--供应商ID
	SupplierID varchar(20) not null references tblSupplier(SupplierID),
	--价格ID
	ProductValueID varchar(20) not null references tblProductValue(ProductValueID),
	--商品名称
	ProductName nvarchar(20) not null,
	--商品副标题
	ProductSubtitle nvarchar(20),
	--图片文件夹地址
	ProductImagesAddress varchar(20),
	--库存数量
	ProductCount int not null   check(ProductCount > 0),
	--商品状态
	Productstatus //todo
	--制造工厂
	ManufacturingPlant nvarchar(20) not null,
	--创建时间
	createTime datetime,
	--更新时间
	modifiedTime datetime,
	--备注
	ProductRemark nvarchar(200)
)
--------5.商品价格表------
--drop table tblProductValue
create table tblProductValue(
	--商品价格ID
	ProductValueID varchar(20) not null primary key,
	--开始时间
	StartTime datetime no null,
	--截止时间
	endTime datetime,
	--会员价格
	MemberValue money,
	--普通价格
	OrdinaryValue money no null,
	--备注
	ProductValueRemark nvarchar(200)
)

--------6.购物明细表------
--drop table tblCart
create table tblCart(
	--购物车ID
	CartID varchar(20) not null primary key,
	--客户ID
	CustomerID varchar(20) not null references tblCustomer(CustomerID),
	--商品ID
	ProductID varchar(20) not null references tblProduct(ProductID),
	--数量
	ProductCount int not null
	--创建时间

	--更新时间
	--备注
)
--------7.订单表----
--drop table tblOrder
create table tblOrder(
	--订单ID
	OrderID varchar(20) not null primary key,
	--用户ID
	CustomerID varchar(20) not null references tblCustomer(CustomerID),
	--地址ID
	AddressID varchar(20) not null references tblAddress(AddressID),
	--实际付款金额
	Payment money not null,
	--运费
	Postage money not null,
	--订单状态
	OrderStatus //tood
	--支付时间
	PaymentTime datetime not null,
	--创建时间
	--更新时间
	--备注
)
--------8.订单处理表-----
--drop table tblOrder
create table (
	--订单处理ID
	--订单ID
	--雇员ID
	--处理时间
	--处理结果
	--备注
)
--------9.订单明细-----
--drop table
create table (
	--订单明细ID
	--商品ID
	--订单ID
	--交易单价
	--商品数量
	--创建时间
	--更新时间
	--备注
)
--------10.订单入库表-----
--drop table
create table (
	--订单明细ID
	--商品ID
	--订单ID
	--交易单价
	--商品数量
	--创建时间
	--更新时间
	--备注
)

--------11.雇员表-----
--drop table
create table (
	--雇员ID
	--雇员名称
	--雇员密码
	--备注
)
--------12.供应商表-----
--drop table tblSupplier
create table tblSupplier(
	--供应商ID
	SupplierID varchar(20) not null primary key,
	--供应商名称
	SupplierName nvarchar(20) not null unique,
	--供应商电话
	SupplierPhone nvarchar(20) not null，
	--备注
	SupplierRemark nvarchar(200)
)


