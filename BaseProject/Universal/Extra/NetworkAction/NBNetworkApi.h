//
//  NBNetworkApi.h
//  NiceIM
//
//  Created by mac on 2020/2/25.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBNetworkApi : NSObject

//===============================================
//               api错误定义
//===============================================

/**
 请求成功
*/
extern NSString *const ApiRequestSuccess;
/**
 请输入图形验证码
*/
extern NSString *const ApiVerificationImageCodeError;
/**
 没有账号去注册
*/
extern NSString *const ApiNotRegisteredError;
/**
 验证码错误
*/
extern NSString *const ApiVerificationCodeError;
/**
 密码错误
*/
extern NSString *const ApiPasswordError;
/**
 账号不存在
*/
extern NSString *const ApiAccountError;
/**
 账号被禁用
*/
extern NSString *const ApiDisableAccountError;
/**
 需要走网易云信加群
*/
extern NSString *const ApiJionTeamByYunXin;
/**
 账号未登录
*/
extern NSString *const ApiAccountNotLogin;
/**
 账号被冻结
*/
extern NSString *const ApiAccountFreeze;
/**
 红包已被领取完
*/
extern NSString *const ApiRedPackTakeOut;
/**
 红包已过期被退回
*/
extern NSString *const ApiRedPackOverdue;
/**
 订单红包领红包次数已用完
*/
extern NSString *const ApiOrderRedPackNoChance;
/**
 订单红包已被领取完
*/
extern NSString *const ApiOrderRedPackTakeOut;
/**
 订单红包已过期
*/
extern NSString *const ApiOrderRedPackOverdue;
/**
 资金密码错误
*/
extern NSString *const ApiMoneyPassword;
/**
 用户此现金券已领达最大值
*/
extern NSString *const ApiCouponReceiveMax;
/**
 拼多多未备案
*/
extern NSString *const ApiPDDError;


//===============================================
//               api接口                        
//===============================================

//MARK:===========  登录注册模块  ===========
/**
 下载设备信息
*/
extern NSString *const IOSDyPathResponseURL;
/**
 发送短信验证码接口
*/
extern NSString *const SendSmsURL;
/**
 生成验证码
*/
extern NSString *const CaptchaImageURL;
/**
 登录接口
 */
extern NSString *const LoginURL;
/**
 用户端登出接口
 */
extern NSString *const LogoutURL;
/**
 注册接口
 */
extern NSString *const RegUserByMobileURL;
/**
 当前手机一键登录
 */
extern NSString *const AliyunMobileLoginURL;
/**
 qq 微信 淘宝 登录时 一键绑定手机号
 */
extern NSString *const AliyunMobileBinding;
/**
 一键登录注册时绑定原有手机已绑定的账户(微信)
 */
extern NSString *const RegisterBindingOriginalAccountURL;
/**
 一键登录注册 qq 微信 淘宝授权绑定接口
 */
extern NSString *const RegisterWithOneClickURL;
/**
 本机号码一键绑定
 */
extern NSString *const AliyunBindingMobileURL;
/**
 通过QQ授权登录
 */
extern NSString *const qqLoginURL;
/**
 通过淘宝授权登录
 */
extern NSString *const appTaoBaoLoginURL;
/**
 通过微信授权登录
 */
extern NSString *const weixinLoginURL;
/**
 QQ注册绑定手机号
 */
extern NSString *const oneClickBindingMobileURL;
/**
 用户协议
 */
extern NSString *const UserProURL;
/**
 隐私协议
 */
extern NSString *const PrivacyProURL;
/**
 APP端平台服务协议和交易规则查看
 */
extern NSString *const AppSelectPlatformAndTransactionURL;
/**
 添加反馈意见
 */
extern NSString *const InsertQuestionURL;
/**
 设置密码
 */
extern NSString *const SetPasswordURL;

/**
 查询配置信息
 */
extern NSString *const SelectMobileSecret;

/**
 APP端拼多多新规说明
 */
extern NSString *const AppSelectPddRegulationURL;
/**
 APP端淘宝新规说明
 */
extern NSString *const AppSelectTbRegulationURL;
/**
 淘宝短链
 */
extern NSString *const ChangeShortUrlURL;


//MARK:===========  好友模块  ===========
/**
 查询是否有权限加好友
 */
extern NSString *const CheckAddFriendURL;
/**
 删好友
 */
extern NSString *const DeleteUserFriendURL;
/**
 加好友
 */
extern NSString *const SaveUserFriendApplyURL;
/**
 修改好友信息
 */
extern NSString *const UpdateUserFriendURL;
/**
 按用户id查询用户信息
 */
extern NSString *const SelectUserByKeyWordURL;


//MARK:===========  群聊模块  ===========
/**
 获取群信息
 */
extern NSString *const SelectTeamInfoByTidURL;
/**
 删除群页签
 */
extern NSString *const DeleteTeamGameRelationURL;
/**
 分页查询群页签
 */
extern NSString *const SelectTeamTagByPageURL;
/**
 获取群的标签列表
 */
extern NSString *const SelectUseTeamTagURL;
/**
 添加群标签
 */
extern NSString *const SaveTeamTagRelationURL;
/**
 删除群标签
 */
extern NSString *const DeleteTeamTagRelationURL;
/**
 分页查询群链接
 */
extern NSString *const SelectTeamLinkByPageURL;
/**
 获取群的链接列表
 */
extern NSString *const SelectUseTeamLinkURL;
/**
 添加群链接
 */
extern NSString *const SaveTeamLinkRelationURL;
/**
 删除群链接
 */
extern NSString *const DeleteTeamLinkRelationURL;
/**
 APP端查询所有群专属客服
 */
extern NSString *const AppSelectAllURL;
/**
 APP端查询群专属客服详情
 */
extern NSString *const SelectTeamWaiterURL;
/**
 群对应专属客服列表
 */
extern NSString *const AppSelectListURL;
/**
 删除群对应专属客服
 */
extern NSString *const DeleteTeamWaiterRelationURL;
/**
 添加群对应专属客服
 */
extern NSString *const SaveTeamWaiterRelationURL;
/**
 启用禁用专属客服
 */
extern NSString *const UpdateTeamWaiterRelationURL;
/**
 转让群
 */
extern NSString *const ChangeTeamOwnerForOwnerURL;
/**
 查询是否有权限强制拉人进群
 */
extern NSString *const CheckForceJoinTeamURL;
/**
 查询是否有权限创群
 */
extern NSString *const CheckCreateTeamURL;
/**
 查询是否有权限加群(返回code：SL0600001(需要走网易云信加群),SL011000(我们后台自己加群)，无权加群)
 */
