//
//  NBNetworkApi.m
//  NiceIM
//
//  Created by mac on 2020/2/25.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NBNetworkApi.h"

@implementation NBNetworkApi


//===============================================
//               api错误定义
//===============================================

NSString *const ApiRequestSuccess = @"011000";

NSString *const ApiVerificationImageCodeError = @"0300034";

NSString *const ApiNotRegisteredError = @"0300042";

NSString *const ApiVerificationCodeError = @"0300036";

NSString *const ApiPasswordError = @"030012";

NSString *const ApiAccountError = @"030009";

NSString *const ApiDisableAccountError = @"030010";

NSString *const ApiJionTeamByYunXin = @"0400010";

NSString *const ApiAccountNotLogin = @"001000";

NSString *const ApiAccountFreeze = @"030026";

NSString *const ApiRedPackTakeOut = @"13000008";

NSString *const ApiRedPackOverdue = @"13000004";

NSString *const ApiOrderRedPackNoChance = @"16000008";

NSString *const ApiOrderRedPackTakeOut = @"16000007";

NSString *const ApiOrderRedPackOverdue = @"16000009";

NSString *const ApiMoneyPassword = @"030032";

NSString *const ApiCouponReceiveMax = @"17000004";

NSString *const ApiPDDError = @"1100001";


//===============================================
//               api接口
//===============================================

NSString *const IOSDyPathResponseURL = @"user/app/open/iosDyPathResponse";

NSString *const SendSmsURL = @"user/app/open/user/sendSms";

NSString *const CaptchaImageURL = @"user/open/captchaImage";

NSString *const RegUserByMobileURL = @"user/app/open/user/regUserByMobile";

NSString *const AliyunMobileLoginURL = @"user/app/open/aliyunMobileLogin";

NSString *const SelectMobileSecret = @"user/app/open/config/selectMobileSecret";

NSString *const AliyunMobileBinding = @"user/app/open/user/aliyunMobileBinding";

NSString *const RegisterBindingOriginalAccountURL = @"user/app/open/user/registerBindingOriginalAccount";

NSString *const RegisterWithOneClickURL = @"user/app/open/user/registerWithOneClickTwo";

NSString *const AliyunBindingMobileURL = @"user/app/home/user/aliyunBindingMobile";

NSString *const qqLoginURL = @"user/app/open/qqLogin";

NSString *const appTaoBaoLoginURL = @"user/app/open/appTaoBaoLogin";

NSString *const weixinLoginURL = @"user/app/open/weixinLoginTwo";

NSString *const oneClickBindingMobileURL = @"user/app/open/user/oneClickBindingMobile";

NSString *const LoginURL = @"user/app/open/login";

NSString *const LogoutURL = @"user/app/home/logout";

NSString *const UserProURL = @"user/app/open/protocol/selectUserPro";

NSString *const PrivacyProURL = @"user/app/open/protocol/selectPrivacyPro";

NSString *const AppSelectPlatformAndTransactionURL = @"user/app/open/protocol/appSelectPlatformAndTransaction";

NSString *const UpdatePasswordURL = @"user/app/home/user/updatePassword";

NSString *const ForgetPasswordURL = @"user/app/open/user/forgetPassword";

NSString *const VerifyMobileURL = @"user/app/open/user/verifyMobile";

NSString *const InsertQuestionURL = @"user/app/home/question/insertQuestion";

NSString *const SetPasswordURL = @"user/app/home/user/setPassword";

NSString *const AppSelectPddRegulationURL = @"user/app/open/protocol/appSelectPddRegulation";

NSString *const AppSelectTbRegulationURL = @"user/app/open/protocol/appSelectTbRegulation";

NSString *const ChangeShortUrlURL = @"user/app/home/parameter/changeShortUrl";

NSString *const CheckAddFriendURL = @"user/app/home/team/checkAddFriend";

NSString *const DeleteUserFriendURL = @"user/app/home/userFriend/deleteUserFriend";

NSString *const SaveUserFriendApplyURL = @"user/app/home/userFriend/saveUserFriendApply";

NSString *const UpdateUserFriendURL = @"user/app/home/userFriend/updateUserFriend";

NSString *const SelectUserByKeyWordURL = @"user/app/home/user/selectUserByKeyWord";

NSString *const SelectTeamInfoByTidURL = @"user/app/home/team/selectTeamInfoByTid";

NSString *const SelectTeamGameByPageURL = @"user/app/home/teamGame/selectTeamGameByPage";

NSString *const SelectUseTeamGameURL = @"user/app/home/teamGame/selectUseTeamGame";

NSString *const DeleteTeamGameRelationURL = @"user/app/home/teamGame/deleteTeamGame";

NSString *const SaveTeamGameRelationURL = @"user/app/home/teamGame/saveTeamGameRelation";

NSString *const SelectTeamTagByPageURL = @"user/app/home/teamTag/selectTeamTagByPage";

NSString *const SelectUseTeamTagURL = @"user/app/home/teamTag/selectUseTeamTag";

NSString *const SaveTeamTagRelationURL = @"user/app/home/teamTag/saveTeamTagRelation";

NSString *const DeleteTeamTagRelationURL = @"user/app/home/teamTag/deleteTeamTagRelation";

NSString *const SelectTeamLinkByPageURL = @"user/app/home/teamLink/selectTeamLinkByPage";

NSString *const SelectUseTeamLinkURL = @"user/app/home/teamLink/selectUseTeamLink";

NSString *const SaveTeamLinkRelationURL = @"user/app/home/teamLink/saveTeamLinkRelation";

NSString *const DeleteTeamLinkRelationURL = @"user/app/home/teamLink/deleteTeamLinkRelation";

NSString *const AppSelectAllURL = @"user/app/home/groupWaiter/appSelectAll";

NSString *const SelectTeamWaiterURL = @"user/app/home/groupWaiter/selectTeamWaiter";

NSString *const AppSelectListURL = @"user/app/home/setWaiter/appSelectList";

NSString *const DeleteTeamWaiterRelationURL = @"user/app/home/setWaiter/deleteTeamWaiterRelation";

NSString *const SaveTeamWaiterRelationURL = @"user/app/home/setWaiter/saveTeamWaiterRelation";

NSString *const UpdateTeamWaiterRelationURL = @"user/app/home/setWaiter/updateTeamWaiterRelation";

NSString *const ChangeTeamOwnerForOwnerURL = @"user/app/home/team/changeTeamOwnerForOwner";

NSString *const CheckForceJoinTeamURL = @"user/app/home/team/checkForceJoinTeam";

NSString *const CheckCreateTeamURL = @"user/app/home/team/checkCreateTeam";

NSString *const CheckJoinTeamURL = @"user/app/home/team/checkJoinTeam";

NSString *const JoinTeamByManagerURL = @"user/app/home/team/joinTeamByManager";

NSString *const ChangeUserTeamManagerURL = @"user/app/home/team/changeUserTeamManager";

NSString *const RemoveUserTeamManagerURL = @"user/app/home/team/removeUserTeamManager";

