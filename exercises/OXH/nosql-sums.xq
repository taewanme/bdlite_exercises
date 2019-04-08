import module namespace text = "oxh:text";
import module namespace kv = "oxh:kv";

for $y in kv:collection-avroxml("/Load1",kv:depth-descendants-only())

let $teller := xs:string($y/teller)

group by $teller

return text:put-text("Teller: " || $teller || " Num Transactions: " || fn:count($y) || " Total Amount: " || fn:sum($y/sum))



