.data[0].data |= map(
  select(
    (.rightContent.text != "分类")
    and (.rightContent.text != "朋友在听")
    and (.rightContent.text != "新节目广场")
    and (.rightContent.text != "付费精品节目单")
    and ((.url? | tostring | test("podcast-newforce-collection")) | not)
  )
)