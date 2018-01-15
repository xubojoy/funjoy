//
//  Constant.h
//  styler
//
//  Created by System Administrator on 13-5-10.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import "UIImage+imagePlus.h"

#define navigation_height     64
#define status_bar_height     20
#define tabbar_height         51
#define general_margin        15
#define general_cell_height   44
#define reward_activity_banner_height   50
#define general_padding       10
#define general_space         20
#define general_space2         30
#define general_height        40
#define general_height_2      30
#define splite_line_height    0.5
#define main_vc_right_space     83
#define common_height        screen_width*1/2

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define screen_width          [UIScreen mainScreen].bounds.size.width
#define screen_height          [UIScreen mainScreen].bounds.size.height
#define general_screen_width_320  320
#define main_content_height   [UIScreen mainScreen].bounds.size.height - self.header.frame.size.height
#define bottomY(view)         view.frame.size.height + view.frame.origin.y
#define leftX(view)           view.frame.size.width + view.frame.origin.x
#define IOS6                  ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)?YES:NO
#define IOS7                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)?YES:NO
#define IOS8                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)?YES:NO
#define loading_frame         CGRectMake(0, 100, screen_width, 40)
#define red_dot_width          7



//字体大小
#define font_10_size  10
#define font_11_size   11
#define font_12_size     12
#define font_13_size 13
#define font_14_size   14
#define font_15_size 15
#define font_16_size       16
#define font_17_size  17
#define font_18_size    18
#define font_24_size   24
//色值
#define black_text_color          @"#222222"
#define gray_text_color           @"#666666"
#define gray_place_holder_color   @"#dcdcdc"
#define orange_text_color         @"#ff532b"
#define white_text_color          @"#ffffff"
#define light_gray_text_color     @"#999999"
#define lighter_gray_text_color   @"#cccccc"
#define lighter_2_gray_color      @"#f0f0f0"
#define backgroud_color           @"#f6f6f6"
#define common_bg_color           @"#f4f4f4"
#define head_backgroud_color      @"#e7523e"
#define searchBar_textField_background_color    @"#F67365"
#define splite_line_color         @"#cccccc"
#define red_color                 @"#cc0000"
#define blue_color                @"#3399ff"
#define red_default_color         @"#ea0000"
#define red_select_color          @"#cc3300"
#define green_background_color    @"#7cc576"
#define light_gray_color          @"#f2f2f2"
#define light_gray_2_color        @"#e5e5e5"
#define green_order_status_backgroud_color  @"#7cc576"
#define gray_order_status_backgroud_color   @"#cccccc"
#define blue_order_status_backgroud_color   @"#90c4f5"
#define orange_order_status_backgroud_color @"#ff9933"
#define common_btn_bg_color       @"#fc9a35"
#define splite_vertical_line_color  @"#6c6c6c"
//#7cbb73
#define common_splite_line_color  @"#eeeeee"
#define green_common_color        @"#49c28d"
#define black_common_color        @"#000000"
#define orange_common_color       @"#ff9900"
#define gray_common_color         @"#f2f2f2"
#define gray_line_color           @"#434343"
#define orange_notifi_color       @"#eb6100"
#define gray_placeholder_color    @"#f5f5f5"
#define common_content_color      @"#333333"
#define gray_color                @"#888888"
#define green_light_color         @"#49c28d"
#define green_dark_color          @"#32946b"
#define service_green_color       @"#7CCC2B"
#define service_blue_color        @"#2B96FA"
#define light_blue_color          @"#cae9dd"

#define deep_green_color          @"#00736d" //墨绿色
#define coffee_color              @"#ac6a00" //咖啡出色
#define header_color              @"#55000000"

#define game_type_green_color     @"#107271"
#define game_type_coffee_color    @"#ab6a1a"
#define game_type_purple_color    @"#666699"
#define unselect_title_color  @"#818181"

//绿色＃7cbb73
//黑色＃000000
//橙色＃ff9900

#define account_session_from_index                1
#define account_session_from_court_detail         2
#define account_session_from_my_order_confirm     3
#define account_session_from_club_detail          4
#define account_session_from_commodity_detail     5
#define account_session_from_user_home            6
#define account_session_from_commodity_list       7
#define account_session_from_user_games_list      8
#define account_session_from_user_games_code_list      9



