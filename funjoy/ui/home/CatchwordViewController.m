//
//  IndexViewController.m
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "CatchwordViewController.h"
#import "NextViewController.h"
#import "DMTools.h"
#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
#define DMPLCAEMENTID_BANNER @"16TLwebvAchkANUH_krQ7vOz"


#import "EveryDayModel.h"
#import "EveryDayTableViewCell.h"
#import "ContentScrollView.h"
#import "ContentView.h"
#import "rilegouleView.h"
#import "CustomView.h"
#import "ImageContentView.h"
#import "PlayViewController.h"
#import "AppDelegate.h"
#import "HPSphereView.h"
#import "GBPopMenuButtonView.h"
#import "funjoy-Swift.h"
#import "FJAlertView.h"
#import "CatchWordModel.h"
@interface SDWebImageManager  (cache)


- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url;

@end

@implementation SDWebImageManager (cache)

- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url {
    NSString *key = [self cacheKeyForURL:url];
    return ([self.imageCache imageFromMemoryCacheForKey:key] != nil) ?  YES : NO;
}

@end

@interface CatchwordViewController ()<GBMenuButtonDelegate>
{
    CGSize _adSize;
    CGFloat _adX, _adY;
}
@property (nonatomic, retain) NSMutableDictionary *selectDic;

@property (nonatomic, retain) NSMutableArray *dateArray;
@property (nonatomic, retain) HPSphereView *sphereView;
@property (nonatomic, strong) GBPopMenuButtonView *popMenuButtonView;
@property (nonatomic, retain) NSArray *labelArray;
@property (nonatomic, strong) NSDictionary *yearOldCategoryDict;
@property (nonatomic, strong) CatchWordModel *catchWordModel;


@end