NSString *const KickTeamByOwnerURL = @"user/app/home/team/kickTeamByOwner";
 
NSString *const JoinTeamByUserURL = @"user/app/home/team/joinTeamByUser";

NSString *const LeaveTeamURL = @"user/app/home/team/leaveTeam";

NSString *const MuteTeamURL = @"user/app/home/team/muteTeam";

NSString *const MuteTeamUserURL = @"user/app/home/team/muteTeamUser";

NSString *const RemoveTeamURL = @"user/app/home/team/removeTeam";

NSString *const SaveTeamURL = @"user/app/home/team/saveTeam";

NSString *const UpdateTeamURL = @"user/app/home/team/updateTeam";

NSString *const UpdateUserTeamNickURL = @"user/app/home/team/updateUserTeamNick";

NSString *const SelectTeamNoticeByPageURL = @"user/app/home/teamNotice/selectTeamNoticeByPage";

NSString *const UpdateTeamNoticeURL = @"user/app/home/teamNotice/updateTeamNotice";

NSString *const SaveTeamNoticeURL = @"user/app/home/teamNotice/saveTeamNotice";

NSString *const DeleteTeamNoticeURL = @"user/app/home/teamNotice/deleteTeamNotice";

NSString *const SelectUserTeamLvlListURL = @"user/app/home/userTeamLvl/selectUserTeamLvlList";

NSString *const UpdateUserTeamCustomURL = @"user/app/home/team/updateUserTeamCustom";

NSString *const InsertUserTeamRelationURL = @"user/app/home/team/insertUserTeamRelation";

NSString *const SelectAPPSharerTypeListURL = @"user/app/home/sharer/selectAPPSharerTypeList";

NSString *const DeleteUserCollectURL = @"user/app/home/userCollect/deleteUserCollect";

NSString *const SaveUserCollectURL = @"user/app/home/userCollect/saveUserCollect";

NSString *const SelectListPageURL = @"user/app/home/userCollect/selectListPage";

NSString *const AllAppParameterURL = @"user/open/parameter/selectParams";

NSString *const AppParameterURL = @"user/app/open/parameter/selectParameter";

NSString *const SelectAppUseTabSettingListURL = @"user/app/open/appSetting/selectAppUseTabSettingList";

NSString *const SelectAppStoreSettingJsonDataURL = @"user/app/open/appSetting/selectAppStoreSettingJsonData";

NSString *const GetQiNiuTokenURL = @"user/open/qiniu/getQiNiuToken";

NSString *const SelectHelpListURL = @"user/app/open/help/selectHelpList";

NSString *const UpdateInfoURL = @"user/app/home/user/update";

NSString *const UpdateUserInvitationURL = @"user/app/home/user/updateUserInvitation";

NSString *const SelectUserByInvitationURL = @"user/app/open/user/selectUserToInvitation";

NSString *const AppSelectUserURL = @"user/app/home/user/appSelectUser";

NSString *const AppUpdateWeixinURL = @"user/app/home/user/appUpdateWeixin";

NSString *const SetPayPasswordURL = @"user/app/home/user/setPayPassword";

NSString *const UpdatePayPasswordURL = @"user/app/home/user/updatePayPassword";

NSString *const SelectYyWaiterListURL = @"user/app/home/waiter/selectWaiterList";

NSString *const SelectWaiterURL = @"user/app/home/waiter/selectWaiter";

NSString *const SelectWaiterRobotByOneURL = @"user/app/open/waiterRobot/selectWaiterRobotByOne";

NSString *const SelectWaiterByRobotURL = @"user/app/open/waiterRobot/selectWaiterByRobot";

NSString *const selectAPPWaiterRobotListURL = @"user/app/open/waiterRobot/selectAPPWaiterRobotList";

NSString *const SelectHotWaiterRobotURL = @"user/app/open/waiterRobot/selectHotWaiterRobot";

NSString *const SelectLaborWaiterURL = @"user/app/open/waiterRobot/selectLaborWaiter";

NSString *const SelectEntityByPublishTimeURL = @"user/app/home/notice/selectEntityByPublishTime";

NSString *const SelectNewsByPublishTimeURL = @"user/app/home/notice/selectNewsByPublishTime";

NSString *const AppSelectNoticeListPageURL = @"user/app/home/notice/appSelectNoticeListPage";

NSString *const saveBatchNoticeReadURL = @"user/app/home/notice/saveBatchNoticeRead";

NSString *const saveNoticeReadURL = @"user/app/home/notice/saveNoticeRead";

NSString *const SelectUserNoticeSettingURL = @"user/app/home/notice/selectUserNoticeSetting";

NSString *const InserUserDeviceTokenURL = @"user/app/home/user/inserUserDeviceToken";

NSString *const editUserNoticeSettingURL = @"user/app/home/notice/editUserNoticeSetting";

NSString *const SelectListURL = @"user/app/open/sensitivity/selectList";

NSString *const appUpdateURL = @"user/app/open/version/selectNewest";

NSString *const SelectAppSettingURL = @"user/app/open/appSetting/selectAppSetting";

NSString *const SelectAdvertisingURL = @"user/app/home/adver/selectAdvertising";

NSString *const DeleteUserExpressAddressURL = @"user/app/home/expressAddress/deleteUserExpressAddress";

NSString *const SaveUserExpressAddressURL = @"user/app/home/expressAddress/saveUserExpressAddress";

NSString *const SelectExpressAddressListURL = @"user/app/home/expressAddress/selectExpressAddressList";

NSString *const UpdateDefaultStatusURL = @"user/app/home/expressAddress/updateDefaultStatus";

NSString *const UpdateUserExpressAddressURL = @"user/app/home/expressAddress/updateUserExpressAddress";

NSString *const BindingAlipayURL = @"user/app/home/user/bindingAlipay";

NSString *const qqBindingURL = @"user/app/home/user/qqBinding";

NSString *const WeixinBindingURL = @"user/app/home/user/weixinBinding";

NSString *const TaoBaoBindingURL = @"user/app/home/user/taoBaoBinding";

NSString *const BindingMobileURL = @"user/app/home/user/bindingMobile";

NSString *const relieveBindingURL = @"user/app/home/user/relieveBinding";

NSString *const CloseAnAccountURL = @"user/app/home/user/closeAnAccount";

NSString *const SelectUserSubCommissionStaticURL = @"user/app/home/user/selectUserSubCommissionStatic";

NSString *const selectLastMoneyUserSubCommissionStaticURL = @"user/app/home/user/selectLastMoneyUserSubCommissionStatic";

NSString *const SelectFansURL = @"user/app/home/user/selectFans";

NSString *const SelectFansListURL = @"user/app/home/user/selectFansList";

NSString *const SelectInviteShareSettingURL = @"user/app/open/inviteShare/selectInviteShareSetting";

NSString *const SelectUserLvlListURL = @"user/app/home/userLvl/selectOpenUserLvlList";

NSString *const UpdateUserLvlURL = @"user/app/home/user/updateUserLvl";

