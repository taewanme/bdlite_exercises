CREATE TABLE bookstore (title STRING, category STRING, lang STRING, year INT, authors STRING, numauthors INT, price FLOAT)
ROW FORMAT
SERDE 'oracle.hadoop.xquery.hive.OXMLSerDe'
STORED AS
INPUTFORMAT 'oracle.hadoop.xquery.hive.OXMLInputFormat'
OUTPUTFORMAT 'oracle.hadoop.xquery.hive.OXMLOutputFormat'
TBLPROPERTIES(
"oxh-elements" = "book",
"oxh-column.title" = "./title",
"oxh-column.category" = "./@category",
"oxh-column.lang" = "./title/@lang",
"oxh-column.year" = "./year",
"oxh-column.authors" = "fn:serialize(<AUTHORS>{./author}</AUTHORS>)",
"oxh-column.numauthors" = "fn:count(./author)",
"oxh-column.price" = "./price"

);

LOAD DATA LOCAL INPATH 'books.xml' OVERWRITE INTO TABLE bookstore;

exit;
