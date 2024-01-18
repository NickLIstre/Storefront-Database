create schema storefront;
create table storefront.Customer (
	Fname varchar(15) NOT NULL,
	Minit char,
	Lname varchar(15) NOT NULL,
	Username varchar(20) NOT NULL,
	Email varchar(20) NOT NULL,
	Password varchar(20) NOT NULL,
	Address varchar(30),
	constraint CustPK primary key (Username));
create table storefront.Employee (
	Fname varchar(15) NOT NULL,
	Minit char,
	Lname varchar(15) NOT NULL,
	Username varchar(20) NOT NULL,
	Email varchar(20) NOT NULL,
	Password varchar(20) NOT NULL,
	constraint EmpPK primary key (Username));
create table storefront.Categories (
	CategoryID varchar(10) NOT NULL,
	constraint CatPK primary key (CategoryID));
create table storefront.Storage (
	CategoryID varchar(10) NOT NULL,
	Capacity int NOT NULL,
	Speed int NOT NULL,
	FormFactor varchar(15) NOT NULL,
	constraint StoragePK primary key (CategoryID),
	constraint SubcatFK foreign key (CategoryID) references Categories (CategoryID)
		on update cascade);
create table storefront.CPUs (
	CategoryID varchar(10) NOT NULL,
	Cores int NOT NULL,
	ClockSpeed int NOT NULL,
	Socket varchar(10) NOT NULL,
	constraint CPUsPK primary key (CategoryID),
	constraint SubcatFK foreign key (CategoryID) references Categories (CategoryID)
		on update cascade);
create table storefront.Motherboards (
	CategoryID varchar(10) NOT NULL,
	Socket varchar(10) NOT NULL,
	MaxRAM int NOT NULL,
	constraint MotherboardsPK primary key (CategoryID),
	constraint motherboardsFK foreign key (CategoryID), references Categories (CategoryID)
		On update cascade);
create table storefront.Products (
	SKU varchar(8) NOT NULL,
	Name varchar(15),
	SubcategoryID varchar(10),
	Stock int,
	Price decimal(5,2),
	constraint ProdPK primary key (SKU),
	constraint ProdFK foreign key (SubCategoryID) references Subcategories (SubcategoryID)
		on update cascade);
create table storefront.Items (
	SKU varchar(8) NOT NULL,
	SerialNum varchar(8) NOT NULL,
	constraint UProdPK primary key (SerialNum),
	constraint UProdFK foreign key (SKU) references Products (SKU)
		on update cascade);
create table storefront.OrderHist (
	Username varchar(20) NOT NULL,
	SKU varchar(8) NOT NULL,
	AmntBought int,
	constraint OrdersPK primary key (Username),
	constraint OrdersFK foreign key (Username) references Customer (Username));
create table storefront.Cart (
	Username varchar(20) NOT NULL,
	SerialNum varchar(8) NOT NULL,
	Amount int,
	constraint CartPK primary key (Username),
	constraint CartFK foreign key (Username) references Customer (Username));
create table storefront.Sales (
SKU varchar(8) NOT NULL,
Discount varchar(2) NOT NULL,
constraint SalesPK primary key (SKU),
constraint SalesFK foreign key (SKU) references Products (SKU));
