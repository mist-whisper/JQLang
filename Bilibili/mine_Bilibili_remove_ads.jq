.data |= (
    # 1. 删除无用字段
    del(
        .answer,
        .live_tip,
        .vip_section,
        .vip_section_v2,
        .modular_vip_section
    )
    |
    # 2. 强制设置 vip_type 为 2
    .vip_type = 2
    |
    # 3. 根据当前日期选择 VIP 图标，并覆盖 .vip 对象
    (
        # 获取当前本地时间的月/日
        now
        | localtime
        | { month: .month, day: .day }
    ) as $today
    |
    # 如果今天是 6 月 1 日，则使用节日专属图标，否则使用默认图标
    (
        if ($today.month == 6 and $today.day == 1) then
            "https://i0.hdslb.com/bfs/bangumi/kt/629e28d4426f1b44af1131ade99d27741cc61d4b.png"
        else
            "https://i0.hdslb.com/bfs/vip/52f60c8bdae8d4440edbb96dad72916022adf126.png"
        end
    ) as $vip_img
    |
    # 用完整的“百年大会员”对象覆盖 .vip
    .vip = {
        status:           1,
        type:             2,
        vip_pay_type:     0,
        due_date:         9005270400000,
        tv_vip_status:    1,
        tv_vip_pay_type:  0,
        tv_due_date:      9005270400000,
        role:             15,
        theme_type:       0,
        nickname_color:   "#FB7299",
        avatar_subscript:       1,
        avatar_subscript_url:   "",
        avatar_icon: {
            icon_resource: {}              # 保持空结构
        },
        label: {
            path:                  "",
            text:                  "百年大会员",
            label_theme:           "hundred_annual_vip",
            text_color:            "#FFFFFF",
            bg_style:              1,
            bg_color:              "#FB7299",
            border_color:          "",
            use_img_label:         true,
            image:                 $vip_img,
            img_label_uri_hans:    "",
            img_label_uri_hant:    "",
            img_label_uri_hans_static: $vip_img,
            img_label_uri_hant_static: $vip_img
        }
    }
    |
    # 4. 如果存在 sections_v2，就用新数组覆盖（只保留“离线缓存”、“历史记录”、“我的收藏”、“设置”）
    if .sections_v2 then
        .sections_v2 = [
            {
                items: [
                    {
                        id:             396,
                        title:          "离线缓存",
                        uri:            "bilibili://user_center/download",
                        icon:           "http://i0.hdslb.com/bfs/archive/5fc84565ab73e716d20cd2f65e0e1de9495d56f8.png",
                        common_op_item: {}
                    },
                    {
                        id:             397,
                        title:          "历史记录",
                        uri:            "bilibili://user_center/history",
                        icon:           "http://i0.hdslb.com/bfs/archive/8385323c6acde52e9cd52514ae13c8b9481c1a16.png",
                        common_op_item: {}
                    },
                    {
                        id:             3072,
                        title:          "我的收藏",
                        uri:            "bilibili://user_center/favourite",
                        icon:           "http://i0.hdslb.com/bfs/archive/d79b19d983067a1b91614e830a7100c05204a821.png",
                        common_op_item: {}
                    }
                ],
                style:  1,
                button: {}
            },
            {
                title: "更多服务",
                items: [
                    {
                        id:             410,
                        title:          "设置",
                        uri:            "bilibili://user_center/setting",
                        icon:           "http://i0.hdslb.com/bfs/archive/e932404f2ee62e075a772920019e9fbdb4b5656a.png",
                        common_op_item: {}
                    }
                ],
                style:  2,
                button: {}
            }
        ]
    else
        .
    end
    |
    # 5. 如果存在 ipad_more_sections，就用新数组覆盖（只保留“设置”）
    if .ipad_more_sections then
        .ipad_more_sections = [
            {
                id:             764,
                title:          "设置",
                uri:            "bilibili://user_center/setting",
                icon:           "http://i0.hdslb.com/bfs/feed-admin/34e8faea00b3dd78977266b58d77398b0ac9410b.png",
                mng_resource:   { icon_id: 0, icon: "" }
            }
        ]
    else
        .
    end
)