extern NSString *const CheckJoinTeamURL;
/**
 群主主动拉人
 */
extern NSString *const JoinTeamByManagerURL;
/**
 群主任命群管理员
 */
extern NSString *const ChangeUserTeamManagerURL;
/**
 群主移除群管理员
 */
extern NSString *const RemoveUserTeamManagerURL;
/**
 批量踢人
 */
extern NSString *const KickTeamByOwnerURL;
/**
 用户加群(返回code：SL0600001(需要走网易云信加群),SL011000(我们后台自己加群)，无权加群)
 */
extern NSString *const JoinTeamByUserURL;
/**
 主动退群
 */
extern NSString *const LeaveTeamURL;
/**
 全员禁言
 */
extern NSString *const MuteTeamURL;
/**
 禁言群用户
 */
extern NSString *const MuteTeamUserURL;
/**
 解散群
 */
extern NSString *const RemoveTeamURL;
/**
 创建群
 */
extern NSString *const SaveTeamURL;
/**
 修改群信息
 */
extern NSString *const UpdateTeamURL;
/**
 修改群昵称
 */
extern NSString *const UpdateUserTeamNickURL;
/**
 分页查询群公告
 */
extern NSString *const SelectTeamNoticeByPageURL;
/**
 修改群公告
 */
extern NSString *const UpdateTeamNoticeURL;
/**
 添加群公告
 */
extern NSString *const SaveTeamNoticeURL;
/**
 删除群公告
 */
extern NSString *const DeleteTeamNoticeURL;
/**
 查询群成员等级数据
 */
extern NSString *const SelectUserTeamLvlListURL;
/**
 修改群成员扩展字段
 */
extern NSString *const UpdateUserTeamCustomURL;
/**
 用户同意入群或者群主同意入群这类直接调云信接口的，需要在调完云信接口后调一下此接口
 */
extern NSString *const InsertUserTeamRelationURL;
/**
 页面分享分类列表
 */
extern NSString *const SelectAPPSharerTypeListURL;


//MARK:===========  收藏模块  ===========
/**
 删除收藏
*/
extern NSString *const DeleteUserCollectURL;
/**
 添加收藏
 */
extern NSString *const SaveUserCollectURL;
/**
 收藏列表
 */
extern NSString *const SelectListPageURL;


//MARK:===========  系统用户模块  ===========
/**
 系统参数
*/
extern NSString *const AllAppParameterURL;
/**
 单个获取系统参数
*/
extern NSString *const AppParameterURL;
/**
 appTab页面查询
*/
extern NSString *const SelectAppUseTabSettingListURL;
/**
 appTab页面查询
*/
extern NSString *const SelectAppStoreSettingJsonDataURL;
/**
 获取七牛云上传凭证
 */
extern NSString *const GetQiNiuTokenURL;
/**
 APP端分页列表查询帮助文档
 */
extern NSString *const SelectHelpListURL;
/**
 APP端修改资料接口
 */
extern NSString *const UpdateInfoURL;
/**
 修改自定义邀请码
 */
extern NSString *const UpdateUserInvitationURL;
/**
 app端根据邀请码查询用户信息
 */
extern NSString *const SelectUserByInvitationURL;
/**
 app端用户信息查询
 */
extern NSString *const AppSelectUserURL;
/**
 APP端修改用户微信字段接口
 */
extern NSString *const AppUpdateWeixinURL;
/**
 设置支付密码
 */
extern NSString *const SetPayPasswordURL;
/**
 修改支付密码
 */
extern NSString *const UpdatePayPasswordURL;
/**
 修改密码
 */
extern NSString *const UpdatePasswordURL;
/**
 忘记-设置新密码
 */
extern NSString *const ForgetPasswordURL;
/**
 验证手机号
 */
extern NSString *const VerifyMobileURL;
/**
 app端用户查询客服列表
 */
extern NSString *const SelectYyWaiterListURL;
/**
 app端用户查询客服详情
 */
extern NSString *const SelectWaiterURL;
/**
 查询机器人回复序列为1的内容
 */
extern NSString *const SelectWaiterRobotByOneURL;
/**
 查询机器人客服
 */
extern NSString *const SelectWaiterByRobotURL;
/**
 回复问题集合（参数关键字和ID必传一个）
 */
extern NSString *const selectAPPWaiterRobotListURL;
/**
 查询热门问题集合
 */
extern NSString *const SelectHotWaiterRobotURL;
/**
 查询系统默认人工客服
 */
extern NSString *const SelectLaborWaiterURL;
/**
 APP端查询最新公告
 */
extern NSString *const SelectEntityByPublishTimeURL;
/**
 APP端消息列表查询最新公告
 */
extern NSString *const SelectNewsByPublishTimeURL;
/**
 APP端查询消息列表
 */
extern NSString *const AppSelectNoticeListPageURL;
/**
 APP端全部添加消息已读
 */
extern NSString *const saveBatchNoticeReadURL;
/**
 APP端添加消息已读/删除消息接口--可批量
 */
extern NSString *const saveNoticeReadURL;
/**
 查询系统通知设置
 */
extern NSString *const SelectUserNoticeSettingURL;
/**
 设置用户的deviceToken
 */
extern NSString *const InserUserDeviceTokenURL;
/**
 编辑通知设置
 */
extern NSString *const editUserNoticeSettingURL;
/**
 获取敏感词列表
 */
extern NSString *const SelectListURL;
/**
 查询最新版本记录
 */
extern NSString *const appUpdateURL;
/**
 图片配置查询
 */
extern NSString *const SelectAppSettingURL;
/**
 弹窗广告配置
 */
extern NSString *const SelectAdvertisingURL;
/**
 删除收货地址
 */
extern NSString *const DeleteUserExpressAddressURL;
/**
 添加收货地址
 */
extern NSString *const SaveUserExpressAddressURL;
/**
 APP端查询收货地址
 */
extern NSString *const SelectExpressAddressListURL;
/**
 设置默认选项
 */
extern NSString *const UpdateDefaultStatusURL;
/**
 修改收货地址
 */
extern NSString *const UpdateUserExpressAddressURL;
/**
 支付宝绑定
 */
extern NSString *const BindingAlipayURL;
/**
 QQ授权绑定
 */
extern NSString *const qqBindingURL;
/**
 微信授权绑定
 */
extern NSString *const WeixinBindingURL;
/**
 淘宝授权绑定
 */
extern NSString *const TaoBaoBindingURL;
/**
 手机绑定
 */
extern NSString *const BindingMobileURL;
/**
 解除绑定（QQ，微信，淘宝）
 */
extern NSString *const relieveBindingURL;
/**
 注销账号
 */
