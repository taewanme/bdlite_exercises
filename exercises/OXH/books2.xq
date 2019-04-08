import module namespace xmlf = "oxh:xmlf";
import module namespace text = "oxh:text";
for $x in xmlf:collection("books.xml", "book")
where $x/price<30
return text:put-text($x/title || ' $' || $x/price)