@implementation CatchwordViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    debugMethod();
    // 确定广告尺寸及位置
    //Set the size and origin
    _adX = 0;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
        if (!([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)) {
            
            _adY = 64;
            
        }else{
            
        }
        
    }
    else
    {
        _adY = 64;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // 创建广告视图，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    // Creat advertisement view please get your own ID from domob website
#warning please change the DMPUBLISHERID and the DMPLCAEMENTID_BANNER
//    self.dmAdView = [[DMAdView alloc] initWithPublisherId:DMPUBLISHERID
//                                              placementId:DMPLCAEMENTID_BANNER];
//
//    // 设置广告视图的位置 宽与高设置为0即可 该广告视图默认是横竖屏自适应 但需要在旋转时调用orientationChanged 方法
//    // Set the frame of advertisement view
//    self.dmAdView.frame = CGRectMake(_adX, _adY, FLEXIBLE_SIZE.width,40);
//    self.dmAdView.delegate = self;
//    self.dmAdView.rootViewController = self; // set RootViewController
//    [self.view addSubview:self.dmAdView];
//    [self.dmAdView loadAd]; // start load advertisement
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // 检查评价提醒，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    // Check for rate please get your own ID from Domob website
#warning please change the DMPUBLISHERID
//    DMTools *_dmTools = [[DMTools alloc] initWithPublisherId:DMPUBLISHERID];
//    [_dmTools checkRateInfo];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelArray = @[
                        @{
                            @"name":@"吃藕",
                            @"content":@"吃藕，网络流行词，是指“丑”的意思，谐音拼音“chou”，源于百度贴吧。某网友发贴问一个游戏中的人物是不是很丑不小心把\"丑\"打成了\"吃藕\"。从此，以\"吃藕\"表示\"丑\"的用法，在网上流行起来。\n发展经过:\n可是\"吃藕\"为什么能表示\"丑\"呢？这就是我们汉语拼音的奇妙之处了。声母为zh、ch、sh、r、z、c、s，的韵母为i的音节，在与零声母字组词快速链接时，就会出现合为一字的现象，如\"吃藕\"和\"丑\"，\"师恩\"和\"深\"。"
                            },
                        @{
                            @"name":@"我好方",
                            @"content":@"“我好方”是“我好慌”谐音的说法，调侃f、h分的不太清出的一种说法，意思为当遇到某些烦恼和懵逼的境况的时候的一种比较调侃的说法，类似于“宝宝心里苦”的含义。除此此外，“我好方”一词也被用作“我有点方”的形式。\n关于该词流行起来的最早的出处网上的说法有两种：\n说法一：该词出处是唱滑板鞋火遍大江南北约瑟翰庞麦郎在b站的另外一首鬼畜音乐《童话》里面的歌词“我开始慌了”，听起来就是“我开始方了”。\n说法二：该词出自很多直播网站里的比较有口音的主播，由于他们经常说“我好方”，被水友们传颂开来就成了流行语。\n发展经历:\n该词真正在网络伤爆红起来不得不归功于被网友制作成的一系列“我好方”表情包，将一些深入人心的影视角色p成了方脸配上“我好方”的文字，出镜率最高的便是“还珠格格”全员，鬼畜的表情得到了大家的一致好评，被网友们的广泛的使用和转载。随着该词的走红，也衍生出了“我好圆”的一种说法，形容胖了的意思，对应而出的“我好圆”表情包对还珠全员伸出了魔抓...心疼。"
                            },
                        @{
                            @"name":@"狗带",
                            @"content":@"“狗带”是“go die”的谐音，源自中国艺人黄子韬在一次演唱会上表演的英文Rap。\n出处:\nListen My Freestyle\n有人骂我\n制作谣言\n想要我生气失去自信\n呵呵\nDon*t Be Naive\nThis is my life\nI am fine\n我不会就这样轻易地go die, Huh?\nYour life is loser!\nSo don‘t waste your time on making rumor!"
                            },
                        @{
                            @"name":@"吃土",
                            @"content":@"“吃土”一词指的是穷到没钱吃饭只能吃土，后来引申到网络购物时，强调购物的疯狂程度，网友们常在过度购物时自嘲花销太大下个月“吃土”。\n“买买买”到超预算，网友自嘲“吃土”形成网络热词 。\n简介：\n“吃土”的翻译是“eat dirt”或者“eat soil”。由来已久的“剁手”梗当然也少不了，英语翻译叫“cut off my arm”，够凶残的，胳膊都剁了。\n “吃土”真正被推广到全民，是在2015年双十一购物狂欢节之际，随着集中出现的疯狂购物活动，“吃土”一词从网友自嘲推广为全民自嘲，随着时间推移，已经延伸成感慨为某件事情或某个物品花费许多金钱的一种自我嘲讽。\n出处：\n这个词与贫穷相联系，较早出自于漫画。后来，逐渐被Cosplay界的大神用于自比：Cosplay烧钱，穷得只能吃土。随后，逐渐流传开来，用在购物狂身上再合适不过。\n在马尔克斯的小说《百年孤独》中是女性角色形象丽贝卡发泄情绪的一种方式。以土的苦涩味道消除孤寂的内心。"
                            },
                        @{
                            @"name":@"巨巨",
                            @"content":@"巨巨，网络用语，指的是超级或者顶级地位的人物。江湖上有大侠、巨侠，巨巨就是很厉害的人，所以是巨侠，简称巨巨。顶级的意思\n词语来源：\n这个词源自动漫界，对于动漫作者，爱好者一般将他们分为大触、巨巨、太太、大大四个类别。\n引申含义：\n大侠、大神的亲切叫法：大大。比大侠、大神还牛逼的就是巨侠、巨神，所以叫巨巨，和“小透明”刚好相反，小透明就是没有存在感的人。"
                            },
                        @{
                            @"name":@"666",
                            @"content":@"666是一个汉语词汇，谐音为牛牛牛，溜溜溜有一种本土化的意思，用来形容某人或某物很厉害很牛、令人折服（大多是指游戏玩的好）。在西方，666指魔鬼。\n随着时代的发展，各类游戏的节奏也越来越快。666这样的语言用的越来越多。在江苏破获的网络涉毒案中，犯罪嫌疑人用666暗指吸毒，意思是让你溜。当人们表现出超常的能力时也会用来感叹。\n来源:\n这使得人们在游戏对局中开始使用各种缩略语，例如“lol（laugh out loud，意为“笑出声”）”,\"gg（good game，可理解为“打得精彩”）\",“gank（gangbang kill，意为“包抄，偷袭”）”等。其中一个就是“666”。\n当一名游戏玩家在游戏中完成了精彩的操作，使得对手感到五体投地时。对手很可能就会在对话框中打出“666”，以表示“牛牛牛”，该玩家的操作令人十分令人震惊，可怕的犹如魔鬼一般。在一些MOBA游戏中，例如《刀塔》，《英雄联盟》等，经常出现这样的场景。\n引申含义：\n注意：“溜“在作为形容词的时，读liū，意思为：灵活；麻利。\n引申意义便是：很厉害、令人折服。\n三个“溜（6）”重叠使用，强调了使用者对于被使用者的的强烈情感。\n同时，“666”在不断的使用中，也有人会把其当成反语使用。如果对方出现了严重的失误，便有人会讽刺对方“666”。这种情况与之前提到的“gg”十分相似。"
                            },
                        @{
                            @"name":@"一波",
                            @"content":@"一波以喻事端变化"
                            },
                        @{
                            @"name":@"红红火火恍恍惚惚",
                            @"content":@"红红火火恍恍惚惚是一句现代流行语，也是成语组合网络语，意思变为受用者在遇到大事后精神恍惚，不知所措。使用者懒惰自嘲（hhhhhhhh打的容易）。\n由来：\n这八个字的首字母都为hhhhhhhh，懒人用智能ABC输入法打出来则出现红红火火恍恍惚惚，实意为哈哈哈哈哈哈哈哈。\n演变：\n后来，结合成语意义，意思变为受用者在遇到大事后精神恍惚，不知所措。使用者懒惰自嘲（hhhhhhhh打的容易）。\n发展：\n该词语在网络微博，刷屏，弹幕，朋友圈等网络运用广泛，为网络语。"
                            },@{
                            @"name":@"扩列",
                            @"content":@"扩列是汉语词汇，拼音kuò liè，是社交暗语。扩是指扩充添加，列是指好友列表，简单来说就是问你可不可以加好友，是个网络常用词汇。扩列起源于李宫俊吧帖子被二次清空之前，该吧禁止成员留任何联系方式，一切交友类型的帖子都会被管理员封禁，于是吧内成员将交友的帖子称为“扩列”，后来演变为部分95-05后的通用暗语。\n起源：\n“扩列”起源于李宫俊吧帖子被二次清空之前，该吧禁止成员留任何联系方式，一切交友类型的帖子都会被管理员封禁，于是吧内成员将交友的帖子称为“扩列”，后来演变为部分95-05后的通用暗语。"
                            },@{
                            @"name":@"实力",
                            @"content":@"完全的意思，呵呵哒的讽刺形容词。据说实力一词和装逼更配哦，连起来，实力装逼。"
                            },@{
                            @"name":@"糊",
                            @"content":@"用来形容曾经名气很大、很红，但是今非昔比，已经失去了群组的喜爱和支持，有过期、过时的意思。"
                            },@{
                            @"name":@"滑稽",
                            @"content":@"滑稽是百度贴吧著名的泡泡表情，旧版名为“斜眼笑”。圆嘟嘟的脸萌萌哒，弧度上扬的嘴角傲而不娇，微微泛红的脸颊让人感到无限温暖，双眼右视充满欢乐使人浮想联翩，轻挑秀眉深藏功与名。其功用甚至高到可以概括各种心情的地步，广受用户喜爱。现在，滑稽表情已经有了同人动画片以及不计其数的斗图表情。"
                            },@{
                            @"name":@"欧洲人",
                            @"content":@"欧洲人由网络用语“非洲人”衍生而来，代指“运气极好”或“非常有钱”的人。非洲大酋长表示运气差到了极致，比如花一堆钱去合成装备或者提升属性结果出来的是渣渣装备和属性，尤其是对那些脸黑、人品跌爆的人，级别越高脸越黑人的戏称。运气好RP高爆发，一般称为欧皇，对那些欧皇属性的玩家还装穷哭苦的玩家，称他们是欧洲细作，表示藐视称呼。"
                            },@{
                            @"name":@"尼奏凯",
                            @"content":@"“尼奏凯”是谐音“你走开”的意思。单独”奏凯“二字，其本身含义：谓战胜而奏庆功之乐。泛指胜利。而用到了网上，在网络语言中：奏凯 = 走开。“奏凯”的拼音为 zǒu kāi ，与“走开”的读音完全一致的。"
                            },@{
                            @"name":@"洗模杯",
                            @"content":@"我手洗干净了可以摸摸你的奖杯么"
                            },@{
                            @"name":@"打铁",
                            @"content":@"写帖子，一般指有点儿重量的帖子。"
                            },@{
                            @"name":@"布吉岛",
                            @"content":@"不知道"
                            },@{
                            @"name":@"PYQ",
                            @"content":@""
                            },@{
                            @"name":@"发糖",
                            @"content":@""
                            },@{
                            @"name":@"原谅色",
                            @"content":@"该词其实如今网络上常见的流行语，“原谅色”其实就是指的是绿色，绿帽子的绿。以前的绿色代表了生机勃勃，现如今的绿色代表了生气勃勃。\n出处：\n该词是由之前网上流行的一个梗“当然是选择原谅”一词发展演变而来，借由之前的白百何出轨事件不断的走红网络，成为爆红网络的新梗。\n发展经历：\n除了今天我们提到的“原谅色”之外，从“当然是选择原谅她”这个梗衍生出来的词汇还包括了，“原谅套餐”、“原谅帽”...等等，相关的梗还包括了“我听见雨滴落在青青草地”梗、“原谅帽”梗、“爱是一道光如此美妙”梗....等等。，均形容被带了绿帽子的情况。"
                            },@{
                            @"name":@"落地成盒",
                            @"content":@"落地成盒，网络流行语，是游戏里的调侃语，就是落地没超过几十秒就让人杀了，游戏里死了人就变成一个小盒盒。\n词语来源：\n该词出自网络游戏《绝地求生：大逃杀》，为一句颇具调侃意味的术语。\n引申含义：\n所谓落地成盒，来自网游，指的是从飞机上跳伞到落地完毕后，在很短的时间内，就被敌人杀死了，或者是有人因为点没选好、跳伞动作没做好，直接造成摔死惨剧的，这种还没开始就已经结束的秒死状态就被称为落地成盒。之所以死了被称之为“盒子”是因为在游戏中，人物在死后，会在原地留下一个装备箱子，因此玩家们也调侃的称之为快递盒和骨灰盒。\n发展经过：\n关于“盒子”梗除了“落地成盒”一词之外，还有大家常说的“盒子精”一词，比喻那些游戏玩的比较菜比较坑，经常动不动就死了的菜鸟。以及常见的“血流成盒”、“一气盒成”、“神奇四匣”（四人组队版的落地成盒）等词。2017年9月，“落地成盒”一词再次爆红网络是因为人气明星鹿晗也开启了“吃鸡之旅”，化名“李壮实”和陈赫以及知名游戏主播一起踏上了吃鸡之路，萌新操作常常盒子，自嘲自己为“李盒子”，“落地成盒”等等。\n引用示例：\n平生不识黄旭东，落地成盒分分钟。"
                            },@{
                            @"name":@"扣字",
                            @"content":@"扣字原本通常指的是网络交流平台打字，扣字是其一种叫法，扣字的人叫都被叫做扣字手。如今扣字盛行于网络，归类为一种网络平台骂人方式，寓意打字比赛，扣字代表人物如圈圈等。\n起源：\n网络界聊天式的扣字，其实是由黑客界打字赛衍化过去的。如果有人认为网络界扣字比较早的，就是扣字界的鼻祖，那就荒天下之大谬了。扣字发源于黑客界，黑客友谊赛，便是扣字的根源！黑客攻击战，或者保卫战里需要极快的键盘操控速度，朋友之间互相切磋、练习键盘操控速度的过程，就是扣字的鼻祖。最后扣字在黑帽圈里形成了一个不正之风，就是以之（扣字）为赌。现在流传的扣字多余效仿于此。"
                            },@{
                            @"name":@"CQY",
                            @"content":@""
                            },@{
                            @"name":@"毒药",
                            @"content":@""
                            },@{
                            @"name":@"共药",
                            @"content":@"共同吃药"
                            },@{
                            @"name":@"共掉线",
                            @"content":@"就是因为服务器不稳定问题,是两个及两个以上玩家掉线"
                            },@{
                            @"name":@"亦可赛艇",
                            @"content":@"一颗赛艇其实是英文的音译啦，就是exciting的意思，表示兴奋的，激动的，在网络上则可以表达更多的意思，具体用法还要根据不同的环境联系上下文来分析含义，总之表情包的世界是博大精深的。"
                            },@{
                            @"name":@"DD",
                            @"content":@"弟弟"
                            },@{
                            @"name":@"互卖",
                            @"content":@""
                            },@{
                            @"name":@"开黑",
                            @"content":@""
                            },@{
                            @"name":@"萌新",
                            @"content":@"一般的定义是萌萌的新人，常用在贴吧论坛上自称的用语，表示自己初来乍到。一般女玩家或者女吧友使用居多。在网络游戏里是指各种一知半解的新手；在QQ群聊天的时候，通常是指自己是刚入群的新人。"
                            },@{
                            @"name":@"挽",
                            @"content":@""
                            },@{
                            @"name":@"233333",
                            @"content":@""
                            },@{
                            @"name":@"本命",
                            @"content":@""
                            },@{
                            @"name":@"黑界",
                            @"content":@"活跃于QQ网络，00后在里面模仿成年人社会。它是一种组织形式，也是一个人群划分标准。这个虚无缥缈的名字由无数个家族组成，只要你加入某一个家族，自然而然就进入了黑界，进入家族只有一个条件，将 QQ 昵称加上家族名。这些家族用 QQ 群将成员集合起来，你可以在里面交朋友、认师傅，而影响力足够强大的人甚至可以号令家族成员攻打其他家族。当然，这个攻打的方式是比赛的空间说说点赞更多，或者打字更快。他们大多是未成年人，以小学生和中学生为主，在虚拟世界里模仿成人社会的规则，用不文明的形式互动。\n黑界由无数个家族组成，有个别家族是人人都能喊得出名号的，如：冰狱、情战、柔杀、血樱... 这几个家族常年在网络上排名前十，这些家族名称大多寒气逼人、暗潮涌动，指向无上的荣耀与死亡的玄寂。家族人员分为总创、高管和一般成员。总创只有一个，即该家族创始人。但高管分类众多，比如 “总执行” 可以惩罚全族犯错的人（大概也就是发一条空间说说表示我们中出了个叛徒然后接受点赞）；“代言” 会代表家族一言一行；甚至还有权力监督机构 “总督”，这职位会督促高管，发现任何高管消极怠工，便报告创始人。\n黑界之所以 “黑”，是因为摩擦都用扣字解决，而扣字必然会带有辱骂性质。扣字的评判标准有两条，稳几和秒几。稳几是几秒能打一句话，而秒几是一秒能打几句话。滚刀是玩黑界的基本功，只要滚刀玩的溜，大家都会认可你的实力。字如其义，一个个句子和刀一样从键盘滚过，通过网线剁到敌方的手上。滚刀每个句子都很短，不过几个字。但有一个中心词，比如窝囊废、垃圾。这是扣字里最快的一种，新人入门必备。滚刀得有稳2的实力才能接下硬仗。而超高速度的获得，一般是通过先断网，把字打上去，再连上网，断网时候打的字就自动发出了。\n当黑界对战需要的内容增多时，就需要渠道分发内容，于是有了报社。报社通过 QQ 群组建，成员有两个岗位：记者和写手。记者听到任何的风吹草动，便会加上各个知名的 QQ （大家都会在网上主动说出自己的 QQ，希望增加好友），然后问两三个，最多四个问题。整理回来的资料便交给写手，完成一篇引言比内容还长的采访，发布出来。\n玩黑界最大的快感就是通过扣字战胜对手，这个江湖里，没人有技压天下的实力，毕竟以打字速度作为内力的话，上限和下限是极其相近的。这里没有绝世武功，也没有天传心法，只有一个键盘和青春作祟的荷尔蒙。"
                            },@{
                            @"name":@"实力挽尊",
                            @"content":@""
                            },@{
                            @"name":@"欧气",
                            @"content":@"欧气指的是有钱人或是运气好的人所散发出的气息。（因为欧洲人脸白，对应非洲人，脸黑）\n词语来源：\n欧气由网络用语“欧洲人”衍生而来，意思与“喜气”相似。"
                            },@{
                            @"name":@"同控",
                            @"content":@""
                            },@{
                            @"name":@"语C",
                            @"content":@"语C即语言cos的简称，语C是一种用语言文字模仿动漫、小说、影视及其他艺术作品或原创作品中出现的人物角色的文学形式。模仿对象包括但不限于狭义的人物角色，可能会出现对动物的模仿和对器物的模仿，也可以解释为，利用论坛／QQ等网络平台创建一个二次元虚拟精神世界，再利用文字进行表达。语言coser一般只能操纵自己选中的唯一角色，支配该角色的心理、语言和动作。描写他人角色是不被允许的，这在圈内被成为“控戏”，因在控戏的情况下情节发展全部随单人意志，失去了互动性，是对“戏友”的不尊重。语C基本上就是两个玩法，写戏，上皮聊天。玩好语C就是磨好皮写好戏做好自己，皮上皮下搞清楚。\n常有人说，不混语C不能称为混二次元。\n语C上层圈子相对比较精英化。他们多是海外留学生，跳级学生，年级的前几名，有公众号，甚至见过一个初从政者。因为真正体验到语C的乐趣，需要广知识面，语言运用能力，品位与联想能力。语C是呈现金字塔结构，真正顶端人称“混戏”。下边儿则是花式小学生，花式智障，花式玛丽苏，花式撕逼。\n语C圈中很重要的一个子圈是blc（boy love cosplay），大多为女性向（蔷薇向）的男性文字角色扮演，即玩家在特定的背景下以文字为主要表现形式来扮演特定的角色，以角色间的爱恋、友情、亲情等为主要事件来表现该角色的语言、动作、性格等，并与同背景下其他角色扮演者互动。blc圈低龄化很严重，大多是中学生，且blc日常运用的黄暴词汇，H戏，以及各种爆群组织、家族，许多努力“搏出位”的奇葩行为等屡见不鲜，而blc目前女性占绝对多数，使blc圈被称为“最大的女同志交友圈”。\nAPP推荐：名人朋友圈，其是一款以文字COSPLAY为基础的社交软件，是目前全球首款以角色扮演为主线的聊天交友软件。用户可以在平台上扮演任意角色，感兴趣的亲们可以下载尝试下。"
                            },@{
                            @"name":@"小确肥",
                            @"content":@"虽然微小但是确实的肥胖，是无论如何都不会掉的体重。即使是肥，加上小确两个字，也让人觉得这是被幸福的泉水浇灌长大的肥肉。"
                            },@{
                            @"name":@"战五渣",
                            @"content":@""
                            },@{
                            @"name":@"喊麦",
                            @"content":@"MC喊麦是以说唱的形式主持，源于电音文化。（MC，Microphone Controller。其实MC是一些rapper的自称，早期一些rapper在自己名字前面加上MC二字，MC就这么由来了。）本质上作为说唱的一个分支，是一种即兴的节奏音乐，是底层人民的呐喊和发泄。喊麦主要活跃在各大直播间，虽然是以说唱为基础的，但是二者却近乎老死不相往来。"
                            },@{
                            @"name":@"扩同好",
                            @"content":@"扩字的含义与“扩列”中保持一致，指扩充、添加，同好就是指对于某个东西或者某件事情有着相同喜好态度的人。"
                            },@{
                            @"name":@"面基",
                            @"content":@"漫友常用语，指基友见面。现贴吧也常用可以理解为面见基友的简称，常用于网友间约见调侃之词。近义词则是面蕾，指女女网友见面。"
                            },@{
                            @"name":@"290",
                            @"content":@"委婉的骂人用语，290 = 250 + 38 + 2，形容一个人白痴、愚蠢。"
                            },@{
                            @"name":@"可攻可受",
                            @"content":@"可攻可受，也就是，既可以很强势凌虐别人，也可以像个小受，被人凌虐。"
                            },@{
                            @"name":@"中二",
                            @"content":@"“中二病”指一种自我认知心态。“中二”是日语对“初中二年级”的称呼，中二病从字面上来理解就是：初二年级青少年的某些病态自我意识，比喻青春期的少年过于自以为是等特别言行的俗语 。\n造句：漂亮女生静止的时候，静静观赏就好像一幅绝美的画。可是当漂亮女生“中二”，这个世界就要崩溃了。"
                            },@{
                            @"name":@"种草",
                            @"content":@"泛指“把一样事物推荐给另一个人，让另一个人喜欢这样事物”的过程，类似于网络语安利（推荐，因为自己特别特别喜欢，所以真心真意地推荐出来）。\n造句：最近种草了一款香水，准备下周拔草。"
                            },
                        ];
    [self initHeaderView];
    [self initPopMenuButtonView];
    [self initData];
    