#define brand_cell_height   100
#define network_timeout     10
#define network_retry_count 1
//网络状态
#define network_unconnect_note      @"网络不通，请检查网络"
#define network_request_fail        @"网络不通，请联网后点击刷新"
#define network_status_loading      @"正在加载..."
#define network_status_cancel       @"正在取消..."
#define network_status_no_more      @"没有更多"
#define network_status_retry        @"网络不通，请重试"
#define network_status_refresh      @"下拉刷新..."
#define network_status_refreshing   @"正在刷新..."

#define common_page_size     20

#define user_common_styler_type  3
#define my_fav_styler_type       2
#define common_styler_type       1

#define tabbar_item_index_special_offer 0
#define tabbar_item_index_work          1
#define tabbar_item_index_contact       2
#define tabbar_item_index_me            3


//通知
#define notification_name_update_user_name                  @"updateNameNotification"
#define notification_name_update_user_avatar                @"updateAvatar"
#define notification_name_update_user_gender                @"updateGenderNotification"
#define notification_name_user_login                        @"userLogin"
#define notification_name_user_order_stylist                @"userOrder"
#define notification_name_session_update                    @"sessionUpdate"
#define notification_name_pn_account_session_from           @"accountSessionFrom"
#define notification_name_update_fav_stylist                @"removeFavstylist"
#define notification_name_paid_success_collection_stylist   @"paidSuccessCollectionStylist"
#define notification_name_receive_feedback_info             @"receiveFeedBackInfo"
#define notification_name_read_all_feedback_info            @"readAllFeedBackInfo"
#define notification_name_order_changed                     @"myOrderChanged"
#define notification_name_game_order_changed                @"myGameOrderChanged"
#define notification_name_social_account_status_changed     @"social_account_changed"
#define notification_name_update_post_queue                 @"update_post_queue"
#define notification_name_update_my_evaluations             @"update_my_evalutions"
#define notification_name_post_evaluation                   @"post_evaluaiton"
#define notification_name_update_push                       @"update_push"
#define notification_name_log_out                           @"log_out"
#define notification_name_update_has_unevaluate_order       @"update_has_unevaluation"
#define notification_name_update_has_unpayment_hdc          @"update_has_unpayment_hdc"
#define notification_name_remove_red_envelope_activity_mark   @"remove_red_envelope_activity_mark"
#define notification_name_update_work_list                  @"update_work_list"
#define notification_name_im_message_status_update          @"im_message_status_update"
#define notification_name_update_red_dot                    @"update_red_dot"
#define notification_name_user_shared_success_show_reward_activity  @"user_shared_success_show_reward_activity"
#define notification_name_reward_activity_after_input_mobile_no     @"reward_activity_after_input_mobile_no"
#define notification_name_reload_table_view                 @"reload_table_view"
#define notification_name_has_new_stylist_works             @"hasNewStylistWorks"
#define notification_name_remind_user_update_default_name   @"remindUserUpdateDefaultName"
#define notification_name_has_share_app_reward_activity     @"hasShareAppRewardActivity"
#define notification_name_chuandi_club_name                 @"传递球场name"
#define notification_name_refresh_mainVC_city_name                 @"渲染首页城市位置"
#define notification_name_load_mainVC_recommend_club        @"刷新首页推荐球场数据"
#define notification_name_refresh_order_clubvc_city        @"刷新球场预定页城市"
#define notification_name_from_city_list_refresh_mainVC_city_name   @"城市列表返回首页刷新位置"
#define notification_name_refresh_cart_commodity_count   @"刷新购物车商品数量"
#define notification_name_contact   @"传递联系人"
#define notification_name_has_unpayed_club_order         @"获取未支付的球场订单"
#define notification_name_has_unpayed_commodity_order         @"获取未支付的商品订单"
#define notification_name_has_unpayed_order_remind_main_vc         @"首页未支付订单提醒"
#define notification_name_join_game_success         @"成功加入比赛"