NSString *const selectAllianceSettingListURL = @"user/app/open/alliance/selectAllianceSettingList";

NSString *const SuperTurnTheChainURL = @"user/app/home/user/superTurnTheChain";

NSString *const SelectShopConvertURL = @"user/app/home/goods/selectShopConvertUrl";

NSString *const SelectUserComissionStaticURL = @"user/app/home/user/selectUserComissionStatic";

NSString *const SelectUserCenterSubComissionStaticURL = @"user/app/home/user/selectUserCenterSubComissionStatic";

NSString *const PersonalSlideshowListURL = @"user/app/open/center/selectSlideshowList";

NSString *const VerifyPayPad = @"user/app/home/user/verifyPayPad";

NSString *const SelectTeamExplainURL = @"user/app/open/config/selectTeamExplain";

NSString *const SelectUserInviteLvlURL = @"user/app/home/config/selectUserInviteLvl";

NSString *const SelectRollBroadcastURL = @"user/app/open/config/selectRollBroadcast";

NSString *const SelectTutorURL = @"user/app/home/userLvl/selectTutor";

NSString *const SelectAppListURL = @"user/app/open/pop/selectAppList";

NSString *const AddPopTimesURL = @"user/app/home/pop/addPopTimes";

NSString *const SelectExtractCashMessageListURL = @"user/app/open/cash/selectExtractCashMessageList";

NSString *const queryActivityListURL = @"user/app/home/active/selectListBySite";

NSString *const queryApplyActivityListURL = @"user/app/home/activeApply/selectListPage";

NSString *const SelectCountURL = @"user/app/home/activeApply/selectCount";

NSString *const SaveActiveApplyURL = @"user/app/home/activeApply/saveActiveApply";

NSString *const CheckSendRedPackURL = @"user/app/home/redPack/checkSendRedPack";

NSString *const SendRedPackURL = @"user/app/home/redPack/insertRedPack";

NSString *const RevokeRedPackURL = @"user/app/home/redPack/recallRedPack";

NSString *const ReveiceRedPackURL = @"user/app/home/redPack/insertRedPackRecord";

NSString *const RedPackDetailURL = @"user/app/home/redPack/selectRedPackById";

NSString *const SingleRedPackRecordURL = @"user/app/home/redPack/selectRedPackRecordList";

NSString *const SelectRedPackListURL = @"user/app/home/redPack/selectRedPackList";

NSString *const ReceiveRedPackRecordListURL = @"user/app/home/redPack/selectUserReceiveRedPackRecord";

NSString *const RedPackSendRedPackTotalURL = @"user/app/home/redPack/selectSendRedPackTotal";

NSString *const RedPackReceiveRedPackTotalURL = @"user/app/home/redPack/selectUserReceiveRedPackRecordTotal";

NSString *const SelectAppStoreSettingURL = @"user/app/open/appSetting/selectAppStoreSetting";

NSString *const SelectAppPageSettingByIdURL = @"user/app/open/appSetting/selectAppPageSettingById";

NSString *const SelectAPPHomeKongKimListURL = @"user/app/open/kongKim/selectAPPHomeKongKimList";

NSString *const SelectIndexNavigationEnableListURL = @"user/app/open/recommend/selectIndexNavigationEnableList";

NSString *const SelectRecommendListURL = @"user/app/open/recommend/selectRecommendList";

NSString *const GetBrandInfoListURL = @"user/app/open/goods/getBrandInfoList";

NSString *const GetBrandListURL = @"user/app/open/goods/getBrandList";

NSString *const GetBrandGoodsListURL = @"user/app/open/goods/getBrandGoodsList";

NSString *const SelectDtkListSuperGoodsURL = @"user/app/open/goods/selectDtkListSuperGoods";

NSString *const SelectCutPriceComparisonURL = @"user/app/open/goods/selectCutPriceComparison";

NSString *const SelectDtkActivityLinkURL = @"user/app/home/goods/selectDtkActivityLink";

NSString *const SelectTBActivityInfoTwoURL = @"user/app/home/goods/selectTBActivityInfoTwo";

NSString *const SelectDtkShopConvertCodeURL = @"user/app/home/goods/selectDtkShopConvertCode";

NSString *const GetJxdjbyGoodsListURL = @"user/app/open/goods/getJxdjbyGoodsList";

NSString *const GetGyGoodsURL = @"user/app/open/goods/getGyGoods";

NSString *const GetHistoryLowPriceURL= @"user/app/open/goods/getHistoryLowPrice";

NSString *const SelectTmjxGoodsDataURL = @"user/app/open/goods/selectTmjxGoodsData";

NSString *const SelectTmcsGoodsDataURL = @"user/app/open/goods/selectTmcsGoodsData";

NSString *const SelectJhsGoodsDataURL = @"user/app/open/goods/selectJhsGoodsData";

NSString *const SelectTqgGoodsDataURL = @"user/app/open/goods/selectTqgGoodsData";

NSString *const GetPybyGoodsListURL = @"user/app/open/goods/getPybyGoodsList";

NSString *const GetJrzdmGoodsListURL = @"user/app/open/goods/getJrzdmGoodsList";

NSString *const SelectExclusiveGoodsListURL = @"user/app/open/goods/selectExclusiveGoodsList";

NSString *const GetHdkGoodsListURL = @"user/app/open/goods/getHdkGoodsList";

NSString *const SelectDtkGoodsListPageURL = @"user/app/open/goods/selectDtkGoodsListPage";

NSString *const SelectHDKItemListURL = @"user/app/open/goods/selectHDKItemList";

NSString *const GetDtkRankingListURL = @"user/app/open/goods/getDtkRankingList";

NSString *const GetDtkZszGoodsListURL = @"user/app/open/goods/getDtkZszGoodsList";

NSString *const SelectHalfPriceDayURL = @"user/app/open/goods/selectHalfPriceDay";

NSString *const GetDtkBptjGoodsListURL = @"user/app/open/goods/getDtkBptjGoodsList";

NSString *const SelectHDKCurrentCommissionURL = @"user/app/open/goods/selectHDKCurrentCommission";

NSString *const GetDtkCnxhGoodsListURL = @"user/app/open/goods/getDtkCnxhGoodsList";

NSString *const GetTBOptimusMaterialURL = @"user/app/open/goods/selectTBOptimusMaterial";

NSString *const GetDtkXsqgGoodsListURL = @"user/app/open/goods/getDtkXsqgGoodsList";

NSString *const AppSelectTaoBaoClassifyListURL = @"user/app/open/goods/selectDtkCategoryDerailAppList";

NSString *const SelectDtkGoodsDetailURL = @"user/app/open/goods/selectDtkGoodsDetails";

NSString *const SelectHDKGoodsDetailURL = @"user/app/open/goods/selectHDKGoodsDetail";

NSString *const SelectSearchURL = @"user/app/open/goods/selectSearchUrl";

NSString *const SelectDtkPrivilegeLinkURL = @"user/app/home/goods/selectDtkPrivilegeLink";