//    [self jsonSelection];
   
}

- (void)initData{
    if (self.labelArray.count > 0) {
        self.dateArray = [CatchWordModel mj_objectArrayWithKeyValuesArray:self.labelArray];
        [self initLabelCloudView];
    }
}

/**
 初始化导航
 */
- (void)initHeaderView{
    [self.view addSubview:self.customNavBar];
    self.customNavBar.title = @"流行语";
    [self.customNavBar wr_setBottomLineHidden:NO];
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:1];
}

/**
 初始化弹出按钮
 */
- (void)initPopMenuButtonView{
    self.popMenuButtonView = [[GBPopMenuButtonView alloc] initWithItems:@[@"camera",@"draw",@"dropbox",@"gallery"] size:CGSizeMake(50, 50) type:GBMenuButtonTypeLineRight isMove:YES];
    self.popMenuButtonView.delegate = self;
    self.popMenuButtonView.frame = CGRectMake(15, [WRNavigationBar navBarBottom]+general_margin, 50, 50);
    [self.view addSubview:self.popMenuButtonView];
    
}

/**
 初始化标签云
 */
- (void)initLabelCloudView{
    _sphereView = [[HPSphereView alloc] initWithFrame:CGRectMake(30, self.popMenuButtonView.bottomY+general_space, screen_width-60, screen_width-60)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < self.dateArray.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.catchWordModel = self.dateArray[i];
        [btn setTitle:[NSString stringWithFormat:@"%@", self.catchWordModel.name] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:24.];
        CGSize btnSize = [NSStringUtils boundingALLRectWithSize:self.catchWordModel.name Font:[UIFont systemFontOfSize:font_24_size] Size:CGSizeMake(screen_width, 0)];
        btn.frame = CGRectMake(0, 0, btnSize.width, 20);
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setCloudTags:array];
    _sphereView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_sphereView];
    [self.view bringSubviewToFront:self.popMenuButtonView];
}

