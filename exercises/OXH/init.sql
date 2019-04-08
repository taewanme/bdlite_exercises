CREATE TEMPORARY FUNCTION xml_query AS 'oracle.hadoop.xquery.hive.OXMLQueryUDF';
CREATE TEMPORARY FUNCTION xml_query_as_bigint AS 'oracle.hadoop.xquery.hive.OXMLQueryBigintUDF';
CREATE TEMPORARY FUNCTION xml_query_as_int AS 'oracle.hadoop.xquery.hive.OXMLQueryIntUDF';
CREATE TEMPORARY FUNCTION xml_query_as_smallint AS 'oracle.hadoop.xquery.hive.OXMLQuerySmallintUDF';
CREATE TEMPORARY FUNCTION xml_query_as_tinyint AS 'oracle.hadoop.xquery.hive.OXMLQueryTinyintUDF';
CREATE TEMPORARY FUNCTION xml_query_as_float AS 'oracle.hadoop.xquery.hive.OXMLQueryFloatUDF';
CREATE TEMPORARY FUNCTION xml_query_as_double AS 'oracle.hadoop.xquery.hive.OXMLQueryDoubleUDF';
CREATE TEMPORARY FUNCTION xml_query_as_boolean AS 'oracle.hadoop.xquery.hive.OXMLQueryBooleanUDF';
CREATE TEMPORARY FUNCTION xml_query_as_string AS 'oracle.hadoop.xquery.hive.OXMLQueryStringUDF';
CREATE TEMPORARY FUNCTION xml_exists AS 'oracle.hadoop.xquery.hive.OXMLExists';
CREATE TEMPORARY FUNCTION xml_table AS 'oracle.hadoop.xquery.hive.OXMLTableUDTF';

