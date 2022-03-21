<?xml version="1.0" encoding="utf-8"?>
<orderMessage>
  <orderType>${BODY.orderType}</orderType>
  <requestId>${BODY.requestId}</requestId>
  <customerId>${BODY.customerId}</customerId>
  <lines>
   <#list BODY.lines as line>
   <line>
      <productId>${line.productId}</productId>
      <quantity>${line.quantity}</quantity>
    </line>
      </#list>  
  </lines>
</orderMessage>