#define log_event_club_book                 @"球场预订"
#define log_event_club_market               @"球具商城"
#define log_event_special_offer             @"每日特价"
#define log_event_news                      @"每日头条"
#define log_event_star_video                @"明星视频"
#define log_event_golf_rules                @"高球规则"
#define log_event_best_clubs                @"球场巡礼"
#define log_event_search_clubs              @"搜索"
#define log_event_share_club_detail         @"分享球场详情页"
#define log_event_look_club_fairWayImg      @"查看球道图"
#define log_event_club_introduce            @"查看球场简介"
#define log_event_gaode_map                 @"查看高德导航"
#define log_event_immediate_order           @"立即预订"
#define log_event_confirm_order             @"确认订单"
#define log_event_cancel_order              @"取消订单"
#define log_event_immediate_pay             @"立即支付"

#define log_event_cancel_commodity_order    @"取消商品订单"
#define log_event_waitingRefund             @"申请退款"
#define log_event_confirm_receive_commodity @"确认收货"
#define log_event_immediate_pay_commodity_order  @"立即支付商品订单"
#define log_event_name_submit_new_name      @"设置新的用户名"
#define log_event_name_submit_new_psw       @"设置新密码"
#define log_event_name_submit_new_gender    @"设置性别"
#define log_event_user_info                 @"修改个人信息"
#define log_event_user_pwd                  @"修改密码"
#define log_event_share_us                  @"分享我们"
#define log_event_service_hot_line          @"在线客服"
#define log_event_complaints_hotline        @"投诉电话"
#define log_event_user_register             @"用户注册"
#define log_event_user_login                @"用户登录"
#define log_event_user_forget_pwd           @"忘记密码"
#define log_event_user_log_out              @"退出登录"
#define log_event_user_club_order           @"球场订单"
#define log_event_user_shopping_order       @"球具订单"
#define log_event_user_cart                 @"购物车"
#define log_event_setting                   @"设置"
#define log_event_creat_game                @"创建比赛"
#define log_event_creat_single_double_game  @"立即竞猜"

//页面访问

#define page_name_index           @"每日高尔夫"
#define page_name_news            @"新闻"
#define page_name_city_list       @"城市列表"
#define page_name_province_list   @"省份列表"
#define page_name_left_user_vc    @"用户数据"
#define page_name_user_regist     @"注册"
#define page_name_user_login      @"登录"
#define page_name_user_first_login      @"用户首次登录"
#define page_name_user_forget_pwd      @"找回密码"
#define page_name_user_club_order      @"用户球场订单"
#define page_name_user_shopping_order  @"用户球具订单"
#define page_name_user_cart       @"用户购物车"
#define page_name_setting         @"设置"
#define page_name_book_club       @"球场预订"
#define page_name_club_introduce  @"球场介绍"
#define page_name_player_list       @"球友列表"

#define page_name_hole_in_one     @"一杆进洞"
#define page_name_hole_in_one_detail_introduce  @"一杆进洞赛事及奖品介绍"
#define page_name_point_exchange  @"积分兑换"
#define page_name_private_service  @"私人服务"
#define page_name_game             @"游戏"
#define page_name_user_center      @"用户中心"
#define page_name_exchange_game_coins   @"兑换游戏币"

#define page_name_search_clubs_list @"搜索结果球场列表"
#define page_name_club_detail     @"球场详情页"
#define page_name_write_club_order     @"填写订单"
#define page_name_success_submit  @"提交成功"
#define page_name_order_detail    @"订单详情"
#define page_name_club_map        @"导航"
#define page_name_category_list   @"分类列表页"
#define page_name_daily_special   @"每日特价"
#define page_name_delivery_info   @"物流信息"
#define page_name_commodity_order_detail   @"商品订单详情"
#define page_name_write_commodity_order    @"填写商品订单"
#define page_name_commodity_address_list   @"联系地址列表"
#define page_name_add_address               @"添加一位收货人"
#define page_name_commodity_detail          @"商品详情"
#define page_name_commodity_list            @"商品列表"

#define page_name_channel_news      @"每日头条"
#define page_name_channel_video      @"明星视频"
#define page_name_channel_golf_rules      @"高球规则"
#define page_name_channel_pilgrimage      @"球场巡礼"