extern NSString *const CloseAnAccountURL;
/**
 我的收益
 */
extern NSString *const SelectUserSubCommissionStaticURL;
/**
 我的收益(不含上个月)
 */
extern NSString *const selectLastMoneyUserSubCommissionStaticURL;
/**
 我的粉丝
 */
extern NSString *const SelectFansURL;
/**
 我的粉丝列表
 */
extern NSString *const SelectFansListURL;
/**
 查询邀请分享设置
 */
extern NSString *const SelectInviteShareSettingURL;
/**
 查询用户等级数据
 */
extern NSString *const SelectUserLvlListURL;
/**
 用户升级
 */
extern NSString *const UpdateUserLvlURL;
/**
 平台自留百分比
 */
extern NSString *const selectAllianceSettingListURL;
/**
 用户个人中心超级转链
 */
extern NSString *const SuperTurnTheChainURL;
/**
 店铺转链
 */
extern NSString *const SelectShopConvertURL;
/**
 用户收益
 */
extern NSString *const SelectUserComissionStaticURL;
/**
 个人中心用户收益
 */
extern NSString *const SelectUserCenterSubComissionStaticURL;
/**
 个人中心轮播图列表
 */
extern NSString *const PersonalSlideshowListURL;
/**
  验证支付密码
 */
extern NSString *const VerifyPayPad;


//MARK:===========  APP配置模块  ===========
/**
 查询团队说明
 */
extern NSString *const SelectTeamExplainURL;
/**
 查询自定义邀请码设置
 */
extern NSString *const SelectUserInviteLvlURL;
/**
 查询滚动播报设置
 */
extern NSString *const SelectRollBroadcastURL;
/**
 查询专属导师配置
 */
extern NSString *const SelectTutorURL;
/**
 APP端查询消息列表
 */
extern NSString *const SelectAppListURL;
/**
 弹窗已读
 */
extern NSString *const AddPopTimesURL;
/**
 个人中心提现信息列表
 */
extern NSString *const SelectExtractCashMessageListURL;



//MARK:===========  优惠活动模块  ===========
/**
 APP端查询优惠活动列表
 */
extern NSString *const queryActivityListURL;
/**
 分页查询优惠活动申请列表
 */
extern NSString *const queryApplyActivityListURL;
/**
 该活动申请的次数
 */
extern NSString *const SelectCountURL;
/**
 APP端申请优惠活动
 */
extern NSString *const SaveActiveApplyURL;



//MARK:===========  红包模块  ===========
/**
  检查是否有发红包权限
 */
extern NSString *const CheckSendRedPackURL;
/**
  发红包
 */
extern NSString *const SendRedPackURL;
/**
  撤红包
 */
extern NSString *const RevokeRedPackURL;
/**
  领红包
*/
extern NSString *const ReveiceRedPackURL;
/**
  获取红包详情中
*/
extern NSString *const RedPackDetailURL;
/**
  单个红包领取记录
*/
extern NSString *const SingleRedPackRecordURL;
/**
  获取红包发放记录
*/
extern NSString *const SelectRedPackListURL;
/**
  获取红包领取记录
*/
extern NSString *const ReceiveRedPackRecordListURL;
/**
  领取用户红包发放统计
*/
extern NSString *const RedPackSendRedPackTotalURL;
/**
  领取用户红包发放统计
*/
extern NSString *const RedPackReceiveRedPackTotalURL;



//MARK:===========  商城模块  ===========
/**
  装修查询
 */
extern NSString *const SelectAppStoreSettingURL;
/**
 1.4.9自定义装修查询
 */
extern NSString *const SelectAppPageSettingByIdURL;
/**
 金刚区分类列表
 */
extern NSString *const SelectAPPHomeKongKimListURL;
/**
 首页商品分类列表查询
 */
extern NSString *const SelectIndexNavigationEnableListURL;
/**
 1.4.9广告列表查询
 */
extern NSString *const SelectRecommendListURL;
/**
  品牌列表
 */
extern NSString *const GetBrandInfoListURL;
/**
  品牌列表列表
 */
extern NSString *const GetBrandListURL;
/**
  品牌商品列表
 */
extern NSString *const GetBrandGoodsListURL;
/**
  大淘客-超级搜索
 */
extern NSString *const SelectDtkListSuperGoodsURL;
/**
 全网比价
 */
extern NSString *const SelectCutPriceComparisonURL;
/**
  大淘客-官方活动会场转链
 */
extern NSString *const SelectDtkActivityLinkURL;
/**
  官方活动会场转链-淘宝客
 */
extern NSString *const SelectTBActivityInfoTwoURL;
/**
  大淘客-店铺转链
 */
extern NSString *const SelectDtkShopConvertCodeURL;
/**
  精选低价包邮商品列表 9.9包邮
 */
extern NSString *const GetJxdjbyGoodsListURL;
/**
  高佣商品列表
 */
extern NSString *const GetGyGoodsURL;
/**
 大淘客-历史新低商品合集
 */
extern NSString *const GetHistoryLowPriceURL;
/**
  淘宝商品（天猫精选）
 */
extern NSString *const SelectTmjxGoodsDataURL;
/**
  淘宝商品（天猫超市）
 */
extern NSString *const SelectTmcsGoodsDataURL;
/**
  淘宝商品（聚划算）
 */
extern NSString *const SelectJhsGoodsDataURL;
/**
  淘宝商品（淘抢购）
 */
extern NSString *const SelectTqgGoodsDataURL;
/**
  偏远地区包邮商品列表
 */
extern NSString *const GetPybyGoodsListURL;
/**
  今日值得买商品列表
 */
extern NSString *const GetJrzdmGoodsListURL;
/**
 大淘客-大淘客独家券商品
 */
extern NSString *const SelectExclusiveGoodsListURL;
/**
  抖券列表
 */
extern NSString *const GetHdkGoodsListURL;
/**
  分页淘宝商品列表
 */
extern NSString *const SelectDtkGoodsListPageURL;
/**
 好单库--商品列表页API
 */
extern NSString *const SelectHDKItemListURL;
/**
  淘宝榜单数据
 */
extern NSString *const GetDtkRankingListURL;
/**
  淘宝榜单数据(折上折)
 */
extern NSString *const GetDtkZszGoodsListURL;
/**
  每日半价
 */
extern NSString *const SelectHalfPriceDayURL;
/**
  天天爆款(超值买返商品))
 */
extern NSString *const GetDtkBptjGoodsListURL;
/**
 好单库-实时佣金榜
 */
extern NSString *const SelectHDKCurrentCommissionURL;
/**
  淘宝(猜你喜欢)
 */
extern NSString *const GetDtkCnxhGoodsListURL;
/**
  淘宝(新猜你喜欢)
 */
