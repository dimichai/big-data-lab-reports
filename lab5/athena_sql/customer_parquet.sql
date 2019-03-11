CREATE EXTERNAL TABLE customer(
C_CustKey int ,
C_Name varchar(64) ,
C_Address varchar(64) ,
C_NationKey int ,
C_Phone varchar(64) ,
C_AcctBal decimal(13, 2) ,
C_MktSegment varchar(64) ,
C_Comment varchar(120) ,
skip varchar(64)
) 
STORED AS PARQUET
LOCATION 's3://group10-lab5/customer/'
tblproperties ("parquet.compress"="SNAPPY");