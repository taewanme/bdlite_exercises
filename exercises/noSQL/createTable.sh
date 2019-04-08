#!/bin/sh

mkdir -p /u01/nosql/test/exttab/data/


sqlplus sys/welcome1@orcl as sysdba<<EOF
  create or replace directory NOSQL_BIN_DIR as '/home/oracle/exercises/noSQL/exttab/bin';
  create or replace directory EXT_TAB as '/u01/nosql/test/exttab/data';
  grant read, write, execute on directory NOSQL_BIN_DIR to BDA;
  grant read, write, execute on directory EXT_TAB to BDA;
  GRANT EXECUTE ON SYS.UTL_FILE TO BDA;
  exit;
EOF

sqlplus bda/welcome1@orcl <<EOF

CREATE TABLE external_nosql (name VARCHAR2(30), type VARCHAR2(20), text VARCHAR2(40)) 
   ORGANIZATION EXTERNAL
    (type oracle_loader
    default directory EXT_TAB
    access parameters (records delimited by newline preprocessor nosql_bin_dir:'nosql_stream' fields terminated by '|')
  LOCATION ('nosql.dat'))
  PARALLEL;
  exit;
EOF
