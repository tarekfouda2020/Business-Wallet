import 'dart:io';

import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CustomerDetailsMethods(this.context);

  Future<InvestmentAdsModel?> getInvestmentAds(int adsId, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context, forceRefresh: refresh).get(
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

  Future<SpecificAdsModel?> getSpecificAds(int adsId,bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
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

  Future<MainDetailsModel?> getMainDetails(String id,bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "userId": userId,
      "from_home": 0,
      "lang": lang
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh)
        .get(url: "/User/KayanDetailsApi", body: body);
    if (_data != null) {
      return MainDetailsModel.fromJson(_data);
    } else {
      return MainDetailsModel();
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


}
