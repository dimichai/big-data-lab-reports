CREATE EXTERNAL TABLE part(
P_PartKey int ,
P_Name varchar(64) ,
P_Mfgr varchar(64) ,
P_Brand varchar(64) ,
P_Type varchar(64) ,
P_Size int ,
P_Container varchar(64) ,
P_RetailPrice decimal(13, 2) ,
P_Comment varchar(64) ,
skip varchar(64)
)
STORED AS PARQUET
LOCATION 's3://group10-lab5/part/'
tblproperties ("parquet.compress"="SNAPPY");