#pragma mark 点击标签事件------------
- (void)buttonPressed:(UIButton *)sender{
    NSLog(@"点击了-------%@",sender.currentTitle);
//    NSString *str = @"可见方法名里面并没有体现参数的位置，所以是否是同一个方法取决于方法名是否相同，和参数没关系。要找到方法首先要先确定是那个类。isa和super_class是找到实现函数的关键映射，决定找到存放在哪个类的方法实现。（isa用于自省确定所属类，super_class确定继承关系）。实例对象的isa指针指向类，类的isa指针指向其元类（metaClass）。对象就是一个含isa指针的结构体。类存储实例对象的方法列表，元类存储类的方法列表，元类也是类对象。当创建实例对象时，分配的内存包含一个objc_object数据结构，然后是类到父类直到根类NSObject的实例变量的数据。NSObject类的alloc和allocWithZone:方法使用函数class_createInstance来创建objc_object数据结构。向一个Objective-C对象发送消息时，运行时库会根据实例对象的isa指针找到这个实例对象所属的类。Runtime库会在类的方法列表由super_class指针找到父类的方法列表直至根类NSObject中去寻找与消息对应的selector指向的方法。找到后即运行这个方法。";
//
//    FJAlertView *alert = [[FJAlertView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) title:sender.currentTitle message:str buttonTitle:nil];
//    [alert show];
    
    for (CatchWordModel *catchWordModel in self.dateArray) {
        if ([sender.currentTitle isEqualToString:catchWordModel.name]) {
            FJAlertView *alert = [[FJAlertView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) title:sender.currentTitle message:catchWordModel.content buttonTitle:nil];
            [alert show];
        }
    }
}

