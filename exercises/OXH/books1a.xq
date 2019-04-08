import module namespace xmlf = "oxh:xmlf";
import module namespace text = "oxh:text"; 

for $x in xmlf:collection("books.xml")/bookstore/book/title

return text:put-xml($x)