extern NSString *const GetTBOptimusMaterialURL;
/**
  淘宝限时抢购
 */
extern NSString *const GetDtkXsqgGoodsListURL;
/**
  淘宝商品分类
 */
extern NSString *const AppSelectTaoBaoClassifyListURL;
/**
  淘宝大淘客详情
 */
extern NSString *const SelectDtkGoodsDetailURL;
/**
  淘宝好单库详情
 */
extern NSString *const SelectHDKGoodsDetailURL;
/**
  通过URL查询商品详情,可能查不出
 */
extern NSString *const SelectSearchURL;
/**
  淘宝高效转链接
 */
extern NSString *const SelectDtkPrivilegeLinkURL;
/**
  好单库淘宝高效转链接
 */
extern NSString *const GetHdkOutUrlURL;
/**
  唯品会商品列表
 */
extern NSString *const VipGoodsListURL;
/**
  唯品会关键字商品查询接口
 */
extern NSString *const QueryWithOauthURL;
/**
  唯品会商品详情
 */
extern NSString *const SelectByGoodsIdsWithOauthURL;
/**
  唯品会商品分类
 */
extern NSString *const AppSelectWphClassifyListURL;
/**
  唯品会根据商品id生成联盟链接
 */
extern NSString *const SelectGenByGoodsIdWithOauthURL;
/**
  唯品会链接转链
 */
extern NSString *const SelectByVIPUrlURL;
/**
  分页京东商品列表
 */
extern NSString *const SelectJdGoodsListPageURL;
/**
  京东商品分类
 */
extern NSString *const AppSelectJDClassifyListURL;
/**
  京东商品详情
 */
extern NSString *const SelectJdGoodsInfoURL;
/**
  京东生成联盟链接
 */
extern NSString *const SelectJdOutUrlURL;
/**
  京东活动转链
 */
extern NSString *const SelectJdShopLinkURL;
/**
  获取通用推广链接接口
 */
extern NSString *const SelectJdPromcommonUrlURL;
/**
  分页拼多多商品列表
 */
extern NSString *const SelectPddGoodsListPageURL;
/**
  拼多多-频道推广
 */
extern NSString *const GetChannelURL;
/**
  分页拼多多导航商品列表
 */
extern NSString *const GetChannelTwoURL;
/**
  拼多多-排行榜
 */
extern NSString *const GetRankListURL;
/**
  拼多多-抽免单
 */
extern NSString *const GetFreeOrderURL;
/**
  拼多多-天天领红包
 */
extern NSString *const GetDayRedPackURL;
/**
  拼多多商品分类
 */
extern NSString *const AppSelectPddClassifyListURL;
/**
  拼多多商品详情查询
 */
extern NSString *const SelectPddGoodsDetailURL;
/**
  拼多多群活动添加商品接口
 */
extern NSString *const SelectAddPddGoodsDetailURL;
/**
  拼多多生成联盟链接
 */
extern NSString *const SelectPddOutUrlURL;
/**
  拼多多-生成多多进宝活动推广转链
 */
extern NSString *const SelectPddResourceUrlGenURL;
/**
  分页苏宁商品列表
 */
extern NSString *const InverstmentCommodityQueryURL;
/**
  商品精选接口
 */
extern NSString *const SelectRecommendCommodityQueryURL;
/**
  查询苏宁商品分类
 */
extern NSString *const AppSelectSnClassifyListURL;
/**
  苏宁推广商品详情信息接口
 */
extern NSString *const CommoditydetailQueryURL;
/**
  苏宁关键字商品查询接口
 */
extern NSString *const SearchCommodityQueryURL;
/**
  取商品或店铺推广链接接口
 */
extern NSString *const StorepromotionurlQueryURL;
/**
  苏宁店铺转链接口
 */
extern NSString *const BacthCustomLinkQueryURL;
/**
  查询商品导航
 */
extern NSString *const AppSelectNavigationListURL;
/**
  查询轮播图列表
 */
extern NSString *const SelectSlideshowListURL;
/**
 查询基础设置
 */
extern NSString *const SelectTwoPageBasicsSettingURL;
/**
  大淘客-联想词
 */
extern NSString *const SelectDtkSearchSuggestionURL;
/**
  清空最近搜索
 */
extern NSString *const DeleteSearchWordURL;
/**
  查询最近搜索列表
 */
extern NSString *const SelectHistorySearchWordListURL;
/**
  查询大淘客-热搜记录列表
 */
extern NSString *const SelectDtkTopURL;
/**
  验证当前用户是否已授权
 */
extern NSString *const CheckTbAuthorizeURL;
/**
  获取唯易淘客授权的URL
 */
extern NSString *const SelectVeAuthorizeUrlURL;
/**
 大淘客-淘系商品历史券后价API
 */
extern NSString *const SelectDTKPriceTrendURL;
/**
 大淘客-京东商品历史券后价API
 */
extern NSString *const SelectDTKHistoryPriceRecordsURL;
/**
  获取淘宝授权码Code的URL
 */
extern NSString *const SelectTaoBaoAuthorizeUrlURL;
/**
  获取美团外卖红包推广链接
 */
extern NSString *const SelectMeiTuanSpreadURL;
/**
  获取美团外卖红包推广链接
 */
extern NSString *const GenerateLinkURL;
/**
  获取美团-蔬菜团购推广链接
 */
extern NSString *const SelectMeiTuanVegetablesURL;
/**
  获取美团-优选
 */
extern NSString *const SelectMeiTuanOptimizationURL;
/**
  淘宝客-饿了么活动转链
 */
extern NSString *const SelectTBActivityInfoURL;
/**
  海威优惠券
 */
extern NSString *const SelectHWBrandURL;
/**
  比价
 */
extern NSString *const SelectAppRegulationURL;

//MARK:===========  主题模块 商品板块  ===========
/**
  APP端查询主题活动下商品集合
 */
extern NSString *const SelectLocalityGoodsListURL;
/**
  APP查询所有主题活动集合
 */
extern NSString *const SelectThemeActivityALLURL;
/**
  APP查询主题活动
 */
extern NSString *const SelectThemeActivityURL;
/**
  查询商品板块数据
 */
extern NSString *const AppSelectGoodsPlateURL;
/**
  查询商品板块
 */
extern NSString *const SelectGoodsPlateURL;


//MARK:===========  订单模块  ===========
/**
  我的订单
 */
extern NSString *const SelectGoodsOrderAppPageURL;
/**
  其他订单
 */
extern NSString *const SelectOtherGoodsOrderAppPageURL;
/**
  订单找回
 */
