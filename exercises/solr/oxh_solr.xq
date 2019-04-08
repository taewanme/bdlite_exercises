(: flags:disabled(include.solr=false;hd=1,2,3,4,100) :)
(: -Xhelper oracle.hadoop.xquery.adapter.solr.SolrTestHelper :)

(:
   PREREQUISITES

   1. Configure Solr collection
      solrctl instancedir --generate $HOME/solr_configs
      solrctl instancedir --create oxh_collection_1 $HOME/solr_configs
      solrctl collection --create oxh_collection_1 -s 1

   2. Set the following Hadoop configuration properties
      oracle.hadoop.xquery.solr.loader.zk-host = /solr
      oracle.hadoop.xquery.solr.loader.collection = oxh_collection_1
      oracle.hadoop.xquery.solr.loader.go-live = true 

   EXPECTED RESULTS 

:)

import module "oxh:text";
import module "oxh:solr";

for $i in text:collection(
  oxh:property("oxh_tck.xq.in") || "/part*"
)

let $f := tokenize($i, ",")
let $cust_id := xs:string($f[1])
let $cust_n := concat(xs:string($f[15]),' ',xs:string($f[16]))
let $age := xs:integer($f[22])
let $prof := xs:string($f[20])

return solr:put(
  <doc>
    <field name="id">{ $cust_id }</field>
    <field name="name">{ $cust_n }</field> 
    <field name="title">{ $prof }</field> 
  </doc>
)
