import module namespace text = "oxh:text";
import module namespace kv = "oxh:kv";

for $y in kv:collection-avroxml("/Load1",kv:depth-descendants-only())

let $keystr := fn:tokenize(xs:string($y/kv:key()),"\s*/\s*")

let $cust_id := $keystr[3]

where $cust_id eq "CU998" 

group by $cust_id

return text:put-text(" cust: " || $cust_id || " Number of Trans: " || fn:count($y) || " Totals : $" || xs:string(fn:sum($y/sum))) 

(: 
return text:put-text(" cust: " || $cust_id || " Amount : $" || xs:string($y/sum)) :)



