connect / as SYSDBA

drop table BDA.ORACLE_CRM;
drop table BDA.ODI_HIVE;

drop directory OSCH_BIN_PATH ;
drop directory EXTERNAL_DIR ;

drop user BDA cascade;

DROP TABLESPACE BDA INCLUDING CONTENTS AND DATAFILES;

exit