#pragma mark GBMenuButtonDelegate--------
- (void)menuButtonSelectedAtIdex:(NSInteger)index{
    [self.popMenuButtonView hideItems];
    NSLog(@"点击了-------%ld",(long)index);
    
}




#pragma mark ---------- 数据解析 -----------

//懒加载
- (NSMutableDictionary *)selectDic{
    
    if (!_selectDic) {
        
        _selectDic = [[NSMutableDictionary alloc]init];
        
    }
    return _selectDic;
}

- (NSMutableArray *)dateArray{
    
    if (!_dateArray) {
        _dateArray = [[NSMutableArray alloc]init];
    }
    return _dateArray;
}


- (void)jsonSelection{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *date = [NSDate date];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSString *url = [NSString stringWithFormat:kEveryDay,dateString];
    
    [LORequestManger GET:url completeBlock:^(id response, NSError *err) {
        if (response != nil) {
            NSDictionary *Dic = (NSDictionary *)response;
            
            NSArray *array = Dic[@"dailyList"];
            
            for (NSDictionary *dic in array) {
                
                NSMutableArray *selectArray = [NSMutableArray array];
                
                NSArray *arr = dic[@"videoList"];
                
                for (NSDictionary *dic1 in arr) {
                    NSLog(@">>>>>>>>>>>>%@",dic1);
                    EveryDayModel *model = [[EveryDayModel alloc]init];
                    
                    [model setValuesForKeysWithDictionary:dic1];
                    
                    model.collectionCount = dic1[@"consumption"][@"collectionCount"];
                    model.replyCount = dic1[@"consumption"][@"replyCount"];
                    model.shareCount = dic1[@"consumption"][@"shareCount"];
                    
                    [selectArray addObject:model];
                }
                NSString *date = [[dic[@"date"] stringValue] substringToIndex:10];
                
                [self.selectDic setValue:selectArray forKey:date];
            }
            
            NSComparisonResult (^priceBlock)(NSString *, NSString *) = ^(NSString *string1, NSString *string2){
                
                NSInteger number1 = [string1 integerValue];
                NSInteger number2 = [string2 integerValue];
                
                if (number1 > number2) {
                    return NSOrderedAscending;
                }else if(number1 < number2){
                    return NSOrderedDescending;
                }else{
                    return NSOrderedSame;
                }
                
            };
            
            self.dateArray = [[[self.selectDic allKeys] sortedArrayUsingComparator:priceBlock]mutableCopy];
            
            NSLog(@"%ld",[self.dateArray count]);
            
            [self.tableView reloadData];
        }
    }];
    
}


