.data |= map(select(
  .type != "DISCOVERY_HEADER" 
  or (
    .type == "DISCOVERY_HEADER" 
    and (.data |= map(select(
      (.url | contains("podcast-newforce-collection") | not) 
      and 
      (.rightContent.text as $t | $t != "分类" and $t != "朋友在听" and $t != "新节目广场" and $t != "付费精品节目单")
    ))) 
    and (.data | length > 0)
  )
))
