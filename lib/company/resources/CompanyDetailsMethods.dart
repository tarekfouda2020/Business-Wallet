import 'dart:io';

import 'package:base_flutter/company/models/comp_fav_details_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailsMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CompanyDetailsMethods(this.context);
  Future<MainDetailsModel?> getMainDetails(String id,bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "userId": userId,
      "from_home": 0,
      "lang": lang
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
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
      int adsId, int sendCard, int showSendCard,bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "Id": adsId,
      "userId": userId,
      "lang": lang,
      "idSendCard": sendCard,
      "IsShowWhenSend": showSendCard,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
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


}
