import module namespace text = "oxh:text";
import module namespace kv = "oxh:kv";



for $y in kv:collection-avroxml("/Load1",kv:depth-descendants-only())

for $x in fn:unparsed-text-lines("crm_data.csv")

let $keystr := fn:tokenize(xs:string($y/kv:key()),"\s*/\s*")

let $cust_id := $keystr[3]

let $split := fn:tokenize($x, "\s*,\s*")

(:
 CUSTOMER_ID,LAST,FIRST,STATE,REGION,SEX,PROFESSION,BUY_INSURANCE,AGE,HAS_CHILDREN,SALARY,N_OF_DEPENDENTS,CAR_OWNERSHIP,HOUSE_OWNERSHIP,TIME_AS_CUSTOMER,MARITAL_STATUS,LTV,LTV_BIN 
:)

let $crmcust_id := $split[1]
let $first := $split[2]
let $last := $split[3]
let $ltvbin := $split[18]



where $crmcust_id eq $cust_id


(: group by $crmcust_id :)

return text:put-text(" name: " || $last || ", " || $first ||" cust: " || $cust_id || " Number of Trans: " || fn:count($y) || " Rating: " || $ltvbin || " Totals : $"  || xs:string(fn:sum($y/sum)))

