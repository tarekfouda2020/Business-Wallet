import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/customer/models/Dtos/MapFilterModel.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyHomeMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CompanyHomeMethods(this.context);

  Future<List<AutoSearchModel>> getAutoSearch(String word) async {
    var lang = context
        .read<LangCubit>()
        .state
        .locale
        .languageCode;

    Map<String, dynamic> body = {"lang": lang, "word": word};
    var _data = await DioHelper(context: context)
        .get(url: "/User/AutoSearchApiV1", body: body);
    if (_data != null) {
      return List<AutoSearchModel>.from(
          _data['kayans'].map((e) => AutoSearchModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMapProviders(MapFilterModel model) async {
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/IndexAndSearchApi",
        body: model.toJson(),
        showLoader: true);
    if (_data != null) {
      return List<MainModel>.from(
          _data['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMainSearch(int pageIndex, int searchId,
      int fieldId, int subFieldId, String text, bool refresh) async {
    var lang = context
        .read<LangCubit>()
        .state
        .locale
        .languageCode;
    var userId = context
        .read<UserCubit>()
        .state
        .model
        .companyModel!
        .userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "SearchId": searchId,
      "id": fieldId,
      "subFieldId": subFieldId,
      "text": text,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Account/FilterSearchKayanApiV1", body: body);
    if (_data != null) {
      return List<MainModel>.from(
          _data['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMain(int pageIndex, int cityId, int interestId,
      int filterId, bool refresh) async {
    var lang = context
        .read<LangCubit>()
        .state
        .locale
        .languageCode;
    var userId = context
        .read<UserCubit>()
        .state
        .model
        .companyModel!
        .userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
      "city_id": cityId,
      "interests": interestId,
      "top_rate": filterId,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/IndexKayanV1", body: body);
    if (_data != null) {
      return List<MainModel>.from(
          _data['data']['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<CompInvitationModel>> getInvitationData(int pageIndex,
      bool refresh) async {
    var lang = context
        .read<LangCubit>()
        .state
        .locale
        .languageCode;
    var userId = context
        .read<UserCubit>()
        .state
        .model
        .companyModel!
        .userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
      "fk_city": "0",
      "fk_intrest": "0",
      "Rate": "M",
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/IndexApi", body: body);
    if (_data != null) {
      return List<CompInvitationModel>.from(
          _data['data'].map((e) => CompInvitationModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<FollowerModel>> getFollowersFiltered(int pageIndex, int cityId,
      int interestId, int filterId, bool refresh) async {
    var lang = context
        .read<LangCubit>()
        .state
        .locale
        .languageCode;
    var userId = context
        .read<UserCubit>()
        .state
        .model
        .companyModel!
        .userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "CityId": cityId,
      "interestId": interestId,
      "RateId": filterId,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/MyFollowV1", body: body);
    if (_data != null) {
      return List<FollowerModel>.from(
          _data['follows'].map((e) => FollowerModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<CompFavoriteModel>> getFavoriteData(int pageIndex, int fkCity,
      fkInterest, bool refresh) async {
    var lang = context
        .read<LangCubit>()
        .state
        .locale
        .languageCode;
    var userId = context
        .read<UserCubit>()
        .state
        .model
        .companyModel!
        .userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
      "fk_city": fkCity,
      "fk_intrest": fkInterest,
      // "Rate": rate,
      "page_number": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/MyWishlist", body: body);
    if (_data != null) {
      return List<CompFavoriteModel>.from(_data['data']["MyWishlist3"]
          .map((e) => CompFavoriteModel.fromJson(e)));
    } else {
      return [];
    }
  }
}
