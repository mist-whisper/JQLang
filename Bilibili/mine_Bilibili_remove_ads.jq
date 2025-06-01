# 引用地址：https://kelee.one/Resource/JQLang/Bilibili/mine_Bilibili_remove_ads.jq

.data |= (
    del(.answer, .live_tip, .vip_section, .vip_section_v2, .modular_vip_section) | 
    .vip_type = 2 | 
    .vip |= if . != null and .status == 0 
        then . + { status: 1, type: 2, due_date: 9005270400000, role: 15 }
        else . 
    end | 
    if .sections_v2 then .sections_v2 = 
    [
        {
            "items": [
                {
                    "id": 396,
                    "title": "离线缓存",
                    "uri": "bilibili://user_center/download",
                    "icon": "http://i0.hdslb.com/bfs/archive/5fc84565ab73e716d20cd2f65e0e1de9495d56f8.png",
                    "common_op_item": {}
                },
                {
                    "id": 397,
                    "title": "历史记录",
                    "uri": "bilibili://user_center/history",
                    "icon": "http://i0.hdslb.com/bfs/archive/8385323c6acde52e9cd52514ae13c8b9481c1a16.png",
                    "common_op_item": {}
                },
                {
                    "id": 3072,
                    "title": "我的收藏",
                    "uri": "bilibili://user_center/favourite",
                    "icon": "http://i0.hdslb.com/bfs/archive/d79b19d983067a1b91614e830a7100c05204a821.png",
                    "common_op_item": {}
                }
            ],
            "style": 1,
            "button": {}
        },
        {
            "title": "更多服务",
            "items": [
                {
                    "id": 410,
                    "title": "设置",
                    "uri": "bilibili://user_center/setting",
                    "icon": "http://i0.hdslb.com/bfs/archive/e932404f2ee62e075a772920019e9fbdb4b5656a.png",
                    "common_op_item": {}
                }
            ],
            "style": 2,
            "button": {}
        }
    ] end | 
    if .ipad_sections then .ipad_sections = 
    [
        {
            "id": 747,
            "title": "离线缓存",
            "uri": "bilibili://user_center/download",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/9bd72251f7366c491cfe78818d453455473a9678.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        },
        {
            "id": 748,
            "title": "历史记录",
            "uri": "bilibili://user_center/history",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/83862e10685f34e16a10cfe1f89dbd7b2884d272.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        },
        {
            "id": 749,
            "title": "我的收藏",
            "uri": "bilibili://user_center/favourite",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/6ae7eff6af627590fc4ed80c905e9e0a6f0e8188.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        }
    ] end | 
    if .ipad_upper_sections then .ipad_upper_sections = 
    [
        {
            "id": 752,
            "title": "创作首页",
            "uri": "/uper/homevc",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/d20dfed3b403c895506b1c92ecd5874abb700c01.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        }
    ] end | 
    if .ipad_recommend_sections then .ipad_recommend_sections = 
    [
        {
            "id": 755,
            "title": "我的关注",
            "uri": "bilibili://user_center/myfollows",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/fdd7f676030c6996d36763a078442a210fc5a8c0.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        },
        {
            "id": 756,
            "title": "我的消息",
            "uri": "bilibili://link/im_home",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/e1471740130a08a48b02a4ab29ed9d5f2281e3bf.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        }
    ] end | 
    if .ipad_more_sections then .ipad_more_sections = 
    [
        {
            "id": 764,
            "title": "设置",
            "uri": "bilibili://user_center/setting",
            "icon": "http://i0.hdslb.com/bfs/feed-admin/34e8faea00b3dd78977266b58d77398b0ac9410b.png",
            "mng_resource": { "icon_id": 0, "icon": "" }
        }
    ] end
)