NSString *const GetHdkOutUrlURL = @"user/app/home/goods/getHdkOutUrl";

NSString *const VipGoodsListURL = @"user/app/open/vop/vipGoodsList";

NSString *const QueryWithOauthURL = @"user/app/open/vop/queryWithOauth";

NSString *const SelectByGoodsIdsWithOauthURL = @"user/app/open/vop/selectByGoodsIdsWithOauth";

NSString *const AppSelectWphClassifyListURL = @"user/app/open/vop/appSelectWphClassifyList";

NSString *const SelectGenByGoodsIdWithOauthURL = @"user/app/home/vop/selectGenByGoodsIdWithOauth";

NSString *const SelectByVIPUrlURL = @"user/app/home/vop/selectByVIPUrl";

NSString *const SelectJdGoodsListPageURL = @"user/app/open/goods/selectJdGoodsListPage";

NSString *const AppSelectJDClassifyListURL = @"user/app/open/goods/selectJdCategoryDerailAppList";

NSString *const SelectJdGoodsInfoURL = @"user/app/open/goods/selectJdGoodsInfo";

NSString *const SelectJdOutUrlURL = @"user/app/home/goods/selectJdOutUrl";

NSString *const SelectJdShopLinkURL = @"user/app/home/goods/selectJdShopLink";

NSString *const SelectJdPromcommonUrlURL = @"user/app/home/goods/selectJdPromcommonUrl";

NSString *const SelectPddGoodsListPageURL = @"user/app/open/goods/selectPddGoodsListPage";

NSString *const GetChannelURL = @"user/app/home/goods/getChannel";

NSString *const GetChannelTwoURL = @"user/app/home/goods/getChannelTwo";

NSString *const GetRankListURL = @"user/app/open/goods/getRankList";

NSString *const GetFreeOrderURL = @"user/app/home/goods/getFreeOrder";

NSString *const GetDayRedPackURL = @"user/app/home/goods/getDayRedPack";

NSString *const AppSelectPddClassifyListURL = @"user/app/open/goods/selectPddCategoryDerailAppList";

NSString *const SelectPddGoodsDetailURL = @"user/app/open/goods/selectPddGoodsDetail";

NSString *const SelectAddPddGoodsDetailURL = @"user/app/open/locality/selectPddGoodsDetail";

NSString *const SelectPddOutUrlURL = @"user/app/home/goods/selectPddOutUrl";

NSString *const SelectPddResourceUrlGenURL = @"user/app/home/goods/selectPddResourceUrlGen";

NSString *const InverstmentCommodityQueryURL = @"user/app/open/suning/inverstmentCommodityQuery";

NSString *const SelectRecommendCommodityQueryURL = @"user/app/open/suning/selectRecommendCommodityQuery";

NSString *const AppSelectSnClassifyListURL = @"user/app/open/suning/appSelectSnClassifyList";

NSString *const CommoditydetailQueryURL = @"user/app/open/suning/commoditydetailQuery";

NSString *const SearchCommodityQueryURL = @"user/app/open/suning/searchCommodityQuery";

NSString *const StorepromotionurlQueryURL = @"user/app/home/suning/storepromotionurlQuery";

NSString *const BacthCustomLinkQueryURL = @"user/app/home/suning/bacthCustomLinkQuery";

NSString *const AppSelectNavigationListURL = @"user/app/open/slid/appSelectNavigationList";

NSString *const SelectSlideshowListURL = @"user/app/open/slid/selectSlideshowList";

NSString *const SelectTwoPageBasicsSettingURL = @"user/app/open/slid/selectTwoPageBasicsSetting";

NSString *const SelectDtkSearchSuggestionURL = @"user/app/open/goods/selectDtkSearchSuggestion";

NSString *const DeleteSearchWordURL = @"user/app/home/search/deleteSearchWord";

NSString *const SelectHistorySearchWordListURL = @"user/app/home/search/selectHistorySearchWordList";

NSString *const SelectDtkTopURL = @"user/app/open/goods/selectDtkTop";

NSString *const CheckTbAuthorizeURL = @"user/app/home/goods/checkTbAuthorize";

NSString *const SelectVeAuthorizeUrlURL = @"user/app/home/selectVeAuthorizeUrl";

NSString *const SelectDTKPriceTrendURL = @"user/app/open/goods/selectDTKPriceTrend";

NSString *const SelectDTKHistoryPriceRecordsURL = @"user/app/open/goods/selectDTKHistoryPriceRecords";

NSString *const SelectTaoBaoAuthorizeUrlURL = @"user/app/open/selectTaoBaoAuthorizeUrl";

NSString *const SelectMeiTuanSpreadURL = @"user/app/home/dm/selectMeiTuanSpread";

NSString *const GenerateLinkURL = @"user/app/home/mt/generateLink";

NSString *const SelectMeiTuanVegetablesURL = @"user/app/home/mt/selectMeiTuanVegetables";

NSString *const SelectMeiTuanOptimizationURL = @"user/app/home/mt/selectMeiTuanOptimization";

NSString *const SelectTBActivityInfoURL = @"user/app/home/goods/selectTBActivityInfo";

NSString *const SelectHWBrandURL = @"user/app/home/hw/selectHWBrand";

NSString *const SelectAppRegulationURL = @"user/app/open/protocol/selectAppRegulation";

NSString *const SelectLocalityGoodsListURL = @"user/app/open/theme/selectLocalityGoodsList";

NSString *const SelectThemeActivityALLURL = @"user/app/open/theme/selectThemeActivityALL";

NSString *const SelectThemeActivityURL = @"user/app/open/theme/selectThemeActivity";

NSString *const AppSelectGoodsPlateURL = @"user/app/open/plate/appSelectGoodsPlate";

NSString *const SelectGoodsPlateURL = @"user/app/open/plate/selectGoodsPlate";

NSString *const SelectGoodsOrderAppPageURL = @"user/app/home/order/selectGoodsOrderAppPage";

NSString *const SelectOtherGoodsOrderAppPageURL = @"user/app/home/order/selectOtherGoodsOrderAppPage";

NSString *const SelectNoUserGoodsOrderPageURL = @"user/app/home/order/selectNoUserGoodsOrderPage";

NSString *const BindGoodsOrderAppURL = @"user/app/home/order/bindGoodsOrderApp";

NSString *const SelectOrderExplainAllURL = @"user/app/home/explain/selectOrderExplainAll";

NSString *const InsertGoodsCollectNewURL = @"user/app/home/goodsCollect/insertGoodsCollectNew";

NSString *const DeleteGoodsCollectURL = @"user/app/home/goodsCollect/deleteGoodsCollect";

NSString *const SelectGoodsCollectListURL = @"user/app/home/goodsCollect/selectGoodsCollectList";

NSString *const SelectWhetherCollectURL = @"user/app/home/goodsCollect/selectWhetherCollect";

NSString *const SelectExtractCashRuleURL = @"user/app/home/cash/appSelectExtractCashRule";

