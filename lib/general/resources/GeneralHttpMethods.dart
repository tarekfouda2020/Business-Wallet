import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/GlobalState.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/models/intro_model.dart';
import 'package:base_flutter/general/models/social_model.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:base_flutter/general/screens/forget_password_code/ForgetPasswordCodeImports.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralHttpMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  GeneralHttpMethods(this.context);

  Future<bool> userLogin(String email, String pass) async {
    String? _token = "await messaging.getToken()";
    String _lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "email": "$email",
      "password": "$pass",
      "lang": "$_lang",
      "device_id": "$_token",
      "device_type": Platform.isIOS ? "ios" : "android",
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Account/LoginUserApi", body: body, showLoader: false);
    if (_data != null) {
      var type = _data["data"]["UserData"]["type_user"];
      var interest = _data["data"]["UserData"]["interest"];
      var status = _data["status"];
      var step = _data["step"];
      var userId = _data["data"]["UserData"]["user_id"];
      if (type == 2) {
        if (status == 2) {
          await Utils.setDeviceId("$_token");
          UserModel user = new UserModel();
          user.deviceId = _token;
          user.lang = _lang;
          user.typeUser = type;
          user.interest = interest;
          user.step = step;
          user.customerModel =
              CustomerModel.fromJson(_data["data"]["UserData"]);
          await Utils.saveUserData(user);
          Utils.setCurrentUserData(
              user, step, context, user.customerModel!.userId);
        } else {
          context.router.push(ActiveAccountRoute(userId: userId));
        }
      } else {
        if (step == 0) {
          context.router.push(CompActiveAccountRoute(userId: userId));
        } else if (step == 1) {
          context.router.push(SuccessfullyActiveRoute(userId: userId));
        } else if (step == 2) {
          context.router.push(CompanyRegisterCommercialRoute(userId: userId));
        } else if (step == 3) {
          context.router.push(CompanyRegisterInterestsRoute(userId: userId));
        } else {
          await Utils.setDeviceId("$_token");
          UserModel user = new UserModel();
          user.deviceId = _token;
          user.lang = _lang;
          user.typeUser = type;
          user.interest = interest;
          user.companyModel = CompanyModel.fromJson(_data["data"]["UserData"]);
          await Utils.saveUserData(user);
          Utils.setCurrentUserData(
              user, step, context, user.customerModel!.userId);
        }
      }

      return true;
    } else {
      return false;
    }
  }

  Future<IntroModel?> getIntro({bool refresh = true}) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    Map<String, dynamic>? _data =
        await DioHelper(context: context, forceRefresh: refresh).get(
      url: "/Plans/GetSetting",
      body: body,
    );
    if (_data != null) {
      _data.addAll({"show": _data["show"]});
      return IntroModel.fromJson(_data["setting"]);
    } else {
      return null;
    }
  }

  Future<bool> forgetPasswordByPhone(String phone) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "Phone": "$phone",
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Account/ForgetPasswordApi", body: body, showLoader: false);
    if (_data != null) {
      AutoRouter.of(context)
          .push(ForgetPasswordCodeRoute(phone: _data["data"]["Phone"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> forgetPasswordByEmail(String email) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "Email": "$email",
      "lang": lang,
    };
    var _data = await DioHelper(context: context).post(
        url: "/Plans/ForgatPasswordbyEmail", body: body, showLoader: false);
    if (_data != null) {
      AutoRouter.of(context)
          .push(ForgetPasswordCodeRoute(phone: _data["data"]["Phone"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> forgetPasswordCode(String phone, String code) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "Phone": "$phone",
      "Code": code,
      "lang": lang,
    };
    var _data = await DioHelper(context: context).post(
        url: "/Account/CheckCodeForgetPasswordApi",
        body: body,
        showLoader: false);
    if (_data != null) {
      AutoRouter.of(context).push(ResetPasswordRoute(userId: _data["userId"]));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetUserPassword(String userId, String pass) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "userId": "$userId",
      "newPassword": "$pass",
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Account/ChangePasswordByPhoneApi", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendCode(String code, String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "Code": code, "UserId": userId};
    var _data = await DioHelper(context: context)
        .post(url: "/Account/ActiveCodeUserApi", body: body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> compSendCode(String code, String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "code": code, "user_id": userId};
    var _data = await DioHelper(context: context).post(
        url: "/Account/ActiveCodeKayanApi", body: body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resendCode(String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "userId": userId};
    var _data = await DioHelper(context: context)
        .post(url: "/Account/ResendCodeApi", body: body, showLoader: false);
    return (_data != null);
  }

  Future<bool> compResendCode(String userId) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {"lang": lang, "user_id": userId};
    var _data = await DioHelper(context: context).post(
        url: "/Account/ResendCodeKayanApi", body: body, showLoader: false);
    return (_data != null);
  }

  Future<String?> aboutApp() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/GetAbout", body: body);
    if (_data != null) {
      return _data["about"];
    } else {
      return null;
    }
  }

  Future<String?> terms() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/GetCondition", body: body);
    if (_data != null) {
      return _data["condition"];
    } else {
      return null;
    }
  }

  Future<List<QuestionModel>> frequentQuestions() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/api/v1/FrequentlyAskedQuestions", body: body);
    if (_data != null) {
      return List<QuestionModel>.from(
          _data["data"].map((e) => QuestionModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> switchNotify() async {
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Client/SwitchNotify", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendMessage(
      String? name, String? phone, String? title, String? msg) async {
    String lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": "$lang",
      "userName": "$name",
      "phone": phone,
      "title": title,
      "msg": "$msg",
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Plans/SendContact", body: body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<SocialModel?> getSocial() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/GetSocail", body: body);
    if (_data != null) {
      return SocialModel.fromJson(_data["socail"]);
    } else {
      return null;
    }
  }

  Future<UserModel?> checkActive(String phone) async {
    Map<String, dynamic> body = {
      "phone": "$phone",
    };
    var _data = await DioHelper(context: context)
        .get(url: "/api/v1/CheckActive", body: body);
    print("data is $_data");
    if (_data != null) {
      final userCubit = context.read<UserCubit>().state.model;
      UserModel user = UserModel.fromJson(_data["data"]);
      int type = _data["userData"]["type"];
      // user.typeUser = type == 1 ? "user" : "company";
      user.deviceId = userCubit.deviceId;
      user.lang = userCubit.lang;
      return user;
    } else {
      return null;
    }
  }

  Future<void> customerLogout() async {
    LoadingDialog.showLoadingDialog();
    String? deviceId = await Utils.getDeviceId();
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
      "device_Id": "$deviceId",
      "user_id": context.read<UserCubit>().state.model.customerModel?.userId,
    };
    print(body);
    await DioHelper(context: context).get(url: "/Plans/Logout", body: body);
    EasyLoading.dismiss().then((value) {
      Utils.clearSavedData();
      Phoenix.rebirth(context);
    });
  }

  Future<void> companyLogout() async {
    LoadingDialog.showLoadingDialog();
    String? deviceId = await Utils.getDeviceId();
    Map<String, dynamic> body = {
      "lang": context.read<LangCubit>().state.locale.languageCode,
      "device_Id": "$deviceId",
      "user_id": context.read<UserCubit>().state.model.companyModel?.userId,
    };
    print(body);
    await DioHelper(context: context).get(url: "/Plans/Logout", body: body);
    EasyLoading.dismiss().then((value) {
      Utils.clearSavedData();
      Phoenix.rebirth(context);
    });
  }
}