extern NSString *const SelectNoUserGoodsOrderPageURL;
/**
  绑定订单
 */
extern NSString *const BindGoodsOrderAppURL;
/**
  查看订单说明
 */
extern NSString *const SelectOrderExplainAllURL;


//MARK:===========  商品收藏与足迹模块  ===========
/**
  新增商品收藏或足迹
 */
extern NSString *const InsertGoodsCollectNewURL;
/**
  删除商品收藏或足迹
 */
extern NSString *const DeleteGoodsCollectURL;
/**
  查询商品收藏或足迹列表
 */
extern NSString *const SelectGoodsCollectListURL;
/**
  查询商品是否收藏
 */
extern NSString *const SelectWhetherCollectURL;


//MARK:===========  会员提现模块  ===========
/**
  查看提现规则配置
 */
extern NSString *const SelectExtractCashRuleURL;
/**
  新增提现
 */
extern NSString *const InsertExtractCashURL;
/**
  查看提现列表
 */
extern NSString *const AppSelectExtractCashListURL;
/**
  会员资金记录列表(余额明细)
 */
extern NSString *const SelectUserAppAccountRecordPageURL;
/**
  会员欠款金额
 */
extern NSString *const SelectUserDebtsAccountRecordSumURL;
/**
  会员欠款记录列表
 */
extern NSString *const SelectUserAccountDebtsRecordPageURL;
/**
   提现方式 微信 的绑定
 */
extern NSString *const WxPayAccountURL;
/**
 提现方式 微信 解除绑定
 */
extern NSString *const RelieveWxPayAccountURL;


//MARK:===========  比价备案模块  ===========
/**
  生成拼多多绑定备案
 */
extern NSString *const AddPddGenerateRecordsURL;
/**
  查询拼多多是否已经绑定备案---是true；否false
 */
extern NSString *const AelectPddOauthMemberAuthorityURL;
/**
  查询粘贴板配置
 */
extern NSString *const SelectPasteBoardURL;
/**
  新增活跃度
 */
extern NSString *const InsertUserLivelyURL;


//MARK:===========  订单红包雨模块  ===========
/**
  领取红包
 */
extern NSString *const GetOrderRedPackURL;
/**
  领取红包资格次数
 */
extern NSString *const GetOrderRedPackTimesURL;
/**
  查询待领取红包
 */
extern NSString *const SelectAppOrderRedPackListURL;
/**
  资格类型
 */
extern NSString *const SelectTimesTypeURL;
/**
  查询用户资格明细
 */
extern NSString *const SelectAppOrderRedPackTimesRecordPageURL;
/**
  查询待领取红包资格
 */
extern NSString *const SelectOrderRedPackTimesURL;
/**
  查询历史活动列表
 */
extern NSString *const SelectOrderRedPackTimesHisPageURL;
/**
  查询开启的订单红包雨活动
 */
extern NSString *const SelectOrderTaskOpenURL;
/**
  查询用户可领取红包次数
 */
extern NSString *const SelectUserOrderRedPackTimesURL;
/**
  领取红包记录
 */
extern NSString *const SelectOrderRedPackRecordListURL;


//MARK:===========  群定时红包雨模块  ===========
/**
  取消群定时红包雨
 */
extern NSString *const CancelTeamRedPackURL;
/**
  添加群红包雨-可提余额
 */
extern NSString *const InsertTeamRedPackURL;
/**
  app获取要开始的群红包雨
 */
extern NSString *const SelectTimeRedPackURL;
/**
  分页查询群定时红包雨
 */
extern NSString *const SelectTimeRedPackPageURL;
/**
  群红包雨领取记录列表
 */
extern NSString *const SelectUserRedPackRecordByIdURL;
/**
  领群定时红包
 */
extern NSString *const InsertTimeRedPackRecordURL;


//MARK:===========  群签到模块  ===========
/**
  群签到信息查询
 */
extern NSString *const UpdateUserTeamAcitveURL;
/**
  用户群签到
 */
extern NSString *const SelectAppTeamAcitveURL;
/**
  修改群签到属性
 */
extern NSString *const updateTeamAcitveStatusURL;


//MARK:===========  任务中心模块  ===========
/**
  查询每日任务
 */
extern NSString *const SelectTaskList;
/**
  查询每日签到天数
 */
extern NSString *const SelectUserActiveByUserIdUrl;
/**
  更新 完成任务次数
 */
extern NSString *const UpdateTaskJoinTimes;
/**
  领取任务奖励
 */
extern NSString *const UpdateTaskJoin;

/**
  查看喵币兑换配置
 */
extern NSString *const SelectAppGold;

/**
  用户喵币兑换
 */
extern NSString *const UpdateGoldAccount;

/**
  会员喵币记录列表
 */
extern NSString *const SelectAppUserGoldRecordPage;
/**
  拉新 查询开启活动
 */
extern NSString *const SelectLachineTaskRankOpen;
/**
  拉新 查询邀请好友排行榜
 */
extern NSString *const SelectAppLachineTaskRankPage;

/**
  拉新 查询历史活动
 */
extern NSString *const SelectFinishLachineTask;
/**
  拉新 查询已结束活动的列表
 */
extern NSString *const SelectFinishLachineTaskListPage;
/**
  查询邀请明细数量 和 奖励明细 金额
 */
extern NSString *const SelectAppInviteRecordNum;

/**
  查询邀请明细
 */
extern NSString *const SelectAppInviteRecordPage;
/**
  查询奖励明细金额-不传ID获取当前进行中活动的
 */
extern NSString *const SelectAppRewardRecordSumURL;
/**
  查询奖励明细
 */
extern NSString *const SelectAppRewardRecordPage;
/**
  查询拉新活动好友排行榜
 */
extern NSString *const SelectRankingList;



//MARK:===========  现金券活动模块  ===========
/**
  查询现金券活动(用户)
 */
extern NSString *const SelectUserCouponTaskStatusPageUrl;
/**
  查询现金券活动
 */
extern NSString *const SelectCouponTaskStatusPage;
/**
  取消待开始活动
 */
extern NSString *const CancelCouponTaskUrl;
/**
  添加现金券活动到草稿箱
 */
extern NSString *const InsertCouponTaskUrl;
/**
  领取现金券
 */
extern NSString *const InsertCouponTaskUserUrl;
/**
  查询活动详情
 */
extern NSString *const SelectCouponTaskDetailUrl;
/**
  查询活动详情1.5.4
 */
extern NSString *const SelectCouponUserDetaillUrl;
/**
  查询草稿箱的活动
 */
extern NSString *const SelectDraftCouponTaskUrl;
/**
  删除草稿箱活动
 */
extern NSString *const DeleteCouponTaskUrl;
/**
  修改草稿箱活动
 */
