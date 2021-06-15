import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/customer/models/Dtos/UpdateCustomerModel.dart';
import 'package:base_flutter/customer/models/Dtos/drop_down_model.dart';
import 'package:base_flutter/customer/models/Dtos/field_drop_down_model.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/comment_model.dart';
import 'package:base_flutter/customer/models/conversation_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:base_flutter/customer/models/favorite_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/invitation_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/reconciliation_data_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
import 'package:base_flutter/customer/models/wallet_details_model.dart';
import 'package:base_flutter/customer/models/wallet_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CustomerHttpMethods(this.context);

  Future<bool> userRegister(RegisterModel model) async {
    var _data = await DioHelper(context: context).post(
        url: "/Account/RegisterUserApi",
        body: model.toJson(),
        showLoader: false);
    if (_data != null) {
      AutoRouter.of(context)
          .popAndPush(ActiveAccountRoute(userId: _data["UserId"]));
      return true;
    } else {
      return false;
    }
  }

  Future<List<CitiesModel>> getCities(int countryId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "countryId": countryId};
    var _data = await DioHelper(context: context)
        .get(url: "/Account/GetAllCities", body: body);
    if (_data != null) {
      return List<CitiesModel>.from(
          _data['cities'].map((e) => CitiesModel.fromJson(e)));
    } else {
      return [];
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

  Future<List<FieldDropDownModel>> getFields() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/GetMainField", body: body);
    if (_data != null) {
      return List<FieldDropDownModel>.from(
          _data['fields'].map((e) => FieldDropDownModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<UserInterestModel>> getInterest() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Account/GetAllInterestApi", body: body);
    if (_data != null) {
      return List<UserInterestModel>.from(
          _data['interests'].map((e) => UserInterestModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> saveInterest(String items, String userId) async {
    // String userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "items": "$items",
      "UserId": "$userId",
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Account/SaveInterestApi", body: body, showLoader: false);
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.interest = _data["UserData"]["interest"];
      if (user.typeUser == 1) {
        user.companyModel = CompanyModel.fromJson(_data["UserData"]);
      } else {
        user.customerModel = CustomerModel.fromJson(_data["UserData"]);
      }

      await Utils.saveUserData(user);
      print("____@@_${user.interest}");
      Utils.setCurrentUserData(user, 0, context, userId: userId);
      return true;
    } else {
      return false;
    }
  }


  Future<List<MainModel>> getMainFiltered(
      int pageIndex, int cityId, int interestId, int filterId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "city_id": cityId,
      "interests": interestId,
      "top_rate": filterId,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/IndexApi", body: body);
    if (_data != null) {
      return List<MainModel>.from(
          _data['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<AutoSearchModel>> getAutoSearch(String word) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "word":word
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/AutoSearchApi", body: body);
    if (_data != null) {
      return List<AutoSearchModel>.from(
          _data['Kayans'].map((e) => AutoSearchModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMainSearched(
      int pageIndex, int searchId, int fieldId, String text) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "SearchId": searchId,
      "id": fieldId,
      "text": text,
      "page_index": pageIndex
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

  Future<MainDetailsModel?> getMainDetails(String id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "userId": userId,
      "from_home": 0,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/KayanDetailsApi", body: body);
    if (_data != null) {
      return MainDetailsModel.fromJson(_data);
    } else {
      return MainDetailsModel();
    }
  }

  Future<List<FollowerModel>> getFollowersData(int pageIndex) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/MyFollowApi", body: body);
    if (_data != null) {
      return List<FollowerModel>.from(
          _data['follows'].map((e) => FollowerModel.fromJson(e)));
    } else {
      return [];
    }
  }

  //
  // Future<List<FollowerModel>> getFollowersFiltered(
  //     int pageIndex, int cityId, int interestId, int filterId) async {
  //   var lang = context.read<LangCubit>().state.locale.languageCode;
  //   var userId = context.read<UserCubit>().state.model.customerModel!.userId;
  //
  //   Map<String, dynamic> body = {
  //     "lang": lang,
  //     "userId": userId,
  //     "CityId": cityId,
  //     "interestId": interestId,
  //     "RateId": filterId,
  //     "page_index": pageIndex
  //   };
  //   var _data = await DioHelper(context: context)
  //       .get(url: "/User/SearchKayanFollowApi", body: body);
  //   if (_data != null) {
  //     return List<FollowerModel>.from(
  //         _data['follows'].map((e) => FollowerModel.fromJson(e)));
  //   } else {
  //     return [];
  //   }
  // }

  Future<List<FollowerModel>> getFollowersFiltered(
      int pageIndex, int cityId, int interestId, int filterId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "CityId": cityId,
      "interestId": interestId,
      "RateId": filterId,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/MyFollowApi", body: body);
    if (_data != null) {
      return List<FollowerModel>.from(
          _data['follows'].map((e) => FollowerModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> addLike(String kayanId) async {
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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

  Future<bool> addRate(int rate, String kayanId) async {
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "kayan_Id": kayanId,
      "userId": userId,
      "newRate": rate,
      "EditRate": "1",
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .post(url: "/User/AddRateApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addComment(String kayanId, String msg, File? image) async {
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

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

  Future<List<FavoriteModel>> getFavoriteData(
      int pageIndex, int fkCity, fkInterest, String rate) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "fk_city": fkCity,
      "fk_intrest": fkInterest,
      "Rate": rate,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/WishlistApi", body: body);
    if (_data != null) {
      return List<FavoriteModel>.from(
          _data['data']["MyWishlist1"].map((e) => FavoriteModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<InvitationModel>> getInvitationData(
      int pageIndex, int fkCity, fkInterest, String rate) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "fk_city": fkCity,
      "fk_intrest": fkInterest,
      "Rate": rate,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context)
        .get(url: "/User/IndexInvetionsApi", body: body);
    if (_data != null) {
      return List<InvitationModel>.from(
          _data['data']["allProducts"].map((e) => InvitationModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<SpecificAdsModel?> getSpecificAds(int adsId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

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

  Future<bool> updateInvestmentAds(int adsId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context).get(
        url: "/InvestmentInvitation/UpdateAnnouncement_service_evaluationApi",
        body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> answerQuestion(String answers, int fkAds) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "fk_ads": fkAds,
      "Answers": answers,
      "userId": userId,
      "lang": lang
    };
    var _data = await DioHelper(context: context)
        .get(url: "/InvestmentInvitation/SaveAnswersApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> promoCode() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"userId": userId, "lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/BusinessCard/UserPromoCodeApi", body: body);
    if (_data != null) {
      return _data["promocode"];
    } else {
      return null;
    }
  }

  Future<List<ProfileCommentsModel>> getProfileComments() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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

  Future<WalletModel?> getWalletData() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"userId": userId, "lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/WalletUser/IndexApi", body: body);
    if (_data != null) {
      return WalletModel.fromJson(_data["data"]);
    } else {
      return null;
    }
  }

  Future<bool> shareWalletPoint(int costMoney, int point, String code) async {
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "userId": userId,
      "type": "1",
      "package": costMoney,
      "promoCode": code,
      "PointMonthvalue": point,
      "lang": lang
    };
    var _data = await DioHelper(context: context).post(
        url: "/WalletUser/SetMainPockectEditApi",
        body: body,
        showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateCustomerData(UpdateCustomerModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
      url: '/Account/EditProfileApi',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.customerModel = CustomerModel.fromJson(_data["UserData"]);
      user.deviceId = GlobalState.instance.get("token");
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "UserId": userId,
      "OldPassword": oldPassword,
      "NewPassword": newPassword
    };
    var data = await DioHelper(context: context)
        .post(url: "/Account/ChangePasswordUserApi", body: body);
    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> walletHelp() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/PageDetail", body: body);
    if (_data != null) {
      return _data["data"]["details"];
    } else {
      return null;
    }
  }

  Future<List<WalletDetailsModel>> getWalletDetails() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/WalletUser/DetailsWalletApi", body: body);
    if (_data != null) {
      return List<WalletDetailsModel>.from(
          _data['details'].map((e) => WalletDetailsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<ReconciliationDataModel?> getReconciliation(
      double cost, double costMun) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "lang": lang,
      "Cost": cost,
      "CostMun": costMun
    };
    var _data = await DioHelper(context: context)
        .get(url: "/WalletUser/GetWalletApi", body: body);
    if (_data != null) {
      return ReconciliationDataModel.fromJson(_data["data"]);
    } else {
      return null;
    }
  }

  Future<bool> reconciliationBank(double cost, double point, String fullName,
      String fkBank, String iBAN) async {
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
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
        url: "/WalletUser/AddFilterRequestUserApi",
        body: body,
        showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ConversationModel>> getConversation() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

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
}
