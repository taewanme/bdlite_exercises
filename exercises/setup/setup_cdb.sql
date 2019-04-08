connect / as SYSDBA

alter session set container=orcl;



drop user BDA cascade;

drop tablespace BDA;

CREATE TABLESPACE BDA DATAFILE '/u01/app/oracle/oradata/cdb/orcl/BDA.dbf' SIZE 250M reuse AUTOEXTEND ON nologging;
CREATE USER BDA
      IDENTIFIED BY welcome1
      CONTAINER=CURRENT
      DEFAULT TABLESPACE BDA
      QUOTA UNLIMITED ON BDA;
  
GRANT create procedure, create session, advisor, olap_user, unlimited tablespace to BDA CONTAINER=CURRENT; 


grant execute on SYS.UTL_FILE to BDA;
create or replace directory OSCH_BIN_PATH as '/u01/connectors/osch/bin';

grant CREATE ANY DIRECTORY to BDA;
grant read, execute on directory OSCH_BIN_PATH to BDA;

GRANT CREATE MINING MODEL TO BDA;
GRANT RQADMIN to BDA;


connect BDA/welcome1@orcl

create or replace directory EXTERNAL_DIR as '/home/oracle/exercises/OSCH/etc';

@ORA_CRM

exit