extern NSString *const UpdateCouponTaskDraftUrl;
/**
  修改草稿箱活动并支付
 */
extern NSString *const UpdateCouponTaskDraftAndPayUrl;
/**
  修改待开始活动
 */
extern NSString *const UpdateCouponTaskNoBeginUrl;
/**
  查询活动教程
 */
extern NSString *const AppSelectActionTutorialUrl;
/**
  查询活动规则
 */
extern NSString *const AppSelectActionRulesUrl;
/**
  添加现金券活动并支付
 */
extern NSString *const InsertCouponTaskAndPayUrl;
/**
  结束进行中活动
 */
extern NSString *const UpdateCouponTaskOverUrl;
/**
  结束进行中活动
 */
extern NSString *const UpdateCouponTaskBeginUrl;
/**
  查询未使用优惠券
 */
extern NSString *const SelectNoUseCouponUserPageUrl;
/**
  查询已使用优惠券
 */
extern NSString *const SelectUseCouponUserPageUrl;
/**
  查询已过期优惠券
 */
extern NSString *const SelectOverCouponUserPageUrl;
/**
 查询已经排序券
 */
extern NSString *const SelectCouponUserSortListUrl;
/**
 保存券的使用顺序
 */
extern NSString *const InsertCouponUserSortUrl;
/**
 1.5.4-删除此券的排序
 */
extern NSString *const DeleteCouponUserSortByIdUrl;
/**
  参与名单
 */
extern NSString *const SelectAPPCouponUserPageUrl;
/**
  修改群-拼团活动展示开关-返利劵活动展示开关-红包雨活动展示开关
 */
extern NSString *const UpdateTeamActivityShowUrl;


//MARK:===========  拼团活动模块  ===========
/**
  查询拼团活动(用户端)
 */
extern NSString *const SelectUserGroupTaskStatusPageUrl;
/**
  查询拼团活动
 */
extern NSString *const SelectGroupTaskStatusPageUrl;
/**
  添加拼团活动到草稿箱
 */
extern NSString *const InsertGroupTaskUrl;
/**
  查询草稿箱的活动
 */
extern NSString *const SelectDraftGroupTaskUrl;
/**
  删除草稿箱活动
 */
extern NSString *const DeleteGroupTaskUrl;
/**
  修改草稿箱活动
 */
extern NSString *const UpdateGroupTaskDraftUrl;
/**
  修改草稿箱活动并支付
 */
extern NSString *const UpdateGroupTaskDraftAndPayUrl;
/**
  添加拼团活动并支付
 */
extern NSString *const InsertGroupTaskAndPayUrl;
/**
  查询拼团活动教程
 */
extern NSString *const AppSelectPinTuanTutorialUrl;
/**
  查询拼团活动规则
 */
extern NSString *const AppSelectPinTuanActionRulesUrl;
/**
  修改进行中活动
 */
extern NSString *const UpdateGroupTaskBeginUrl;
/**
  修改待开始活动
 */
extern NSString *const UpdateGroupTaskNoBeginUrl;
/**
  取消待开始活动
 */
extern NSString *const CancelGroupTaskUrl;
/**
  查询活动详情
 */
extern NSString *const SelectGroupTaskDetailUrl;
/**
  查询活动详情(用户)
 */
extern NSString *const SelectGroupTaskDtoUrl;
/**
  查询活动明细
 */
extern NSString *const SelectGroupTaskOrderDetailUrl;
/**
  拼团活动订单页(用户)订单列表
 */
extern NSString *const SelectGroupTaskOrderDetailOwnerUrl;
/**
  拼团活动订单页(用户)
 */
extern NSString *const SelectGroupTaskStaticDtoUrl;
/**
  添加查看分享记录
 */
extern NSString *const InsertGroupTaskShareRecordUrl;


//MARK:===========  打卡模块  ===========
/**
  添加打卡活动
 */
extern NSString *const InsertPunchTheClockTaskUrl;
/**
  查询打卡活动列表
 */
extern NSString *const SelectPunchTheClockTaskPageUrl;
/**
  结束待开始的活动
 */
extern NSString *const CancelPunchTheClockTaskUrl;
/**
  编辑打卡活动
 */
extern NSString *const UpdatePunchTheClockTaskUrl;
/**
  查询活动详情(管理端)
 */
extern NSString *const SelectPunchTheClockTaskDetailUrl;
/**
  查询活动详情(用户)
 */
extern NSString *const SelectClockTaskDetailUrl;
/**
  查询活动参与明细（管理端）
 */
extern NSString *const SelectPunchTheClockTaskApplyUrl;
/**
  查询打卡活动(进行中)
 */
extern NSString *const SelectStartPunchTheClockTaskUrl;
/**
  用户报名
 */
extern NSString *const InsertPunchTheClockTaskApplyUrl;
/**
  打卡活动动态集合(用户)
 */
extern NSString *const SelectClockTaskClockDynamicPageUrl;
/**
  我的进度(用户)
 */
extern NSString *const SelectClockTaskApplyClockAllUrl;
/**
  用户打卡
 */
extern NSString *const InsertClockDynamicUrl;
/**
  查询活动教程
 */
extern NSString *const DaKaActionTutorialUrl;
/**
  查询历史报表 合伙人中心 对账单
 */
extern NSString *const SelectHisPartnerReportPageUrl;
/**
  查询历史报表 合伙人中心 对账单 详情
 */
extern NSString *const SelectPartnerReportDetailListUrl;
/**
  查询团队用户信息
 */
extern NSString *const SelectPartnerTeamDetailUrl;
/**
  查询团队人数和收益
 */
extern NSString *const SelectPartnerTeamUrl;
/**
 按邀请码查询用户信息
 */
extern NSString *const SelectUserToInvitationUrl;
/**
 App 端添加用户上级
 */
extern NSString *const AddUserLeadUrl;

/**
 拉新活动
 */
extern NSString *const SelectAppInviteNewTask;

/**
 
 APP端查询邀请记录
 */
extern NSString *const SelectAppRecordListPageUrl;

/**
  APP端查询排行榜
 */
extern NSString *const SelectRankingListUrl;

/**
  APP端查询排行榜
 */
extern NSString *const SelectOpenUserLvlListUrl;
/**
 合伙人奖励明细
 */
extern NSString *const SelectPltRewardRecordPageUrl;
/**
 查询业绩和团队数据
 */
extern NSString *const SelectDataByMonthForAppUrl;
/**
 查询订单统计
 */
extern NSString *const SelectPartnerDataReportDetailByMonthUrl;

//MARK:===========  淘礼金  ===========
/**
 app端淘礼金配置
 */
