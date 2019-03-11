CREATE EXTERNAL TABLE orders(
O_OrderKey int ,
O_CustKey int ,
O_OrderStatus varchar(64) ,
O_TotalPrice decimal(13, 2) ,
O_OrderDate date ,
O_OrderPriority varchar(15) ,
O_Clerk varchar(64) ,
O_ShipPriority int ,
O_Comment varchar(80) ,
skip varchar(64)
)
STORED AS PARQUET
LOCATION 's3://group10-lab5/orders/'
tblproperties ("parquet.compress"="SNAPPY");

