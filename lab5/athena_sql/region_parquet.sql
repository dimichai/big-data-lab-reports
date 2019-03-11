CREATE EXTERNAL TABLE region(
R_RegionKey int ,
R_Name varchar(64) ,
R_Comment varchar(160) ,
skip varchar(64)
)
STORED AS PARQUET
LOCATION 's3://group10-lab5/region/'
tblproperties ("parquet.compress"="SNAPPY");