extern NSString *const SelectAppTaoGiftConfigUrl;
/**
 app端0元免单商品列表（内含用户资格次数）goodsList--淘礼金商品列表，qualification--资格次数
 */
extern NSString *const SelectTaoGiftGoodsListUrl;
/**
 淘礼金资格过期时间
 */
extern NSString *const SelectUserCountDownInPastTimeUrl;
/**
 淘礼金商品列表
 */
extern NSString *const SelectAppTaoGiftGoodsListUrl;
/**
 立即抢购
 */
extern NSString *const RushToPurchaseUrl;
/**
 我的免单
 */
extern NSString *const SelectAppGoodsGetRecordListPageUrl;


//MARK:===========  埋点  ===========
/**
 用户查券记录
 */
extern NSString *const InsertQueryCouponUrl;
/**
 查询后续操作
 */
extern NSString *const UpdateQueryCouponUrl;
/**
 用户查券记录
 */
extern NSString *const InsertBuryingPointUrl;


//MARK:===========  拼购模块  ===========
/**
 查看拼购列表
 */
extern NSString *const SelectAPPHomeShowPoolSharingUrl;
/**
 查看拼购列表
 */
extern NSString *const SelectAppPoolSharingPageUrl;
/**
 查看拼购bannerList
 */
extern NSString *const SelectPoolBannerListUrl;
/**
 查看商品分类list
 */
extern NSString *const SelectGoodsTypeEnableListUrl;
/**
 查看拼购详情id
 */
extern NSString *const SelectPoolSharingByIdUrl;
/**
 查看拼购详情Poolsn
 */
extern NSString *const SelectPoolSharingBySnUrl;
/**
 收藏拼购
 */
extern NSString *const InsertUserPoolCollectUrl;
/**
 分享拼购
 */
extern NSString *const SelectPoolShareSettingUrl;
/**
 查看精选列表
 */
extern NSString *const SelectAppPoolSharingChiosePageUrl;
/**
 用户查看订单列表
 */
extern NSString *const SelectUserPoolOrderPageUrl;
/**
 订单详情
 */
extern NSString *const SelectPoolOrderByIdUrl;
/**
 查看红包变动类型
 */
extern NSString *const SelectUserPoolChangeCodeUrl;
/**
 查看红包记录
 */
extern NSString *const SelectUserOwnerPoolRedChangeRecordPageUrl;
/**
 排行榜
 */
extern NSString *const SelectPoolRankingListUrl;
/**
 查看拼购配置
 */
extern NSString *const SelectAppPoolShaingConfigUrl;
/**
 用户红包兑换
 */
extern NSString *const UpdatePoolAccountUrl;
/**
 查看新手指引
 */
extern NSString *const SelectAppPoolSharingNewPointUrl;
/**
 参与拼购 付款接口
 */
extern NSString *const InsertPoolOrderUrl;
/**
 物流信息查询
 */
extern NSString *const SelectSendDataByIdUrl;
/**
 支付订单 支付代付款订单
 */
extern NSString *const UpdatePoolOrderUrl;
/**
 支付订单 支付代付款订单
 */
extern NSString *const UpdatePoolOrderEndUrl;
/**
 拼购商品收藏
 */
extern NSString *const SelectUserPoolCollectListUrl;
/**
 */
extern NSString *const DeleteUserPoolCollectUrl;

extern NSString *const SelectPoolHelpListUrl;
/**
 我的拼购统计
 */
extern NSString *const SelectPoolOrderStatisticsUrl;


//MARK:===========  单单奖励  ===========

/**
 查询代理周周奖励
 */
extern NSString *const SelectOrderWeekRewardUrl;
/**
 查询代理周周奖励排行榜
 */
extern NSString *const SelectOrderWeekRewardRankUrl;
/**
 查询代理周周奖励合计
 */
extern NSString *const SelectOrderWeekRewardStaticUrl;
/**
 查询代理周周奖励平台统计
 */
extern NSString *const SelectOrderWeekRewardStaticByPltUrl;
/**
 查询代理周周奖励平台统计
 */
extern NSString *const SelectAppOrderWeekRewardStaticPageUrl;
/**
 代理周周奖励明细（失效）
 */
extern NSString *const SelectDisableOrderWeekRewardPageUrl;

/**
 查询代理邀新奖励
 */
extern NSString *const SelectPltRewardUrl;
/**
 查询代理邀新奖励排行榜
 */
extern NSString *const SelectPltRewardRankUrl;
/**
 查询代理邀新奖励合计
 */
extern NSString *const SelectPltRewardStaticUrl;
/**
 查询代理邀新奖励平台统计
 */
extern NSString *const SelectPltRewardStaticByPltUrl;
/**
 代理奖励明细
 */
extern NSString *const SelectAppPltRewardStaticPageUrl;
/**
 代理首单奖励明细（失效）
 */
extern NSString *const SelectDisablePltPartnerFirstRewardPageUrl;
/**
 移动端跑马灯
 */
extern NSString *const SelectHorseRaceLampUrl;
/**
 资格活动弹窗---返回值可能为null
 */
extern NSString *const SelectTaoGiftQualificationActivityByPopUrl;
/**
 指令搜索列表
 */
extern NSString *const SelectInstructSearchListUrl;


//MARK:===========  本地生活  ===========
/**
 顶部导航列表
 */
extern NSString *const SelectLocalLifeNavigationListUrl;
/**
 中间轮播图列表
 */
extern NSString *const SelectLocalLifeSlideshowListUrl;
/**
 获取美团优选商品列表
 */
extern NSString *const SelectMeiTuanSkuQueryUrl;
/**
 秒杀团单列表信息
 */
extern NSString *const SelectSeckillListUrl;
/**
 秒杀场次信息接口
 */
extern NSString *const SelectSeckillShowinfoUrl;
/**
 中间胶囊图列表
 */
extern NSString *const SelectLocalLifeCapsuleListUrl;
/**
 到店列表
 */
extern NSString *const SelectSearchDealsUrl;
/**
 其他到店列表
 */
extern NSString *const selectTBKMaterialOptionalUrl;

//MARK:===========  百亿补贴  ===========
/**
 补贴商品-分类列表
 */
extern NSString *const SelectSubsidyGoodsClassifyListUrl;
/**
 APP端-补贴商品列表
 */
extern NSString *const SelectAPPSubsidyGoodsListPageUrl;
/**
 用户查询补贴活动
 */
extern NSString *const SelectAPPSubsidyActivityUrl;
/**
 新增补贴活动用户红包
 */
extern NSString *const InsertSubsidyActivityRedPackUrl;
/**
 用户点击补贴商品
 */
