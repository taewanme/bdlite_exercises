import module namespace xmlf = "oxh:xmlf";
import module namespace text = "oxh:text"; 

declare
   %oracle:put
   %oracle-property:targetTable('books')
   %oracle:columns('title','lang','category','year','price','author')
   %oracle-property:connection.user('BDA')
   %oracle-property:connection.password('welcome1')
   %oracle-property:connection.url('jdbc:oracle:thin:@//localhost:1521/orcl')
function local:myPut($c1, $c2, $c3, $c4, $c5, $c6) external;


for $x in xmlf:collection("books.xml", "book")

for $y in $x/author

return local:myPut($x/title,$x/title/@lang,$x/@category,$x/year,$x/price,$y)