//初始化tableview
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [WRNavigationBar navBarBottom], screen_width,screen_height-tabbar_height-[WRNavigationBar navBarBottom]) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [ColorUtils colorWithHexString:backgroud_color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[EveryDayTableViewCell class] forCellReuseIdentifier:@"哈哈"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
//    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.dateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.selectDic[self.dateArray[section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EveryDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"哈哈" forIndexPath:indexPath];
    
    return cell;
}

// 头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *string = self.dateArray[section];
    
    long long int date1 = (long long int)[string intValue];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:date1];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"MM/dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:date2];
    
    return dateString;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

//添加每个cell出现时的3D动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(EveryDayTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    EveryDayModel *model = self.selectDic[self.dateArray[indexPath.section]][indexPath.row];
    
    if (![[SDWebImageManager sharedManager] memoryCachedImageExistsForURL:[NSURL URLWithString:model.coverForDetail]]) {
        
        CATransform3D rotation;//3D旋转
        
        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
        //        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转
        
        rotation = CATransform3DScale(rotation, 0.9, .9, 1);
        
        rotation.m34 = 1.0/ -600;
        
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        
        [UIView beginAnimations:@"rotation" context:NULL];
        //旋转时间
        [UIView setAnimationDuration:0.6];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
    }
    
    [cell cellOffset];
    cell.model = model;
}