NSString *const InsertExtractCashURL = @"user/app/home/cash/insertExtractCash";

NSString *const AppSelectExtractCashListURL = @"user/app/home/cash/appSelectExtractCashList";

NSString *const SelectUserAppAccountRecordPageURL = @"user/app/home/change/selectUserAppAccountRecordPage";

NSString *const SelectUserDebtsAccountRecordSumURL = @"user/app/home/change/selectUserDebtsAccountRecordSum";

NSString *const SelectUserAccountDebtsRecordPageURL = @"user/app/home/change/selectUserAccountDebtsRecordPage";


NSString *const WxPayAccountURL = @"user/app/home/user/wxPayAccount";

NSString *const RelieveWxPayAccountURL = @"user/app/home/user/relieveWxPayAccount";

NSString *const AddPddGenerateRecordsURL = @"user/app/home/authority/addPddGenerateRecords";

NSString *const AelectPddOauthMemberAuthorityURL = @"user/app/home/authority/selectPddOauthMemberAuthority";

NSString *const SelectPasteBoardURL = @"user/app/open/config/selectPasteBoard";

NSString *const InsertUserLivelyURL = @"user/app/home/user/insertUserLively";

NSString *const GetOrderRedPackURL = @"user/app/home/orderTask/getOrderRedPack";

NSString *const GetOrderRedPackTimesURL = @"user/app/home/orderTask/getOrderRedPackTimes";

NSString *const SelectAppOrderRedPackListURL = @"user/app/home/orderTask/selectAppOrderRedPackListPage";

NSString *const SelectTimesTypeURL = @"user/app/home/orderTask/selectTimesType";

NSString *const SelectAppOrderRedPackTimesRecordPageURL = @"user/app/home/orderTask/selectAppOrderRedPackTimesRecordPage";

NSString *const SelectOrderRedPackTimesURL = @"user/app/home/orderTask/selectOrderRedPackTimes";

NSString *const SelectOrderRedPackTimesHisPageURL = @"user/app/home/orderTask/selectOrderRedPackTimesHisPage";

NSString *const SelectOrderTaskOpenURL = @"user/app/home/orderTask/selectOrderTaskOpen";

NSString *const SelectUserOrderRedPackTimesURL = @"user/app/home/orderTask/selectUserOrderRedPackTimes";

NSString *const SelectOrderRedPackRecordListURL = @"user/app/home/orderTask/selectOrderRedPackRecordList";

NSString *const CancelTeamRedPackURL = @"user/app/home/redPack/cancelTeamRedPack";

NSString *const InsertTeamRedPackURL = @"user/app/home/redPack/insertTeamRedPack";

NSString *const SelectTimeRedPackURL = @"user/app/home/redPack/selectTimeRedPack";

NSString *const SelectTimeRedPackPageURL = @"user/app/home/redPack/selectTimeRedPackPage";

NSString *const SelectUserRedPackRecordByIdURL = @"user/app/home/redPack/selectUserRedPackRecordById";

NSString *const InsertTimeRedPackRecordURL = @"user/app/home/redPack/insertTimeRedPackRecord";

NSString *const UpdateUserTeamAcitveURL = @"user/app/home/active/updateUserTeamAcitve";

NSString *const SelectAppTeamAcitveURL = @"user/app/home/change/selectAppTeamAcitve";

NSString *const updateTeamAcitveStatusURL = @"user/app/home/active/updateTeamAcitveStatus";

NSString *const SelectTaskList = @"user/app/home/task/selectTaskList";

NSString *const SelectUserActiveByUserIdUrl = @"user/app/home/task/selectUserActiveByUserId";

NSString *const UpdateTaskJoinTimes = @"user/app/home/task/updateTaskJoinTimes";

NSString *const UpdateTaskJoin = @"user/app/home/task/updateTaskJoin";

NSString *const SelectAppGold = @"user/app/home/change/selectAppGold";

NSString *const UpdateGoldAccount = @"user/app/home/change/updateGoldAccount";

NSString *const SelectAppUserGoldRecordPage = @"user/app/home/change/selectAppUserGoldRecordPage";

NSString *const SelectLachineTaskRankOpen = @"user/app/home/lachineTask/selectLachineTaskRankOpen";

NSString *const SelectAppLachineTaskRankPage = @"user/app/home/lachineTask/selectAppLachineTaskRankPage";


NSString *const SelectFinishLachineTask = @"user/app/home/lachineTask/selectFinishLachineTask";


NSString *const SelectFinishLachineTaskListPage = @"user/app/home/lachineTask/selectFinishLachineTaskListPage";

NSString *const SelectAppInviteRecordNum = @"user/app/home/lachineTask/selectAppInviteRecordNum";

NSString *const SelectAppInviteRecordPage = @"user/app/home/lachineTask/selectAppInviteRecordPage";

NSString *const SelectAppRewardRecordSumURL = @"user/app/home/lachineTask/selectAppRewardRecordSum";

NSString *const SelectAppRewardRecordPage = @"user/app/home/lachineTask/selectAppRewardRecordPage";

NSString *const SelectRankingList = @"user/app/home/lachineTask/selectRankingList";

NSString *const SelectUserCouponTaskStatusPageUrl = @"user/app/home/couponTask/selectUserCouponTaskStatusPage";

NSString *const SelectCouponTaskStatusPage = @"user/app/home/couponTask/selectCouponTaskStatusPage";

NSString *const CancelCouponTaskUrl = @"user/app/home/couponTask/cancelCouponTask";

NSString *const InsertCouponTaskUrl = @"user/app/home/couponTask/insertCouponTask";

NSString *const InsertCouponTaskUserUrl = @"user/app/home/couponTask/insertCouponTaskUser";

NSString *const SelectCouponTaskDetailUrl = @"user/app/home/couponTask/selectCouponTaskDetail";

NSString *const SelectCouponUserDetaillUrl = @"user/app/home/couponTask/selectCouponUserDetail";

NSString *const SelectDraftCouponTaskUrl = @"user/app/home/couponTask/selectDraftCouponTask";

NSString *const DeleteCouponTaskUrl = @"user/app/home/couponTask/deleteCouponTask";

NSString *const UpdateCouponTaskDraftUrl = @"user/app/home/couponTask/updateCouponTaskDraft";

NSString *const UpdateCouponTaskDraftAndPayUrl = @"user/app/home/couponTask/updateCouponTaskDraftAndPay";

NSString *const UpdateCouponTaskNoBeginUrl = @"user/app/home/couponTask/updateCouponTaskNoBegin";

NSString *const AppSelectActionTutorialUrl = @"user/app/home/couponTask/appSelectActionTutorial";

NSString *const AppSelectActionRulesUrl = @"user/app/home/couponTask/appSelectActionRules";

NSString *const InsertCouponTaskAndPayUrl = @"user/app/home/couponTask/insertCouponTaskAndPay";

NSString *const UpdateCouponTaskOverUrl = @"user/app/home/couponTask/updateCouponTaskOver";

