--------------------------------------------------------
--  DDL for Table ODI_HIVE
--------------------------------------------------------

  CREATE TABLE "BDA"."ODI_HIVE" 
   (	"CUSTOMER_ID" VARCHAR2(4000 BYTE), 
	"CREDIT_CARD_LIMITS" NUMBER, 
	"CREDIT_BALANCE" NUMBER, 
	"N_MORTGAGES" NUMBER, 
	"MORTGAGE_AMOUNT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BDA" ;
--------------------------------------------------------
--  DDL for Index ODI_HIVE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BDA"."ODI_HIVE_PK" ON "BDA"."ODI_HIVE" ("CUSTOMER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 167 COMPUTE STATISTICS NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BDA" ;
--------------------------------------------------------
--  Constraints for Table ODI_HIVE
--------------------------------------------------------

  ALTER TABLE "BDA"."ODI_HIVE" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "BDA"."ODI_HIVE" ADD CONSTRAINT "ODI_HIVE_PK" PRIMARY KEY ("CUSTOMER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 167 COMPUTE STATISTICS NOLOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BDA"  ENABLE;

