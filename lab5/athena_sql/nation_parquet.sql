CREATE EXTERNAL TABLE nation(
N_NationKey int ,
N_Name varchar(64) ,
N_RegionKey int ,
N_Comment varchar(160) ,
skip varchar(64)
)
STORED AS PARQUET
LOCATION 's3://group10-lab5/nation/'
tblproperties ("parquet.compress"="SNAPPY");