NSString *const UpdateCouponTaskBeginUrl = @"user/app/home/couponTask/updateCouponTaskBegin";

NSString *const SelectNoUseCouponUserPageUrl = @"user/app/home/couponTask/selectNoUseCouponUserPage";

NSString *const SelectUseCouponUserPageUrl = @"user/app/home/couponTask/selectUseCouponUserPage";

NSString *const SelectOverCouponUserPageUrl = @"user/app/home/couponTask/selectOverCouponUserPage";

NSString *const SelectCouponUserSortListUrl = @"user/app/home/couponTask/selectCouponUserSortList";

NSString *const InsertCouponUserSortUrl = @"user/app/home/couponTask/insertCouponUserSort";

NSString *const DeleteCouponUserSortByIdUrl = @"user/app/home/couponTask/deleteCouponUserSortById";

NSString *const SelectAPPCouponUserPageUrl = @"user/app/home/couponTask/selectAPPCouponUserPage";

NSString *const UpdateTeamActivityShowUrl = @"user/app/home/team/updateTeamActivityShow";

NSString *const SelectUserGroupTaskStatusPageUrl = @"user/app/home/groupTask/selectUserGroupTaskStatusPage";

NSString *const SelectGroupTaskStatusPageUrl = @"user/app/home/groupTask/selectGroupTaskStatusPage";

NSString *const InsertGroupTaskUrl = @"user/app/home/groupTask/insertGroupTask";

NSString *const SelectDraftGroupTaskUrl = @"user/app/home/groupTask/selectDraftGroupTask";

NSString *const DeleteGroupTaskUrl = @"user/app/home/groupTask/deleteGroupTask";

NSString *const UpdateGroupTaskDraftUrl = @"user/app/home/groupTask/updateGroupTaskDraft";

NSString *const UpdateGroupTaskDraftAndPayUrl = @"user/app/home/groupTask/updateGroupTaskDraftAndPay";

NSString *const InsertGroupTaskAndPayUrl = @"user/app/home/groupTask/insertGroupTaskAndPay";

NSString *const AppSelectPinTuanTutorialUrl = @"user/app/home/groupTask/appSelectActionTutorial";

NSString *const AppSelectPinTuanActionRulesUrl = @"user/app/home/groupTask/appSelectActionRules";

NSString *const UpdateGroupTaskBeginUrl = @"user/app/home/groupTask/updateGroupTaskBegin";

NSString *const UpdateGroupTaskNoBeginUrl = @"user/app/home/groupTask/updateGroupTaskNoBegin";

NSString *const CancelGroupTaskUrl = @"user/app/home/groupTask/cancelGroupTask";

NSString *const SelectGroupTaskDetailUrl = @"user/app/home/groupTask/selectGroupTaskDetail";

NSString *const SelectGroupTaskDtoUrl = @"user/app/home/groupTask/selectGroupTaskDto";

NSString *const SelectGroupTaskOrderDetailUrl = @"user/app/home/groupTask/selectGroupTaskOrderDetail";

NSString *const SelectGroupTaskOrderDetailOwnerUrl = @"user/app/home/groupTask/selectGroupTaskOrderDetailOwner";

NSString *const SelectGroupTaskStaticDtoUrl = @"user/app/home/groupTask/selectGroupTaskStaticDto";

NSString *const InsertGroupTaskShareRecordUrl = @"user/app/home/groupTask/insertGroupTaskShareRecord";

NSString *const InsertPunchTheClockTaskUrl = @"user/app/home/clockTask/insertPunchTheClockTask";

NSString *const SelectPunchTheClockTaskPageUrl = @"user/app/home/clockTask/selectPunchTheClockTaskPage";

NSString *const CancelPunchTheClockTaskUrl = @"user/app/home/clockTask/cancelPunchTheClockTask";

NSString *const UpdatePunchTheClockTaskUrl = @"user/app/home/clockTask/updatePunchTheClockTask";

NSString *const SelectPunchTheClockTaskDetailUrl = @"user/app/home/clockTask/selectPunchTheClockTaskDetail";

NSString *const SelectClockTaskDetailUrl = @"user/app/home/clockTask/selectClockTaskDetail";

NSString *const SelectPunchTheClockTaskApplyUrl = @"user/app/home/clockTask/selectPunchTheClockTaskApply";

NSString *const SelectStartPunchTheClockTaskUrl = @"user/app/home/clockTask/selectStartPunchTheClockTask";

NSString *const InsertPunchTheClockTaskApplyUrl = @"user/app/home/clockTask/insertPunchTheClockTaskApply";

NSString *const SelectClockTaskClockDynamicPageUrl = @"user/app/home/clockTask/selectClockTaskClockDynamicPage";

NSString *const SelectClockTaskApplyClockAllUrl = @"user/app/home/clockTask/selectClockTaskApplyClockAll";

NSString *const InsertClockDynamicUrl = @"user/app/home/clockTask/insertClockDynamic";

NSString *const DaKaActionTutorialUrl = @"user/app/home/clockTask/selectActionTutorial";


NSString *const SelectHisPartnerReportPageUrl = @"user/app/home/partnerReport/selectHisPartnerReportPage";


NSString *const SelectPartnerReportDetailListUrl = @"user/app/home/partnerReport/selectPartnerReportDetailList";

NSString *const SelectPartnerTeamDetailUrl = @"user/app/home/partnerReport/selectPartnerTeamDetail";


NSString *const SelectPartnerTeamUrl = @"user/app/home/partnerReport/selectPartnerTeam";


NSString *const SelectUserToInvitationUrl = @"user/app/open/user/selectUserToInvitation";

NSString *const AddUserLeadUrl = @"user/app/home/user/addUserLead";

NSString *const SelectAppInviteNewTask = @"user/app/home/inviteNew/selectAppInviteNewTask";

NSString *const SelectAppRecordListPageUrl = @"user/app/home/inviteNew/selectAppRecordListPage";

NSString *const SelectRankingListUrl = @"user/app/home/inviteNew/selectRankingList";

NSString *const SelectOpenUserLvlListUrl = @"user/app/open/userLvl/selectOpenUserLvlList";

NSString *const SelectPltRewardRecordPageUrl = @"user/app/home/partnerReport/selectPltRewardRecordPage";

NSString *const SelectDataByMonthForAppUrl = @"user/app/home/partnerReport/selectDataByMonthForApp";

NSString *const SelectPartnerDataReportDetailByMonthUrl = @"user/app/home/partnerReport/selectPartnerDataReportDetailByMonth";

NSString *const SelectAppTaoGiftConfigUrl = @"user/app/open/tao/selectAppTaoGiftConfig";

NSString *const SelectTaoGiftGoodsListUrl = @"user/app/open/tao/selectTaoGiftGoodsList";

NSString *const SelectUserCountDownInPastTimeUrl = @"user/app/open/tao/selectUserCountDownInPastTime";

NSString *const SelectAppTaoGiftGoodsListUrl = @"user/app/open/tao/selectAppTaoGiftGoodsList";