#pragma mark ---------- 单元格代理方法 ----------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showImageAtIndexPath:indexPath];
}


#pragma mark --------- 设置待播放界面 ----------

- (void)showImageAtIndexPath:(NSIndexPath *)indexPath{
    [[(AppDelegate*)[UIApplication sharedApplication].delegate tabbar].tabBarController setTabBarHidden:YES animated:YES];
    _array = _selectDic[_dateArray[indexPath.section]];
    _currentIndexPath = indexPath;
    
    EveryDayTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    CGRect rect = [cell convertRect:cell.bounds toView:nil];
    CGFloat y = rect.origin.y;
    
    _rilegoule = [[rilegouleView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) imageArray:_array index:indexPath.row];
    _rilegoule.offsetY = y;
    _rilegoule.animationTrans = cell.picture.transform;
    _rilegoule.animationView.picture.image = cell.picture.image;
    
    _rilegoule.scrollView.delegate = self;
    
    [[self.tableView superview] addSubview:_rilegoule];
    //添加轻扫手势
    UISwipeGestureRecognizer *Swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    _rilegoule.contentView.userInteractionEnabled = YES;
    
    Swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [_rilegoule.contentView addGestureRecognizer:Swipe];
    
    //添加点击播放手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_rilegoule.scrollView addGestureRecognizer:tap];
    
    [_rilegoule aminmationShow];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual:_rilegoule.scrollView]) {
        
        for (ImageContentView *subView in scrollView.subviews) {
            
            if ([subView respondsToSelector:@selector(imageOffset)] ) {
                [subView imageOffset];
            }
        }
        
        CGFloat x = _rilegoule.scrollView.contentOffset.x;
        
        CGFloat off = ABS( ((int)x % (int)kWidth) - kWidth/2) /(kWidth/2) + .2;
        
        [UIView animateWithDuration:1.0 animations:^{
            _rilegoule.playView.alpha = off;
            _rilegoule.contentView.titleLabel.alpha = off + 0.3;
            _rilegoule.contentView.littleLabel.alpha = off + 0.3;
            _rilegoule.contentView.lineView.alpha = off + 0.3;
            _rilegoule.contentView.descripLabel.alpha = off + 0.3;
            _rilegoule.contentView.collectionCustom.alpha = off + 0.3;
            _rilegoule.contentView.shareCustom.alpha = off + 0.3;
            _rilegoule.contentView.cacheCustom.alpha = off + 0.3;
            _rilegoule.contentView.replyCustom.alpha = off + 0.3;
            
        }];
        
    } else {
        
        NSArray<EveryDayTableViewCell *> *array = [self.tableView visibleCells];
        
        [array enumerateObjectsUsingBlock:^(EveryDayTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [obj cellOffset];
        }];
        
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual:_rilegoule.scrollView]) {
        
        int index = floor((_rilegoule.scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;
        
        _rilegoule.scrollView.currentIndex = index;
        
        self.currentIndexPath = [NSIndexPath indexPathForRow:index inSection:self.currentIndexPath.section];
        
        [self.tableView scrollToRowAtIndexPath:self.currentIndexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
        
        [self.tableView setNeedsDisplay];
        EveryDayTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.currentIndexPath];
        
        [cell cellOffset];
        
        CGRect rect = [cell convertRect:cell.bounds toView:nil];
        _rilegoule.animationTrans = cell.picture.transform;
        _rilegoule.offsetY = rect.origin.y;
        
        EveryDayModel *model = _array[index];
        
        [_rilegoule.contentView setData:model];
        
        [_rilegoule.animationView.picture setImageWithURL:[NSURL URLWithString: model.coverForDetail]];
        
    }
}

#pragma mark -------------- 平移手势触发事件 -----------

- (void)panAction:(UISwipeGestureRecognizer *)swipe{
    [[(AppDelegate*)[UIApplication sharedApplication].delegate tabbar].tabBarController setTabBarHidden:NO animated:YES];
    [_rilegoule animationDismissUsingCompeteBlock:^{
        
        _rilegoule = nil;
    }];
}

#pragma mark -------------- 点击手势触发事件 -----------

- (void)tapAction{

    PlayViewController *playVC = [[PlayViewController alloc]init];
    
    playVC.modelArray = _array;
    
    playVC.index = self.currentIndexPath.row;
    
    [self.navigationController pushViewController:playVC animated:YES];
//    [self presentViewController:playVC animated:YES completion:nil];
}

//针对Banner的横竖屏自适应方法
//method For multible orientation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    [_dmAdView orientationChanged];
}

