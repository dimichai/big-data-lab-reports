CREATE EXTERNAL TABLE partsupp(
PS_PartKey int ,
PS_SuppKey int ,
PS_AvailQty int ,
PS_SupplyCost decimal(13, 2) ,
PS_Comment varchar(200) ,
skip varchar(64)
)
STORED AS PARQUET
LOCATION 's3://group10-lab5/partsupp/'
tblproperties ("parquet.compress"="SNAPPY");