NSString *const RushToPurchaseUrl = @"user/app/home/tao/rushToPurchase";

NSString *const SelectAppGoodsGetRecordListPageUrl = @"user/app/home/tao/selectAppGoodsGetRecordListPage";

NSString *const InsertQueryCouponUrl = @"user/app/home/buryingPoint/insertQueryCoupon";

NSString *const UpdateQueryCouponUrl = @"user/app/home/buryingPoint/updateQueryCoupon";

NSString *const InsertBuryingPointUrl = @"user/open/buryingPoint/insertBuryingPoint";
 
NSString *const SelectAPPHomeShowPoolSharingUrl = @"user/app/open/pool/selectAPPHomeShowPoolSharing";

NSString *const SelectAppPoolSharingPageUrl = @"user/app/open/pool/selectAppPoolSharingPage";

NSString *const SelectPoolBannerListUrl = @"user/app/open/pool/selectPoolBannerList";

NSString *const SelectGoodsTypeEnableListUrl = @"user/app/open/pool/selectGoodsTypeEnableList";

NSString *const SelectPoolSharingByIdUrl = @"user/app/open/pool/selectPoolSharingById";

NSString *const SelectPoolSharingBySnUrl = @"user/app/open/pool/selectPoolSharingBySn";

NSString *const InsertUserPoolCollectUrl = @"user/app/home/pool/insertUserPoolCollect";

NSString *const SelectPoolShareSettingUrl = @"user/app/home/pool/selectPoolShareSetting";

NSString *const SelectAppPoolSharingChiosePageUrl = @"user/app/open/pool/selectAppPoolSharingChiosePage";

NSString *const SelectUserPoolOrderPageUrl = @"user/app/home/pool/selectUserPoolOrderPage";

NSString *const SelectPoolOrderByIdUrl = @"user/app/home/pool/selectPoolOrderById";

NSString *const SelectUserPoolChangeCodeUrl = @"user/app/home/pool/selectUserPoolChangeCode";

NSString *const SelectUserOwnerPoolRedChangeRecordPageUrl = @"user/app/home/pool/selectUserOwnerPoolRedChangeRecordPage";

NSString *const SelectPoolRankingListUrl = @"user/app/home/pool/selectPoolRankingList";

NSString *const SelectAppPoolShaingConfigUrl = @"user/app/home/pool/selectAppPoolShaingConfig";

NSString *const UpdatePoolAccountUrl = @"user/app/home/change/updatePoolAccount";

NSString *const SelectAppPoolSharingNewPointUrl = @"user/app/open/pool/selectAppPoolSharingNewPoint";

NSString *const InsertPoolOrderUrl = @"user/app/home/pool/insertPoolOrder";

NSString *const SelectSendDataByIdUrl = @"user/app/home/pool/selectSendDataById";

NSString *const UpdatePoolOrderUrl = @"user/app/home/pool/updatePoolOrder";

NSString *const UpdatePoolOrderEndUrl = @"user/app/home/pool/updatePoolOrderEnd";

NSString *const SelectUserPoolCollectListUrl = @"user/app/home/pool/selectUserPoolCollectList";

NSString *const DeleteUserPoolCollectUrl = @"user/app/home/pool/deleteUserPoolCollect";

NSString *const SelectPoolHelpListUrl = @"user/app/open/pool/selectPoolHelpList";

NSString *const SelectPoolOrderStatisticsUrl = @"user/app/home/pool/selectPoolOrderStatistics";

NSString *const SelectOrderWeekRewardUrl = @"user/app/home/partnerReport/selectOrderWeekReward";

NSString *const SelectOrderWeekRewardRankUrl = @"user/app/home/partnerReport/selectOrderWeekRewardRank";

NSString *const SelectOrderWeekRewardStaticUrl = @"user/app/home/partnerReport/selectOrderWeekRewardStatic";

NSString *const SelectOrderWeekRewardStaticByPltUrl = @"user/app/home/partnerReport/selectOrderWeekRewardStaticByPlt";

NSString *const SelectAppOrderWeekRewardStaticPageUrl = @"user/app/home/partnerReport/selectAppOrderWeekRewardStaticPage";

NSString *const SelectDisableOrderWeekRewardPageUrl = @"user/app/home/partnerReport/selectDisableOrderWeekRewardPage";

NSString *const SelectPltRewardUrl = @"user/app/home/partnerReport/selectPltReward";

NSString *const SelectPltRewardRankUrl = @"user/app/home/partnerReport/selectPltRewardRank";

NSString *const SelectPltRewardStaticUrl = @"user/app/home/partnerReport/selectPltRewardStatic";

NSString *const SelectPltRewardStaticByPltUrl = @"user/app/home/partnerReport/selectPltRewardStaticByPlt";

NSString *const SelectAppPltRewardStaticPageUrl = @"user/app/home/partnerReport/selectAppPltRewardStaticPage";

NSString *const SelectDisablePltPartnerFirstRewardPageUrl = @"user/app/home/partnerReport/selectDisablePltPartnerFirstRewardPage";

NSString *const SelectHorseRaceLampUrl = @"user/app/open/horse/selectHorseRaceLamp";

NSString *const SelectTaoGiftQualificationActivityByPopUrl = @"user/app/open/tao/selectTaoGiftQualificationActivityByPop";

NSString *const SelectInstructSearchListUrl = @"user/app/open/instruct/selectInstructSearchList";

NSString *const SelectLocalLifeNavigationListUrl = @"user/app/open/life/selectLocalLifeNavigationList";

NSString *const SelectLocalLifeSlideshowListUrl = @"user/app/open/life/selectLocalLifeSlideshowList";

NSString *const SelectMeiTuanSkuQueryUrl = @"user/app/open/mt/selectMeiTuanSkuQuery";

NSString *const SelectSeckillListUrl = @"user/app/open/mt/selectSeckillList";

NSString *const SelectSeckillShowinfoUrl = @"user/app/open/mt/selectSeckillShowinfo";

NSString *const SelectLocalLifeCapsuleListUrl = @"user/app/open/life/selectLocalLifeCapsuleList";

NSString *const SelectSearchDealsUrl = @"user/app/open/mt/selectSearchDeals";

NSString *const selectTBKMaterialOptionalUrl = @"user/app/open/goods/selectTBKMaterialOptional";

NSString *const SelectSubsidyGoodsClassifyListUrl = @"user/app/open/subsidy/selectSubsidyGoodsClassifyList";

NSString *const SelectAPPSubsidyGoodsListPageUrl = @"user/app/open/subsidy/selectAPPSubsidyGoodsListPage";

NSString *const SelectAPPSubsidyActivityUrl = @"user/app/home/subsidy/selectAPPSubsidyActivity";

NSString *const InsertSubsidyActivityRedPackUrl = @"user/app/home/subsidy/insertSubsidyActivityRedPack";

NSString *const GetSubsidyUrlUrl = @"user/app/home/subsidy/getSubsidyUrl";

