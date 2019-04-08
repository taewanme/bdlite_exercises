sqlplus /nolog << SQL
connect BDA/welcome1@orcl

select count(*) from books;
truncate table books;
select count(*) from books;
exit;

SQL

hadoop fs -rm -r books4

hadoop jar $OXH_HOME/lib/oxh.jar ./books3.xq -output ./books4

