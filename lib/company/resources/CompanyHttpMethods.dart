import 'dart:ffi';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/barcode_model.dart';
import 'package:base_flutter/company/models/brochure_details_model.dart';
import 'package:base_flutter/company/models/business_ads_details_model.dart';
import 'package:base_flutter/company/models/comp_fav_details_model.dart';
import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_filter_reconciliation_model.dart';
import 'package:base_flutter/company/models/comp_interest_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/company/models/comp_statistics_details_model.dart';
import 'package:base_flutter/company/models/comp_wallet_model.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/company/models/cost_subscribe_model.dart';
import 'package:base_flutter/company/models/dots/AddBrochureSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddOpinionSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddSpecialSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/SendBrochureModel.dart';
import 'package:base_flutter/company/models/dots/UpdateCompanyProfile.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';

import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/models/extra_cost_model.dart';
import 'package:base_flutter/company/models/packages_model.dart';
import 'package:base_flutter/company/models/product_ads_details_model.dart';
import 'package:base_flutter/company/models/specific_ads_details_model.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/conversation_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
import 'package:base_flutter/customer/models/wallet_details_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/models/intro_model.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:base_flutter/general/resources/GeneralRepository.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CompanyHttpMethods(this.context);

  Future<bool> compRegister(CompRegisterModel model) async {
    var _data = await DioHelper(context: context).post(
        url: "/Account/RegisterKayanApi",
        body: model.toJson(),
        showLoader: false);
    if (_data != null) {
      print("____________________${_data["data"]["code"]}");
      AutoRouter.of(context).popAndPush(CompActiveAccountRoute(
          userId: _data["data"]["kayandata"]["user_id"]));
      return true;
    } else {
      return false;
    }
  }

  Future<List<CitiesModel>> getCompCities(int countryId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "countryId": countryId,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/GetAllCities", body: body);
    if (_data != null) {
      return List<CitiesModel>.from(
          _data['cities'].map((e) => CitiesModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> checkCommercial(String commercial, String userId) async {
    Map<String, dynamic> body = {
      "match_id": commercial,
    };
    var _data = await DioHelper(context: context).externalPost(
        url: "/Payment/CheckSgltogary", body: body, showLoader: false);
    completeRegister(commercial, userId);
    return true;
    if (_data["id"] == "active") {
      LoadingDialog.showSimpleToast("السجل التجاري قائم");
      // completeRegister(commercial);
      return true;
    } else {
      IntroModel? response = await GeneralRepository(context).getIntro();
      LoadingDialog.showSimpleToast("السجل التجاري غير قائم");
      Future.delayed(Duration(seconds: 2), () {
        AutoRouter.of(context).push(LoginRoute(introModel: response));
      });
      return false;
    }
  }

  Future<bool> completeRegister(String commercial, String userId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "commercial_registration_No": commercial,
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context).post(
        url: "/Account/CompleteDataKaynaApi", body: body, showLoader: false);
    if (_data != null) {
      AutoRouter.of(context)
          .push(CompanyRegisterInterestsRoute(userId: userId));
      return true;
    } else {
      return false;
    }
  }

  Future<List<DropDownModel>> getMainField(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Account/GetMainFeildApi", body: body);
    if (_data != null) {
      return List<DropDownModel>.from(
          _data['data']["mainFields"].map((e) => DropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<DropDownSelected>> getSubField(int fkMain, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "fk_main_field": fkMain,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Account/GetSubFeildApi", body: body);
    if (_data != null) {
      var data = List<DropDownSelected>.from(
          _data['data']['subFields'].map((e) => DropDownSelected.fromJson(e)));
      data.insert(0, DropDownSelected(id: 0, name: "الكل", selected: false));
      return data;
    } else {
      return [];
    }
  }

  Future<bool> saveField(String fkMain, String fkSub, String userId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "main_filed": "$fkMain",
      "sub_filed": fkSub,
      "user_id": "$userId",
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Account/SaveFieldsApi", body: body, showLoader: false);
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.interest = _data["data"]["UserData"]["interest"];
      user.companyModel = CompanyModel.fromJson(_data["data"]["UserData"]);
      await Utils.saveUserData(user);
      AutoRouter.of(context).push(CompanyHomeRoute(index: 4));
      return true;
    } else {
      return false;
    }
  }

  Future<List<MainModel>> getMain(
      int pageIndex, int cityId, int interestId, int filterId,bool refresh ) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
      "city_id": cityId,
      "interests": interestId,
      "top_rate": filterId,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
        .get(url: "/Plans/IndexKayan", body: body);
    if (_data != null) {
      return List<MainModel>.from(
          _data['data']['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<AutoSearchModel>> getAutoSearch(String word) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"lang": lang, "word": word};
    var _data = await DioHelper(context: context)
        .get(url: "/User/AutoSearchApi", body: body);
    if (_data != null) {
      return List<AutoSearchModel>.from(
          _data['kayans'].map((e) => AutoSearchModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMainSearch(
      int pageIndex, int searchId, int fieldId, String text) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "SearchId": searchId,
      "id": fieldId,
      "text": text,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Account/FilterSearchKayanApi", body: body);
    if (_data != null) {
      return List<MainModel>.from(
          _data['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<CompFavoriteModel>> getFavoriteData(
      int pageIndex, int fkCity, fkInterest, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
      "fk_city": fkCity,
      "fk_intrest": fkInterest,
      // "Rate": rate,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
        .get(url: "/Plans/MyWishlist", body: body);
    if (_data != null) {
      return List<CompFavoriteModel>.from(_data['data']["MyWishlist3"]
          .map((e) => CompFavoriteModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<CompInvitationModel>> getInvitationData(int pageIndex, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
      "fk_city": "0",
      "fk_intrest": "0",
      "Rate": "M",
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
        .get(url: "/Plans/IndexApi", body: body);
    if (_data != null) {
      return List<CompInvitationModel>.from(
          _data['data'].map((e) => CompInvitationModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<FollowerModel>> getFollowersFiltered(
      int pageIndex, int cityId, int interestId, int filterId, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "CityId": cityId,
      "interestId": interestId,
      "RateId": filterId,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/MyFollow", body: body);
    if (_data != null) {
      return List<FollowerModel>.from(
          _data['follows'].map((e) => FollowerModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<MainDetailsModel?> getMainDetails(String id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "userId": userId,
      "from_home": 0,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/KayanDetailsApi", body: body);
    if (_data != null) {
      return MainDetailsModel.fromJson(_data);
    } else {
      return MainDetailsModel();
    }
  }

  Future<bool> addLike(String kayanId) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "Kayan_Id": kayanId,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/User/AddLikeApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addFollow(String kayanId) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "Kayan_Id": kayanId,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/User/AddFollowApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendBrochure(String kayanId) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "Current_User": userId,
      "Kayan_Id": kayanId,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Plans/SendBusinessCard", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addRate(int rate, String kayanId) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "kayan_Id": kayanId,
      "userId": userId,
      "newRate": rate,
      "EditRate": "1",
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Plans/AddRateApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addComment(String kayanId, String msg, File? image) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "kayan_Id": kayanId,
      "userId": userId,
      "txtcomment": msg,
      "uploadImage": image,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .uploadFile(url: "/User/AddCommentApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteComment(int commentId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"id": commentId, "lang": lang};
    var _data = await DioHelper(context: context)
        .post(url: "/User/DeleteCommentApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> editComment(int commentId, String msg) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"id": commentId, "newtext": msg, "lang": lang};
    var _data = await DioHelper(context: context)
        .post(url: "/User/EditCommentApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> reportComment(int commentId, String kayanId, String msg) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "commentId": commentId,
      "userId": userId,
      "txtReport": msg,
      "KayanId": kayanId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/User/CommentReportApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<CompFavDetailsModel?> getAds(
      int adsId, int sendCard, int showSendCard) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "Id": adsId,
      "userId": userId,
      "lang": lang,
      "idSendCard": sendCard,
      "IsShowWhenSend": showSendCard,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/InvestmentInvitation/PreviewBusiness_CardApi", body: body);
    if (_data != null) {
      return CompFavDetailsModel.fromJson(_data['businesscardDB']);
    } else {
      return null;
    }
  }

  Future<bool> updateAds(int adsId, int showSend) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "Id": adsId,
      "userId": userId,
      "lang": lang,
      "IsShowWhenSend": showSend == 0 ? false : true
    };
    var _data = await DioHelper(context: context).get(
        url: "/InvestmentInvitation/UpdateAnnouncement_Business_CardApi",
        body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getAdsPoint(
      String type, int points, int adsId, String adsType) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "type": type,
      "point": points,
      "id_ads": adsId,
      "type_ads": adsType,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .get(url: "/InvestmentInvitation/PoketPointKayanApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> likeAds(int announcementId, String type) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "Announcement_Id": announcementId,
      "type": type
    };
    var _data = await DioHelper(context: context)
        .post(url: "/InvestmentInvitation/AddWishApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> followAds(String kayanId) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "Kayan_Id": kayanId,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/InvestmentInvitation/AddFollowApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CompInterestModel>> getInterest(bool refresh ) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
        .get(url: "/Account/GetInterestsKayanApi", body: body);
    if (_data != null) {
      return List<CompInterestModel>.from(
          _data['data']['interests'].map((e) => CompInterestModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> saveInterest(String items) async {
    String userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "interests": items,
      "lang": lang,
      "user_id": "$userId",
    };
    var _data = await DioHelper(context: context).post(
        url: "/Account/EditInterstiesKayanApi", body: body, showLoader: false);
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.interest = _data['data']["UserData"]["interest"];
      user.companyModel = CompanyModel.fromJson(_data['data']["UserData"]);

      await Utils.saveUserData(user);
      print("____@@_${user.interest}");
      return true;
    } else {
      return false;
    }
  }

  Future<List<ProfileCommentsModel>> getProfileComments() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/MyCommentsApi", body: body);
    if (_data != null) {
      return List<ProfileCommentsModel>.from(
          _data['Kayans'].map((e) => ProfileCommentsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> rateProfileComment(int rate, String kayanId) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "kayan_Id": kayanId,
      "Current_User": userId,
      "NewRate": rate,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/EditRateApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ConversationModel>> getConversation() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "id_user": userId,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/ChatApi/GetListMsgOfUser", body: body);
    if (_data != null) {
      return List<ConversationModel>.from(
          _data['data'].map((e) => ConversationModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<String?> promoCode() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"user_id": userId, "lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/PromoCode", body: body);
    if (_data != null) {
      return _data["data"]["promocode"];
    } else {
      return null;
    }
  }

  Future<CompWalletModel?> getWalletData() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"user_id": userId, "lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/MyWallet", body: body);
    updateWallet(_data["data"]["perviewStatsicViewModel"]['points']);

    if (_data != null) {
      return CompWalletModel.fromJson(_data["data"]["perviewStatsicViewModel"]);
    } else {
      return null;
    }
  }

  Future<bool> updateWallet(int points) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
      "Marketing_points": points,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/UpdateMainPockect", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<WalletDetailsModel>> getWalletDetails() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/DetailsWallet", body: body);
    if (_data != null) {
      return List<WalletDetailsModel>.from(
          _data["data"].map((e) => WalletDetailsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> shareWalletPoint(String type, double package) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "user_id": userId,
      "type": type,
      "package": package,
      "lang": lang
    };
    var _data = await DioHelper(context: context).post(
      url: "/Plans/SetMainPockect",
      body: body,
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<CompFilterReconciliationModel?> getReconciliation() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/Getfiltering", body: body);
    if (_data != null) {
      return CompFilterReconciliationModel.fromJson(
          _data["data"]['kayan_data']);
    } else {
      return null;
    }
  }

  Future<List<DropDownModel>> getBank() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/WalletUser/GetAllBanks", body: body);
    if (_data != null) {
      return List<DropDownModel>.from(
          _data['Banks'].map((e) => DropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> reconciliationBank(double cost, double point, String fullName,
      String fkBank, String iBAN) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "userId": userId,
      "points": point,
      "cost": cost,
      "full_name": fullName,
      "fk_bank": fkBank,
      "IBAN": iBAN,
      "lang": lang
    };
    var _data = await DioHelper(context: context).post(
        url: "/WalletUser/AddFilterRequestApi", body: body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<CompStatisticsDetailsModel?> getStatistics() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/MyStatistics", body: body);
    if (_data != null) {
      return CompStatisticsDetailsModel.fromJson(_data["data"]);
    } else {
      return null;
    }
  }

  Future<BarcodeModel?> getBarcode() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/BarCode", body: body);
    if (_data != null) {
      return BarcodeModel.fromJson(_data["data"]["barcode"]);
    } else {
      return null;
    }
  }

  Future<bool> updateCompanyData(UpdateCompanyProfileModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
      url: '/Account/UpdateKayanApi',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.companyModel =
          CompanyModel.fromJson(_data['data']["kyanApiViewModel"]);
      user.deviceId = GlobalState.instance.get("token");
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeImage(int id, int type) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "TypeImg": type,
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context)
        .post(url: '/Account/RemoveImages', body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendBrochureData(SendBrochureModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
      url: '/Plans/AddNewCard',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<SpecificAdsModel?> getSpecificAds(int adsId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context).get(
        url:
            "/InvestmentInvitation/PreviewAnnouncement_sent_specific_categoryApi",
        body: body);
    if (_data != null) {
      return SpecificAdsModel.fromJson(_data);
    } else {
      return null;
    }
  }

  Future<bool> updateSpecificAds(int adsId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context).get(
        url:
            "/InvestmentInvitation/UpdateAnnouncement_sent_specific_categoryApi",
        body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getSpecificAdsPoint(
      String type, int points, int adsId, String adsType) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "type": type,
      "point": points,
      "id_ads": adsId,
      "type_ads": adsType,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .get(url: "/InvestmentInvitation/PoketPointKayanApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> likeSpecificAds(int announcementId, String type) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "Announcement_Id": announcementId,
      "type": type
    };
    var _data = await DioHelper(context: context)
        .post(url: "/InvestmentInvitation/AddWishApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> specificAdsRate(int adsId, int rate, String type) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "ad_Id": adsId,
      "userId": userId,
      "NewRate": rate,
      "type": type,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .post(url: "/InvestmentInvitation/AddRateApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> specificAdsComment(
      int adsId, String msg, File? image, String type) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "IId": adsId,
      "userId": userId,
      "txtcomment": msg,
      "uploadImage": image,
      "lang": lang,
      "type": type
    };
    var _data = await DioHelper(context: context)
        .uploadFile(url: "/InvestmentInvitation/AddCommentApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<InvestmentAdsModel?> getInvestmentAds(int adsId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context).get(
        url: "/InvestmentInvitation/PreviewAnnouncement_service_evaluationApi",
        body: body);
    if (_data != null) {
      return InvestmentAdsModel.fromJson(_data);
    } else {
      return null;
    }
  }

  Future<List<PackagesModel>> getAllPackages(bool refresh ) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
        .get(url: "/Plans/GetAllPackages", body: body);
    if (_data != null) {
      return List<PackagesModel>.from(
          _data['packages'].map((e) => PackagesModel.fromJson(e)));
    } else {
      return [];
    }
  }
  Future<List<DropDownSelected>> getPeopleInterests(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/Getinterests", body: body);
    if (_data != null) {
      var data = List<DropDownSelected>.from(
          _data["data"]["interests"].map((e) => DropDownSelected.fromJson(e)));
      data.insert(0, DropDownSelected(id: 0, name: "الكل", selected: false));
      return data;
    } else {
      return [];
    }
  }

  Future<CostSubscribeModel?> getCostSubscribe(
      int countView, int countImage, int countVideo, int time) async {
    Map<String, dynamic> body = {
      "count_view": countView,
      "count_image": countImage,
      "count_video": countVideo,
      "time": time,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/CostAdvirtisment',
      body: body,
    );
    if (_data != null) {
      return CostSubscribeModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<ExtraCostModel?> getExtraCostSubscribe(int cost, int price) async {
    Map<String, dynamic> body = {
      "cost": cost,
      "price": price,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AddPriceAdvirtisment',
      body: body,
    );
    if (_data != null) {
      return ExtraCostModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<CostSubscribeModel?> getOpinionSubscribeCost(
      int countView, int countImage, int countVideo, int countQuestion) async {
    Map<String, dynamic> body = {
      "count_view": countView,
      "count_image": countImage,
      "count_video": countVideo,
      "count_question": countQuestion,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/CostAdvirtismentEvelation',
      body: body,
    );
    if (_data != null) {
      return CostSubscribeModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }



  Future<double?> finalCost(double baseCost) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"base_cost": baseCost, "lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/AccountFinalCost", body: body);
    if (_data != null) {
      return _data["data"]['FinalCost'];
    } else {
      return null;
    }
  }

  Future<String?> savePdf(int id) async {
    Map<String, dynamic> body = {"ID": id};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/SavePdf_Sent_Specific_Category", body: body);
    if (_data != null) {
      return _data["PathPdf"];
    } else {
      return null;
    }
  }

  Future<SpecificAdsDetailsModel?> getSpecificAdsDetails(int id) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/DetailsAnnouncement_sent_specific_category',
      body: body,
    );
    if (_data != null) {
      return SpecificAdsDetailsModel.fromJson(
          _data['data']['detailsAnnouncement_Sent_Specific_CategoryViewModel']);
    } else {
      return null;
    }
  }

  Future<ProductAdsDetailsModel?> getProductAdsDetails(int id) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/DetailsAnnouncement_service_evaluation',
      body: body,
    );
    if (_data != null) {
      return ProductAdsDetailsModel.fromJson(
          _data['data']['detailsAnnouncement_service_evaluationViewModel']);
    } else {
      return null;
    }
  }

  Future<BusinessAdsDetailsModel?> getBusinessAdsDetails(int id) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/DetailsPreviewBusiness_Card',
      body: body,
    );
    if (_data != null) {
      return BusinessAdsDetailsModel.fromJson(
          _data['data']['detailsPreviewBusiness_CardViewModel']);
    } else {
      return null;
    }
  }
  Future<BusinessAdsDetailsModel?> getMainAdsDetails(int id) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/DetailsPreviewMainPage',
      body: body,
    );
    if (_data != null) {
      return BusinessAdsDetailsModel.fromJson(
          _data['data']['detailsPreviewBusiness_CardViewModel']);
    } else {
      return null;
    }
  }

  Future<BrochureDetailsModel?> getBrochureDetails() async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang":lang
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/GetDataCard',
      body: body,
    );
    if (_data != null) {
      return BrochureDetailsModel.fromJson(
          _data['data']['businesscardDB']);
    } else {
      return null;
    }
  }
  Future<CostSubscribeModel?> getCostBrochureSubscribe(
      int brochureNum) async {
    Map<String, dynamic> body = {
      "numbercard": brochureNum,

    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AccountBusinessCard',
      body: body,
    );
    if (_data != null) {
      return CostSubscribeModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }


  Future<ExtraCostModel?> getExtraBrochureCost(int cost, int price) async {
    Map<String, dynamic> body = {
      "cost": cost,
      "price": price,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AccountNewCost',
      body: body,
    );
    if (_data != null) {
      return ExtraCostModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<int?> addSubscribe(AddSubscribeModel model) async {
    var _data = await DioHelper(context: context).post(
      url: '/Plans/Announcementsentspecificcategory',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      return _data["ID"];
    } else {
      return null;
    }
  }

  Future<int?> addSpecialSubscribe(AddSpecialSubscribeModel model) async {
    var _data = await DioHelper(context: context).get(
      url: '/Plans/MainPageAdvert',
      body: model.toJson(),
    );
    if (_data != null) {
      return _data["ID"];
    } else {
      return null;
    }
  }

  Future<int?> addOpinionSubscribe(AddOpinionSubscribeModel model) async {
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AddAnnouncement_service_evaluation',
      body: model.toJson(),
    );
    if (_data != null) {
      return _data["ID"];
    } else {
      return null;
    }
  }

  Future<bool> addBrochureSubscribe(AddBrochureSubscribeModel model) async {
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AddNewBusinessCard',
      body: model.toJson(),
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

}
