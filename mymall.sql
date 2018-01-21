CREATE DATABASE RBEC2018;
USE RBEC2018;

--------1.客户表------
--DROP TABLE tblCustomer
CREATE TABLE tblCustomer(
    --客户ID ，由公司编码
	CustomerID VARCHAR(20) NOT NULL PRIMARY KEY ,
	--客户名称
	CustomerName NVARCHAR(50) NOT NULL UNIQUE,
	--客户密码 MD5加密
	CustomerPassword VARCHAR(50) NOT NULL,
	--手机号
	CustomerPhone VARCHAR(10),
	--找回密码问题
	CustomerPwdQuestion NVARCHAR(50),
	--找回密码答案
	CustomerPwdAnswer NVARCHAR(50),
	--备注
	CustomerRemark NVARCHAR(100)
)
--------2.客户地址表------
--DROP TABLE tblCustomerAddress
CREATE TABLE tblCustomerAddress(
	--客户地址ID
	CustomerAddressID INT IDENTITY(1,1) PRIMARY KEY,
	--客户ID
	CustomerID VARCHAR(20) NOT NULL REFERENCES tblCustomer(CustomerID),
	--收货人名称
	ReceiverName NVARCHAR(20) NOT NULL,
	--收货人电话
	ReceiverPhone VARCHAR(20) NOT NULL,
	--国家
	ReceiverCountry NVARCHAR(10),
	--省份
	ReceiverProvince NVARCHAR(10) NOT NULL,
	--城市
	ReceiverCity NVARCHAR(10) NOT NULL,
	--区/县
	ReceiverArea NVARCHAR(10) NOT NULL,
	--详细地址
	ReceiverDetailedAddress NVARCHAR(50) NOT NULL,
	--邮编
	ReceiverPostCode VARCHAR(10) NOT NULL,
	--是否是缺省地址  0-不是缺省 1-缺省
	ReceiverAddressFlag INT NOT NULL default 0,
    --客户地址备注
	CustomerAddressRemark NVARCHAR(200),

	check(ReceiverAddressFlag = 0 or ReceiverAddressFlag = 1)


)
--------3.汽车配件分类表------
--DROP TABLE tblPartCatrgory
CREATE TABLE tblPartCatrgory(
	--汽车配件分类ID
	PartCatrgoryID VARCHAR(6) NOT NULL PRIMARY KEY,
	--父类ID
	ParentID VARCHAR(6) REFERENCES tblPartCatrgory(PartCatrgoryID),
	--汽车配件类别名称
	PartCategoryName NVARCHAR(10) NOT NULL UNIQUE,
	--车型
	AutoStyling NVARCHAR(10) NOT NULL,
	--汽车配件分类备注
	PartCatrgoryRemark NVARCHAR(200)
)
--------4.汽车配件价格表------
--DROP TABLE tblPartPrice
CREATE TABLE tblPartPrice(
	--商品价格ID
	PartPriceID VARCHAR(20) NOT NULL PRIMARY KEY,
	--开始时间
	PartPriceStartTime DATETIME NOT NULL,
	--截止时间
	PartPriceEndTime DATETIME,
	--会员价格
	MemberPrice money,
	--普通价格
	OrdinaryPrice money NOT NULL,
	--商品价格备注
	PartPriceRemark NVARCHAR(200)
)

--------5.汽车配件表------
--DROP TABLE tblPart
CREATE TABLE tblPart(
	--汽车配件ID
	PartID VARCHAR(30) NOT NULL PRIMARY KEY,
	--分类ID
	PartCatrgoryID VARCHAR(6) NOT NULL REFERENCES tblPartCatrgory(PartCatrgoryID),
	--价格ID
	PartPriceID VARCHAR(20) NOT NULL REFERENCES tblPartPrice(PartPriceID),
	--供应商名称 ， 暂且不要供应商表
	SupplierName NVARCHAR(50) ,
	--汽车配件名称
	PartName NVARCHAR(50) NOT NULL,
	--汽车配件单位
   PartUnit NVARCHAR(2) NOT NULL,
	--汽车配件副标题
	PartSubtitle NVARCHAR(20),
	--图片文件夹地址
	PartImagesAddress VARCHAR(50),
	--库存数量
	PartStockAmount INT NOT NULL   check(PartStockAmount > 0),
	--汽车配件状态    0-下架 1-上架 2-删除
	PartStatus INT NOT NULL default 1,
	--制造工厂名称
	PartManufacturer NVARCHAR(50) NOT NULL,
	--创建时间
	--CREATETime DATETIME,
	--更新时间
	--modifiedTime DATETIME,
	--备注
	PartRemark NVARCHAR(200)
)


