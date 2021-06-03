import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
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

  Future<bool> saveInterest(String items) async {
    String userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "items": "$items",
      "UserId": "$userId",
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Account/SaveInterestApi", body: body, showLoader: false);
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.interest=_data["UserData"]["interest"];
      if (user.typeUser == 1) {
        user.companyModel = CompanyModel.fromJson(_data["UserData"]);
      } else {
        user.customerModel = CustomerModel.fromJson(_data["UserData"]);
      }

      await Utils.saveUserData(user);
      print("____@@_${user.interest}");
      Utils.setCurrentUserData(user,0, context);
      return true;
    } else {
      return false;
    }
  }
}
