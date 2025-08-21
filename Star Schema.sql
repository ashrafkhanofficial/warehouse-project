-- Star Schema of superstore data
create database superstore;
use superstore;

-- Customer Dimension Table
create table Customer (
Customer_ID varchar(20) not null
	constraint customer_pk primary key,
Customer_Name varchar(50),
Segment varchar(20),
);

-- Order dimension table
create table Orders(
Order_id varchar(20) not null
	constraint order_pk primary key,
Order_Date date,
Ship_Date date,
Country varchar(20),
City varchar(20),
Stat_e varchar(20),
Postal_code varchar(10),
Region varchar(20)
);

-- Product Dimension Table
create table Products (
Product_ID varchar(20) not null
	constraint product_pk primary key,
Product_Name varchar(100),
Sub_category varchar(50),
Category varchar(50)
);

-- Fact table of superstore
create table Sales (
Fact_ID int 
	constraint sales_pk primary key,
Order_ID varchar(20) not null,
Customer_ID varchar(20) not null,
Product_ID varchar(20) not null,
Sales decimal(10,2),
Quantity int,
Discount decimal(5,2),
Profit decimal(10,2),
constraint sales_cus_fk	
	foreign key (Customer_ID) references Customer(Customer_ID),
constraint sales_prod_fk
	foreign key (Product_ID) references Products(Product_ID),
constraint sales_ord_fk
	foreign key (Order_ID) references Orders(Order_ID)
);




