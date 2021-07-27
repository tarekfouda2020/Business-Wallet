import 'dart:io';

import 'package:base_flutter/company/models/business_ads_details_model.dart';
import 'package:base_flutter/company/models/comp_statistics_details_model.dart';
import 'package:base_flutter/company/models/product_ads_details_model.dart';
import 'package:base_flutter/company/models/specific_ads_details_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyStatisticsMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CompanyStatisticsMethods(this.context);

  Future<CompStatisticsDetailsModel?> getStatistics(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/MyStatistics", body: body);
    if (_data != null) {
      return CompStatisticsDetailsModel.fromJson(_data["data"]);
    } else {
      return null;
    }
  }
  Future<SpecificAdsModel?> getSpecificAds(int adsId,bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
        url:
        "/InvestmentInvitation/PreviewAnnouncement_sent_specific_categoryApiV1",
        body: body);
    if (_data != null) {
      return SpecificAdsModel.fromJson(_data);
    } else {
      return null;
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
  Future<InvestmentAdsModel?> getInvestmentAds(int adsId,bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"Id": adsId, "userId": userId, "lang": lang};
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
        url: "/InvestmentInvitation/PreviewAnnouncement_service_evaluationApiV1",
        body: body);
    if (_data != null) {
      return InvestmentAdsModel.fromJson(_data);
    } else {
      return null;
    }
  }

  Future<SpecificAdsDetailsModel?> getSpecificAdsDetails(int id,bool refresh) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
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
  Future<ProductAdsDetailsModel?> getProductAdsDetails(int id,bool refresh) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
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
  Future<BusinessAdsDetailsModel?> getBusinessAdsDetails(int id,bool refresh) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
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
  Future<BusinessAdsDetailsModel?> getMainAdsDetails(int id,bool refresh) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context,forceRefresh: refresh).get(
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

  Future<String?> saveSpecificPdf(int id) async {
    Map<String, dynamic> body = {"ID": id};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/SavePdf_Sent_Specific_Category", body: body);
    if (_data != null) {
      return _data["PathPdf"];
    } else {
      return null;
    }
  }
  Future<String?> saveProductPdf(int id) async {
    Map<String, dynamic> body = {"ID": id};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/SavePdf_Sent_evaluation_static", body: body);
    if (_data != null) {
      return _data["PathPdf"];
    } else {
      return null;
    }
  }

  Future<String?> saveBusinessPdf(int id) async {
    Map<String, dynamic> body = {"ID": id};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/SavePdf_Business_Card_static", body: body);
    if (_data != null) {
      return _data["PathPdf"];
    } else {
      return null;
    }
  }
  Future<String?> saveMainPdf(int id) async {
    Map<String, dynamic> body = {"ID": id};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/SavePdf_SaveSent_MainPage_static", body: body);
    if (_data != null) {
      return _data["PathPdf"];
    } else {
      return null;
    }
  }



}