NSString *const SelectAPPSubsidyActivityGetRecordListPageUrl= @"user/app/home/subsidy/selectAPPSubsidyActivityGetRecordListPage";

NSString *const SelectAPPSubsidyGoodsListUrl = @"user/app/open/subsidy/selectAPPSubsidyGoodsList";

NSString *const SelectAPPShowSubsidyGoodsListUrl = @"user/app/open/subsidy/selectAPPShowSubsidyGoodsList";

NSString *const SelectKFCActUrl = @"user/app/home/jtk/selectKFCAct";

NSString *const SelectCinemaActUrl = @"user/app/home/jtk/selectCinemaAct";

NSString *const SelectGDActUrl = @"user/app/open/jtk/selectGDAct";

NSString *const SelectElectricityActUrl = @"user/app/home/jtk/selectElectricityAct";

NSString *const SelectMcdanaldActUrl = @"user/app/home/jtk/selectMcdanaldAct";

NSString *const SelectRechargeMobileUrl = @"user/app/home/jtk/selectRechargeMobile";

NSString *const SelectDiDiActUrl = @"user/app/home/jtk/selectDiDiAct";

NSString *const UpdateSubsidyActivityRedPackPopUrl = @"user/app/home/subsidy/updateSubsidyActivityRedPackPop";

NSString *const SelectGoldShaingConfigUrl = @"user/app/open/goldMarket/selectGoldShaingConfig";

NSString *const SelectAppGoldSharingPageUrl = @"user/app/open/goldMarket/selectAppGoldSharingPage";

NSString *const SelectAppGoldSharingCashShowUrl = @"user/app/open/goldMarket/selectAppGoldSharingCashShow";

NSString *const InsertGoldIssueUserUrl = @"user/app/home/goldMarket/insertGoldIssueUser";

NSString *const SelectGoldSharingByIdUrl = @"user/app/home/goldMarket/selectGoldSharingById";

NSString *const SelectGoldSharingDetailByIdAndIssueUrl = @"user/app/home/goldMarket/selectGoldSharingDetailByIdAndIssue";

NSString *const SelectGoldIssueResultPageUrl = @"user/app/open/goldMarket/selectGoldIssueResultPage";

NSString *const SelectGoldIssueUserSharePageUrl = @"user/app/home/goldMarket/selectGoldIssueUserSharePage";

NSString *const SelectUserGoldIssueUserSharePageUrl = @"user/app/home/goldMarket/selectUserGoldIssueUserSharePage";

NSString *const InsertGoldIssueUserShareUrl = @"user/app/home/goldMarket/insertGoldIssueUserShare";

NSString *const SelectAppGoldIssueUserPageUrl= @"user/app/home/goldMarket/selectAppGoldIssueUserPage";

NSString *const SelectGoldIssueUserSendDataUrl = @"user/app/home/goldMarket/selectGoldIssueUserSendData";

NSString *const UpdateGoldIssueUserSendDataUrl= @"user/app/home/goldMarket/updateGoldIssueUserSendData";

NSString *const SelectGoldIssueUserSendDataByIdUrl= @"user/app/home/goldMarket/selectGoldIssueUserSendDataById";

NSString *const UpdateAccountChangeGoldUrl = @"user/app/home/change/updateAccountChangeGold";

NSString *const SelectCouponsSlideshowListUrl = @"user/app/home/coupon/selectAPPSlideshowList";

NSString *const SelectSalingCouponSaleRecordPageUrl = @"user/app/home/couponTask/selectSalingCouponSaleRecordPage";

NSString *const SelectUseScopeTypeStaticUrl = @"user/app/home/couponTask/selectUseScopeTypeStatic";

NSString *const SelectCouponSaleRecordDetailByIdUrl = @"user/app/home/couponTask/selectCouponSaleRecordDetailById";

NSString *const SelectAPPCouponDealControlUrl = @"user/app/home/coupon/selectAPPCouponDealControl";

NSString *const InsertCouponSaleRecordUrl = @"user/app/home/couponTask/insertCouponSaleRecord";

NSString *const SelectUserSalingCouponSaleRecordPageUrl = @"user/app/home/couponTask/selectUserSalingCouponSaleRecordPage";

NSString *const selectUserSaleSucCouponSaleRecordListUrl = @"user/app/home/couponTask/selectUserSaleSucCouponSaleRecordList";

NSString *const selectUserSaleSucCouponSaleRecordStaticUrl = @"user/app/home/couponTask/selectUserSaleSucCouponSaleRecordStatic";

NSString *const selectUserBuySucCouponSaleRecordListUrl = @"user/app/home/couponTask/selectUserBuySucCouponSaleRecordList";

NSString *const selectUserBuySucCouponSaleRecordStaticUrl = @"user/app/home/couponTask/selectUserBuySucCouponSaleRecordStatic";

NSString *const selectUserErrorCouponSaleRecordListUrl = @"user/app/home/couponTask/selectUserErrorCouponSaleRecordList";

NSString *const selectUserFailCouponSaleRecordListUrl = @"user/app/home/couponTask/selectUserFailCouponSaleRecordList";

NSString *const updateUserCouponSaleRecordDownUrl = @"user/app/home/couponTask/updateUserCouponSaleRecordDown";

NSString *const updateCouponSaleRecordMoneyUrl = @"user/app/home/couponTask/updateCouponSaleRecordMoney";

NSString *const updateUserCouponSaleRecordUrl = @"user/app/home/couponTask/updateUserCouponSaleRecord";

NSString *const InsertCouponBuyOrderUrl = @"user/app/home/couponTask/insertCouponBuyOrder";

NSString *const SelectCouponBuyOrderByPayIdUrl = @"user/app/home/couponTask/selectCouponBuyOrderByPayId";

NSString *const SelectCouponBroadcastListUrl = @"user/app/open/couponTask/selectCouponBroadcastList";

NSString *const GetChannelThreeURL = @"user/app/home/goods/getChannelThree";

NSString *const SelectCanUseCouponUserURL = @"user/app/home/couponTask/selectCanUseCouponUser";

NSString *const SelectPlatformListURL = @"user/app/open/couponTask/selectPlatformList";

NSString *const SelectPltTypeSlideshowListURL = @"user/app/open/center/selectPltTypeSlideshowList";

NSString *const SelectNewExtractSlideshowListURL = @"user/app/home/center/selectNewExtractSlideshowList";

NSString *const SelectHFiveAppSettingURL = @"user/app/open/appSetting/selectHFiveAppSetting";

NSString *const SelectAPPElmHFivePageURL = @"user/app/open/elm/selectAPPElmHFivePage";

NSString *const DisposeDataURL = @"user/app/home/thr/disposeData";

NSString *const PayThrH5OrderURL = @"user/app/home/thr/payThrH5Order";

NSString *const SelectDouYinSelfLiveMaterialURL = @"user/app/open/dm/selectDouYinSelfLiveMaterial";

NSString *const SelectDouYinLinkURL = @"user/app/home/dm/selectDouYinLink";

@end