--------6.购物车明细表------
--DROP TABLE tblShoppingCartList
CREATE TABLE tblShoppingCartLIst(
	--购物车ID
	ShoppingCartListID INT IDENTITY(1,1) PRIMARY KEY,
	--客户ID
	CustomerID VARCHAR(20) NOT NULL REFERENCES tblCustomer(CustomerID),
	--汽车配件ID
	PartID VARCHAR(30) NOT NULL REFERENCES tblPart(PartID),
	--汽车配件数量
	PartAmount INT NOT NULL,
	--创建时间
	--CREATETime DATETIME,
	--更新时间
	--modifiedTime DATETIME,
	--备注
	ShoppingCartListRemark NVARCHAR(200)
)
--------7.订单表----
--只能有库存 才能生成订单
--DROP TABLE tblOrder
CREATE TABLE tblOrder(
	--订单ID
	OrderID VARCHAR(20) NOT NULL PRIMARY KEY,
	--用户ID
	CustomerID VARCHAR(20) NOT NULL REFERENCES tblCustomer(CustomerID),
	--地址ID
	CustomerAddressID INT NOT NULL REFERENCES tblCustomerAddress(CustomerAddressID),
	--实际付款金额
	Payment money NOT NULL,
	--邮费
	Postage money NOT NULL,
	--订单状态 0-已下单 1-待支付 2-已支付 3-待发货 4-已发货 5-已收货
	OrderStatus INT NOT NULL default 0,
	--支付时间
	PaymentTime DATETIME NOT NULL,
	--创建时间
	--CREATETime DATETIME,
	--更新时间
	--modifiedTime DATETIME,
	--备注
	OrderRemark NVARCHAR(200)
)
--------8.雇员表-----
--DROP TABLE tblEmployee
CREATE TABLE tblEmployee(
	--雇员ID
	EmployeeID   VARCHAR(10) NOT NULL PRIMARY KEY,
	--雇员名称
	EmployeeName NVARCHAR(10) NOT NULL UNIQUE,
	-- 雇员类型
	EmployeeType  NVARCHAR(5) NULL,
	--雇员登录名称
	EmployeeLoginName VARCHAR(20) NOT NULL UNIQUE,
	--雇员密码
	EmployeePassword VARCHAR(20) NOT NULL,
	-- 雇员手机
	--EmployeePhone VARCHAR(11) NULL,
	-- 雇员身份证号
	--EmployeeIdentityCard  char(18) NULL,
	--备注
	EmployeeRemark  NVARCHAR(200)
)

--------9.订单明细-----
--DROP TABLE tblOrderDetail
CREATE TABLE tblOrderDetail(
	--订单明细ID
	OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
	--商品ID
	PartID VARCHAR(30) NOT NULL REFERENCES tblPart(PartID),
	--订单ID
	OrderID VARCHAR(20) NOT NULL REFERENCES tblOrder(OrderID),
	--交易单价 , 当时交易时候的价格
	TransactionPrice money NOT NULL,
	--商品数量
	TransactionAmount INT NOT NULL,
	--创建时间
	--CREATETime DATETIME,
	--更新时间
	--modifiedTime DATETIME,
	--备注
	OrderDetailRemark NVARCHAR(200)
)

--------10.订单处理表-----
--DROP TABLE tblOrderHandle
CREATE TABLE tblOrderHandle(
	--订单处理ID
	OrderHandleID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	--订单ID
	OrderID VARCHAR(20) NOT NULL REFERENCES tblOrder(OrderID),
	--雇员ID
	EmployeeID VARCHAR(10) NOT NULL REFERENCES tblEmployee(EmployeeID),
	--处理时间
	OrderHandleTime DATETIME,
	--处理结果  0-审核未通过(未支付) 1-审核通过(已支付) 2-生成发货单   3-发货
	OrderHandleResult INT NOT NULL default 0,
	--备注
	OrderHandleRemark NVARCHAR(200)
)


--------11.商品入库表-----
--DROP TABLE tblProductInbound
CREATE TABLE tblProductInbound(
	--商品ID
	PartID VARCHAR(30) NOT NULL REFERENCES tblPart(PartID),
	--雇员ID
	EmployeeID VARCHAR(10) NOT NULL REFERENCES tblEmployee(EmployeeID),
	--入库时间
	InboundTime DATETIME NOT NULL,
	--入库数量
	InboundAmount INT NOT NULL,
	--备注
	PartInboundRemark NVARCHAR(200)

	PRIMARY KEY(PartID,EmployeeID)
)

/*
--------11.供应商表-----
--DROP TABLE tblSupplier
CREATE TABLE tblSupplier(
	--供应商ID
	SupplierID VARCHAR(20) NOT NULL PRIMARY KEY,
	--供应商名称
	SupplierName NVARCHAR(20) NOT NULL UNIQUE,
	--供应商电话
	SupplierPhone NVARCHAR(20) NOT NULL，
	--备注
	SupplierRemark NVARCHAR(200)
)
*/