#define page_name_article_detail    @"文章详情"
#define page_name_video_detail      @"视频详情"
#define page_name_comment_list      @"评论列表"
#define page_name_select_payment    @"选择支付方式"

//在线客服及投诉电话
#define service_hotline       @"4001092080"
#define complaints_hotline    @"13263321017"

#define service_phone_1       @"13810255010"
#define service_phone_2       @"13810255010"


//
#define gaode_map_key        @"14d04c3e189211077407b970c3e06ab3"
#define gaode_static_map_key        @"d8a9533bfa747977704abf6b8ac84a76"
#define umeng_app_key        @"553ddcbd67e58e9469000a93"
#define weixin_developer_id  @"wx8216675fb452a3d6"
#define umeng_push_app_key  @"556c24da67e58eef9e003d75"

//支付
#define weixin_app_id        @"wx9b1418743479bd72"
#define mch_secret_key       @"J7ZwDa8IbCkIBaQnxCscmQBHIwX8pIpC"

//分享文字
#define share_app_title              @"每日高尔夫"
#define share_app_txt                @"我的高尔夫生活圈！"
#define share_app_url                @"http://www.golfd.cn/m/index#golfhome/"
#define share_app_downLoad_url       @"http://dwz.cn/ZVF4D"
#define hole_in_one_detail_url       @"http://test.golfd.cn/wxpub/index#holeInOne/introduce/app"

#define um_share_app_icon [UIImage loadImageWithImageName:@"logo_1024"]
#define about_us_content        @"       当互联网的整合进入高尔夫领域的时候，我们很高兴能够为高尔夫这项体育运动的推广去努力尝试。由《高尔夫》杂志协办的每日高尔夫致力于打造一个全方位的服务平台，高尔夫资讯、教学、规则介绍，那些我们总是想去模仿的明星挥杆视频，那些高尔夫圣地的介绍，都在这里。更重要的是，您所需要的订场服务，球具和易耗品的销售，经过精心策划，我们能够为您提供非常有竞争力的价格。请持续的关注我们，我们与您一起推广高尔夫运动，让高尔夫在中国茁壮成长！"


#define what_private_service_text   @"什么是私人服务:\n是一对一的免费服务\n有了私人服务\n您不需要再搜索APP,寻找低价\n不需要自己输入同组球友，电话等繁琐的信息\n不需要亲自去买打球的易耗品"
#define we_will_service_for_you_text  @"很多不需要都可以省去，因为我们为您提供\n球场低价搜索\n根据您的行程预定全国球场，不收取任何服务费用\n根据您的需求，购买并快递给您需要的高尔夫用品"
#define one_service_text       @"一次绑定私人服务，开启最轻松地高球生活"


#define private_service_text        @"Q:什么是私人服务？\nA:省去了您搜索球场、搜索球具的繁琐过程。我们为您提供一对一的免费服务，为您预定您想去的任何球场，为您配送您需要的球具。"

#define private_service_text_1       @"Q:什么是私人服务？\n\nA:省去了您搜索球场、搜索球具的繁琐过程。我们为您提供一对一的免费服务，为您预定您想去的任何球场，为您配送您需要的球具。"
#define golf_game_introduce_txt     @"为进一步推广高尔夫运动，提升打球的趣味性，《高尔夫》杂志携手《高尔夫周刊》、每日高尔夫、乐视高尔夫、新浪高尔夫频道及宝马汽车，共同打造首届HOLE-IN-ONE年度大奖赛。"

#define exchange_game_coins_introduce_txt  @"1. 积分可以通过充值获得！1元=1积分=10游戏币\n2. 积分和游戏币可以在每日高尔夫APP进行球场预定或商城兑换商品！\n3. 每日高尔夫游戏仅供娱乐！"


#define share_to_sina_weibo_key     @"share_to_sina_weibo"
#define binding_sina_weibo_key      @"binding_sina_weibo"
#define binding_wechat_key          @"binding_wechat"
#define binding_qq_key              @"binding_qq"
#define binding_tencent_weibo_key   @"binding_tencent_weibo"

#define APP_ID 985114578

