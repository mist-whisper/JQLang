.data[0].data |= map(
  select(
    .rightContent.text != "分类"
    and .rightContent.text != "朋友在听"
    and .rightContent.text != "播客寻宝"
  )
)