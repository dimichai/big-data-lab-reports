CREATE EXTERNAL TABLE lineitem(
L_OrderKey int ,
L_PartKey int ,
L_SuppKey int ,
L_LineNumber int ,
L_Quantity int ,
L_ExtendedPrice decimal(13, 2) ,
L_Discount decimal(13, 2) ,
L_Tax decimal(13, 2) ,
L_ReturnFlag varchar(64) ,
L_LineStatus varchar(64) ,
L_CommitDate date ,
L_ReceiptDate date ,
L_ShipInstruct varchar(64) ,
L_ShipMode varchar(64) ,
L_Comment varchar(64) ,
skip varchar(64)
)
PARTITIONED BY (L_ShipDate date)
STORED AS PARQUET
LOCATION 's3://group10-lab5/partitioned/date-strategy/lineitem'
tblproperties ("parquet.compress"="SNAPPY");