#define meirigaoerfuAppURL @"https://itunes.apple.com/cn/app/mei-ri-gao-er-fu/id985114578?mt=8"


#define kEveryDay @"http://baobab.wandoujia.com/api/v1/feed?num=10&date=%@&vc=67&u=011f2924aa2cf27aa5dc8066c041fe08116a9a0c&v=1.8.0&f=iphone"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kSelfWidth self.frame.size.width
#define kSelfHeight self.frame.size.height

#import <Foundation/Foundation.h>

//订单的几种状态
#define unpay_status          @"unpay"
#define canceled_status       @"canceled"
#define payed_status          @"payed"
#define waitingRefund_status  @"waitingRefund"
#define refunded_status       @"refunded"
#define confirmed_status      @"confirmed"
#define sendGoodsed_status    @"sendGoodsed"
#define completed_status       @"completed"
#define waitingConfirm_status  @"waitingConfirm"

//支付类型
#define TEN_PAYMENT  @"微信支付"
#define ALI_APP_PAYMENT    @"支付宝APP"
#define ALI_WEB_PAYMENT    @"支付宝网页版"
#define UNION_PAYMENT   @"储蓄卡支付"
#define CREDIT_CARD_PAYMENT  @"信用卡支付"

//比赛状态类型
#define game_not_work    @"gameNotWork"
#define game_working     @"gameWorking"
#define game_end         @"gameEnd"
#define game_cancel      @"gameCancel"
#define game_not_active  @"gameNotActive"
#define game_actived     @"gameActived"

#define SUB_UNION_PAYMENT_NAME  @"支持各大行储蓄卡，无需开通网银"
#define SUB_WXPAY_PAYMENT_NAME  @"推荐安装微信5.0及以上版本使用"
#define SUB_CREDIT_CARD_PAYMENT_NAME  @"支持多种信用卡，无需开通网银"

#define game_type_singleDouble  @"singleDouble" //单双赛
#define game_type_club          @"club"   //笔杆赛
#define game_type_hole          @"hole"  //比洞赛

#define game_privilege_secret   @"secret"
#define game_privilege_secret_txt   @"私密"
#define game_privilege_all      @"all"
#define game_privilege_all_txt   @"公开"

#define base_usable_game_coin   1000

//状态机刷新
#define table_view_status_waiting 1 //等待加载状态
#define table_view_status_loading 2 //正在加载状态
#define table_view_status_load_over 3 //加载完成完成
#define table_view_status_load_fail 4 //加载失败

#define event_init_load 0 //初始加载事件
#define event_pull_up 1 //上拉事件
#define event_click_load    2 //点击加载事件
#define event_load_complete_succes 3 //加载成功事件
#define event_load_complete_fail   4 //加载失败事件
#define event_load_complete_over   5 //加载完成事件
#define event_load_data_pull_down  6//下拉事件


typedef enum : NSUInteger {
    from_search_detail = 3,
    from_pay_order = 4,
} CourtFromType;

typedef enum : NSUInteger {
    from_transitiion_vc = 9,
    from_user_club_order_vc = 10,
} PayOrdeType;

typedef enum : NSUInteger {
    from_order = 1,
    from_set_user_info = 5,
    from_pay_order_vc  = 6,
    from_user_club_order_detail = 7,
    from_user_club_order_list = 8,
    from_user_shopping_cart  = 11,
    from_user_commodity_order_detail = 12,
    from_user_commodity_order_list = 15,
    from_commoditys_list = 17,
    from_commodity_detail_vc = 18,
    from_user_game_detail_vc = 19,
    from_user_creat_game_vc = 20,
    from_user_join_game_vc = 21,
    from_user_game_list_vc = 22,
    from_guess_game_vc = 23,
    from_game_code_search_vc = 24,
    from_user_game_record_vc = 25,
} popType;

typedef enum : NSUInteger {
    from_main_vc  = 13,
    from_city_list_vc   = 14,
    from_private_vc = 16
} ProvinceListType;

@interface Constant : NSObject

@property (nonatomic, retain) NSArray *bgColors;

+(Constant *) sharedInstance;
-(UIColor *) getWaterfallBgColor;

+(NSString *)getPriceString:(float)minPrice;

@end
