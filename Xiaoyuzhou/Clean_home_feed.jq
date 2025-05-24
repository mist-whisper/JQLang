.data |= map(
  select(.type != "DISCOVERY_HEADER") 
  + 
  (if .type == "DISCOVERY_HEADER" and (.data | type == "array") then
     .data |= map(select(
       (.rightContent.text != "分类") and
       (.rightContent.text != "朋友在听") and
       (.rightContent.text != "新节目广场") and
       (.rightContent.text != "付费精品节目单") and
       (.url | contains("podcast-newforce-collection") | not)
     )) 
     | select(.data | length > 0)
   else . end)
)