import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
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
}