extern NSString *const GetSubsidyUrlUrl;
/**
 APP端-用户领取记录列表
 */
extern NSString *const SelectAPPSubsidyActivityGetRecordListPageUrl;
/**
 APP端（首页使用）-补贴商品列表
 */
extern NSString *const SelectAPPSubsidyGoodsListUrl;
/**
 APP端（首页使用）-补贴商品首页展示列表 增加权重
 */
extern NSString *const SelectAPPShowSubsidyGoodsListUrl;


//MARK:===========  聚推客  ===========
/**
 获取肯德基在线点餐活动链接
 */
extern NSString *const SelectKFCActUrl;
/**
 获取电影票在线预定活动链接
 */
extern NSString *const SelectCinemaActUrl;
/**
 1.5.3-高德打车CPS+CPA接口
 */
extern NSString *const SelectGDActUrl;
/**
 1.5.3-电费充值活动转链接口
 */
extern NSString *const SelectElectricityActUrl;
/**
 获取麦当劳在线点餐活动链接
 */
extern NSString *const SelectMcdanaldActUrl;
/**
 获话费充值活动链接
 */
extern NSString *const SelectRechargeMobileUrl;
/**
 滴滴打车/加油/货运CPS接口
 */
extern NSString *const SelectDiDiActUrl;
/**
 修改领取弹窗状态
 */
extern NSString *const UpdateSubsidyActivityRedPackPopUrl;


//MARK:===========  喵币夺宝  ===========
/**
 查看喵币夺宝配置
 */
extern NSString *const SelectGoldShaingConfigUrl;
/**
 夺宝活动数据
 */
extern NSString *const SelectAppGoldSharingPageUrl;
/**
 夺宝活动数据 提现页
 */
extern NSString *const SelectAppGoldSharingCashShowUrl;
/**
 参与夺宝活动
 */
extern NSString *const InsertGoldIssueUserUrl;
/**
 夺宝活动数据详情
 */
extern NSString *const SelectGoldSharingByIdUrl;
/**
 我的夺宝活动数据详情
 */
extern NSString *const SelectGoldSharingDetailByIdAndIssueUrl;
/**
 往期开奖记录
 */
extern NSString *const SelectGoldIssueResultPageUrl;
/**
 获取晒单广场数据
 */
extern NSString *const SelectGoldIssueUserSharePageUrl;
/**
 我的晒单
 */
extern NSString *const SelectUserGoldIssueUserSharePageUrl;
/**
 夺宝晒单
 */
extern NSString *const InsertGoldIssueUserShareUrl;
/**
 我的夺宝
 */
extern NSString *const SelectAppGoldIssueUserPageUrl;
/**
 获取最近一次物流信息
 */
extern NSString *const SelectGoldIssueUserSendDataUrl;
/**
 修改物流信息
 */
extern NSString *const UpdateGoldIssueUserSendDataUrl;
/**
 获取物流信息
 */
extern NSString *const SelectGoldIssueUserSendDataByIdUrl;
/**
 1.5.2用户余额兑换喵币
 */
extern NSString *const UpdateAccountChangeGoldUrl;

//MARK:===========  平台现金券  ===========
/**
 平台现金券轮播图
 */
extern NSString *const SelectCouponsSlideshowListUrl;
/**
 券交易中心
 */
extern NSString *const SelectSalingCouponSaleRecordPageUrl;
/**
 1.5.3-首页数据统计
 */
extern NSString *const SelectUseScopeTypeStaticUrl;
/**
 1.5.3-交易记录详情
 */
extern NSString *const SelectCouponSaleRecordDetailByIdUrl;
/**
 查询现金券交易基础配置（APP端）
 */
extern NSString *const SelectAPPCouponDealControlUrl;
/**
 1.5.3-出售返利券
 */
extern NSString *const InsertCouponSaleRecordUrl;
/**
 1.5.3-我发布的
 */
extern NSString *const SelectUserSalingCouponSaleRecordPageUrl;
/**
 1.5.3-我卖出的
 */
extern NSString *const selectUserSaleSucCouponSaleRecordListUrl;
/**
 1.5.3-我卖出的(合计)
 */
extern NSString *const selectUserSaleSucCouponSaleRecordStaticUrl;
/**
 1.5.3-我买到的
 */
extern NSString *const selectUserBuySucCouponSaleRecordListUrl;
/**
 1.5.3-我买到的(合计)
 */
extern NSString *const selectUserBuySucCouponSaleRecordStaticUrl;
/**
 1.5.3-我的(抢购失败)
 */
extern NSString *const selectUserErrorCouponSaleRecordListUrl;
/**
 1.5.3-我的下架记录
 */
extern NSString *const selectUserFailCouponSaleRecordListUrl;
/**
 1.5.3-用户下架
 */
extern NSString *const updateUserCouponSaleRecordDownUrl;
/**
 1.5.3-降价
 */
extern NSString *const updateCouponSaleRecordMoneyUrl;
/**
 1.5.3-编辑
 */
extern NSString *const updateUserCouponSaleRecordUrl;
/**
 1.5.3-购买券
 */
extern NSString *const InsertCouponBuyOrderUrl;
/**
 1.5.3-查询订单的状态
 */
extern NSString *const SelectCouponBuyOrderByPayIdUrl;
/**
 1.5.3-券交易中心-滚动播报
 */
extern NSString *const SelectCouponBroadcastListUrl;
/**
 拼多多-生成营销工具推广链接
 */
extern NSString *const GetChannelThreeURL;
/**
 1.5.3-查询可以使用的券
 */
extern NSString *const SelectCanUseCouponUserURL;
/**
 1.5.3-查询指定平台
 */
extern NSString *const SelectPlatformListURL;
/**
 1.5.4-商品详情页广告图
 */
extern NSString *const SelectPltTypeSlideshowListURL;
/**
 1.5.4-新版提现页面广告列表
 */
extern NSString *const SelectNewExtractSlideshowListURL;
/**
 1.5.4-聚推客分享
 */
extern NSString *const SelectHFiveAppSettingURL;
/**
 1.5.4-查询饿了么H5页面(app端)
 */
extern NSString *const SelectAPPElmHFivePageURL;
/**
 1.5.4-三方H5数据加密和解密接口
 */
extern NSString *const DisposeDataURL;
/**
 1.5.4-第三方订单支付
 */
extern NSString *const PayThrH5OrderURL;
/**
 1.5.5-获取抖音分销直播间列表
 */
extern NSString *const SelectDouYinSelfLiveMaterialURL;
/**
 1.5.5-获取抖音推广转链
 */
extern NSString *const SelectDouYinLinkURL;

@end

NS_ASSUME_NONNULL_END
