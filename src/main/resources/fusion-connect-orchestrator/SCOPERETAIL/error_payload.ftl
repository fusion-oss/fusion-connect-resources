{
   "status": "${status}",
<#switch status>
  <#case "EVENT_NOT_FOUND">
   "reason": "Event not found"
     <#break>
  <#case "DUPLICATE_EVENT">
   "reason": "Duplicate message found"
     <#break>
  <#case "PARSE_ERROR">
     <#if errors?is_enumerable && errors?has_content>
   "reason": "Unable to parse <#list errors as field>${field}<#sep>, </#sep></#list> message headers."
	 <#elseif errors??>
   "reason": "${errors}"
     </#if>
     <#break>
  <#case "MISSING_MANDATORY_VALUE">
     <#if errors?has_content>
   "reason": "Mandatory header <#list errors as field>${field}<#sep>, </#sep></#list> is missing."
	 </#if>
     <#break>	
  <#case "INVALID_VALUE">
     <#if errors?has_content>
   "reason": "Invalid value in <#list errors as field>${field}<#sep>, </#sep></#list> header."
	 </#if>
     <#break>	 
  <#default>
   "reason": "Invalid message"
</#switch>   
  "failedMessagePayload": ${payload?js_string}
}