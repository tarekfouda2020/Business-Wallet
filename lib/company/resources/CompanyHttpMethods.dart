import 'dart:ffi';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
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
      int pageIndex, int cityId, int interestId, int filterId) async {
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
    var _data = await DioHelper(context: context)
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
      int pageIndex, int fkCity, fkInterest) async {
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
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/MyWishlist", body: body);
    if (_data != null) {
      return List<CompFavoriteModel>.from(_data['data']["MyWishlist3"]
          .map((e) => CompFavoriteModel.fromJson(e)));
    } else {
      return [];
    }
  }





  Future<List<CompInvitationModel>> getInvitationData(int pageIndex) async {
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
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/IndexApi", body: body);
    if (_data != null) {
      return List<CompInvitationModel>.from(
          _data['data'].map((e) => CompInvitationModel.fromJson(e)));
    } else {
      return [];
    }
  }




  Future<List<FollowerModel>> getFollowersFiltered(
      int pageIndex, int cityId, int interestId, int filterId) async {
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
    var _data = await DioHelper(context: context)
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
}