#pragma mark -
#pragma mark DMAdView delegate

// 成功加载广告后，回调该方法
// This method will be used after load successfully
- (void)dmAdViewSuccessToLoadAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] success to load ad.");
}

// 加载广告失败后，回调该方法
// This method will be used after load failed
- (void)dmAdViewFailToLoadAd:(DMAdView *)adView withError:(NSError *)error
{
    NSLog(@"[Domob Sample] fail to load ad. %@", error);
}

// 当将要呈现出 Modal View 时，回调该方法。如打开内置浏览器
// When will be showing a Modal View, this method will be called. Such as open built-in browser
- (void)dmWillPresentModalViewFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] will present modal view.");
//    NextViewController *nvc = [[NextViewController alloc] init];
//    [self.navigationController pushViewController:nvc animated:YES];
}

// 当呈现的 Modal View 被关闭后，回调该方法。如内置浏览器被关闭。
// When presented Modal View is closed, this method will be called. Such as built-in browser is closed
- (void)dmDidDismissModalViewFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] did dismiss modal view.");
}

// 当因用户的操作（如点击下载类广告，需要跳转到Store），需要离开当前应用时，回调该方法
// When the result of the user's actions (such as clicking download class advertising, you need to jump to the Store), need to leave the current application, this method will be called
- (void)dmApplicationWillEnterBackgroundFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] will enter background.");
}


- (void)btnClcik{
    NextViewController *nvc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nvc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getPageName{
 return @"新闻";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
