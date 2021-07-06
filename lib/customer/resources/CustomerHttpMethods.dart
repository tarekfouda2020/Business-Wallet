
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/customer/blocs/wallet_count_cubit/wallet_count_cubit.dart';
import 'package:base_flutter/customer/models/Dtos/UpdateCustomerModel.dart';
import 'package:base_flutter/customer/models/Dtos/drop_down_model.dart';
import 'package:base_flutter/customer/models/Dtos/field_drop_down_model.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/MessageModel.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/conversation_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/reconciliation_data_model.dart';
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
    var _data = await DioHelper(
      context: context,
    ).get(url: "/Account/GetAllInterestApi", body: body);
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


  Future<String?> promoCode(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"userId": userId, "lang": lang};
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/BusinessCard/UserPromoCodeApi", body: body);
    if (_data != null) {
      return _data["promocode"];
    } else {
      return null;
    }
  }

  Future<List<ProfileCommentsModel>> getProfileComments(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
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

  Future<WalletModel?> getWalletData(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {"userId": userId, "lang": lang};
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/WalletUser/IndexApi", body: body);
    if (_data != null) {
      context.read<WalletCountCubit>().onUpdateCount(0);
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

  Future<bool> changePassword(
      String oldPassword, String newPassword, String userId) async {
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

  Future<String?> walletHelp(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"lang": lang};
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/PageDetail", body: body);
    if (_data != null) {
      return _data["data"]["details"];
    } else {
      return null;
    }
  }

  Future<List<WalletDetailsModel>> getWalletDetails(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/WalletUser/DetailsWalletApi", body: body);
    if (_data != null) {
      return List<WalletDetailsModel>.from(
          _data['details'].map((e) => WalletDetailsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<ReconciliationDataModel?> getReconciliation(
      double cost, double costMun, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "lang": lang,
      "Cost": cost,
      "CostMun": costMun
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
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

  Future<bool> sendMessage(String sender, String receiver, String msg) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "Sender_id": sender,
      "reciver_id": receiver,
      "msg": msg,
      "lang": lang
    };
    var _data = await DioHelper(context: context).post(
        url: "/ChatApi/SendPushMsg",
        body: body,
        showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ConversationModel>> getConversation(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "id_user": userId,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/ChatApi/GetListMsgOfUser", body: body);
    if (_data != null) {
      return List<ConversationModel>.from(
          _data['data'].map((e) => ConversationModel.fromJson(e)));
    } else {
      return [];
    }
  }
  Future<List<MessageModel>> getChatMessages(String sender , String receiver, int pageNumber) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "SenderId": sender,
      "ReceiverId": receiver,
    };
    var _data = await DioHelper(context: context,)
        .get(url: "/ChatApi/GetAllMessageBetweenTwoUser", body: body);
    if (_data != null) {
      return List<MessageModel>.from(
          _data['data'].map((e) => MessageModel.fromJson(e)));
    } else {
      return [];
    }
  }
}
