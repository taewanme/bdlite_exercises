#!/bin/sh

sqlplus /nolog <<SQL
connect bda/welcome1@orcl

DROP TABLE BDA.ODI_HIVE;
 
  CREATE TABLE "BDA"."ODI_HIVE" 
   (	"CUSTOMER_ID" VARCHAR2(4000 BYTE), 
	"CREDIT_CARD_LIMITS" NUMBER, 
	"CREDIT_BALANCE" NUMBER, 
	"N_MORTGAGES" NUMBER, 
	"MORTGAGE_AMOUNT" NUMBER
   ) ORGANIZATION EXTERNAL 
    ( TYPE ORACLE_HIVE
      DEFAULT DIRECTORY "EXTERNAL_DIR"
      ACCESS PARAMETERS 
        ( 
        com.oracle.bigdata.tablename=default.consolidated_buffer
        ) 
    ) 
;

SQL

