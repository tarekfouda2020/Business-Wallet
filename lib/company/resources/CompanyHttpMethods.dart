import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/company/models/barcode_model.dart';
import 'package:base_flutter/company/models/branch_model.dart';
import 'package:base_flutter/company/models/comp_filter_reconciliation_model.dart';
import 'package:base_flutter/company/models/comp_interest_model.dart';
import 'package:base_flutter/company/models/comp_wallet_model.dart';
import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/company/models/dots/AddBranchModel.dart';
import 'package:base_flutter/company/models/dots/SendBrochureModel.dart';
import 'package:base_flutter/company/models/dots/UpdateCompanyProfile.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/conversation_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/wallet_details_model.dart';
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
      var data = List<CitiesModel>.from(
          _data['cities'].map((e) => CitiesModel.fromJson(e)));
      data.insert(0, CitiesModel(id: 1000, name: "????????", fkCountry: 3));
      return data;
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
      LoadingDialog.showSimpleToast("?????????? ?????????????? ????????");
      // completeRegister(commercial);
      return true;
    } else {
      IntroModel? response = await GeneralRepository(context).getIntro();
      LoadingDialog.showSimpleToast("?????????? ?????????????? ?????? ????????");
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
    var _data = await DioHelper(context: context)
        .get(url: "/Account/CompleteDataKaynaApi", body: body);
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
      data.insert(0, DropDownSelected(id: 0, name: "????????", selected: false));
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
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .post(url: "/Account/SaveFieldsApi", body: body, showLoader: false);
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.interest = _data["data"]["UserData"]["interest"];
      user.companyModel = CompanyModel.fromJson(_data["data"]["UserData"]);
      context.read<UserCubit>().onUpdateUserData(user);
      await Utils.saveUserData(user);
      // AutoRouter.of(context).pushAndPopUntil(CompanyHomeRoute(index: 2),
      //     predicate: (predicate) => false);
      AutoRouter.of(context).pop();
      return true;
    } else {
      return false;
    }
  }

  Future<List<CompInterestModel>> getInterest(bool refresh) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Account/GetInterestsKayanApi", body: body);
    if (_data != null) {
      return List<CompInterestModel>.from(
          _data['data']['interests'].map((e) => CompInterestModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> saveInterest(String items) async {
    String userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "interests": items,
      "lang": lang,
      "user_id": "$userId",
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Account/EditInterstiesKayanApiV1", body: body);
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.interest = _data['data']["UserData"]["interest"];
      user.companyModel = CompanyModel.fromJson(_data['data']["UserData"]);
      context.read<UserCubit>().onUpdateUserData(user);
      await Utils.saveUserData(user);
      return true;
    } else {
      return false;
    }
  }

  Future<List<ProfileCommentsModel>> getProfileComments(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
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
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
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

  Future<List<ConversationModel>> getConversation(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

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

  Future<String?> promoCode(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"user_id": userId, "lang": lang};
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/PromoCode", body: body);
    if (_data != null) {
      return _data["data"]["promocode"];
    } else {
      return null;
    }
  }

  Future<CompWalletModel?> getWalletData(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {"user_id": userId, "lang": lang};
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/MyWallet", body: body);
    updateWallet(_data["data"]["perviewStatsicViewModel"]['points']);

    if (_data != null) {
      return CompWalletModel.fromJson(_data["data"]["perviewStatsicViewModel"]);
    } else {
      return null;
    }
  }

  Future<bool> updateWallet(int points) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
      "Marketing_points": points,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/UpdateMainPockectV1", body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<WalletDetailsModel>> getWalletDetails(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/DetailsWalletV1", body: body);
    if (_data != null) {
      return List<WalletDetailsModel>.from(
          _data["data"].map((e) => WalletDetailsModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> shareWalletPoint(String type, double package) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "user_id": userId,
      "type": type,
      "package": package,
      "lang": lang
    };
    var _data = await DioHelper(context: context).post(
      url: "/Plans/SetMainPockect",
      body: body,
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<CompFilterReconciliationModel?> getReconciliation() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/Getfiltering", body: body);
    if (_data != null) {
      return CompFilterReconciliationModel.fromJson(
          _data["data"]['kayan_data']);
    } else {
      return null;
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

  Future<bool> reconciliationBank(double cost, double point, String fullName,
      String fkBank, String iBAN) async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
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
        url: "/WalletUser/AddFilterRequestApi", body: body, showLoader: false);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<BarcodeModel?> getBarcode(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "user_id": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/BarCode", body: body);
    if (_data != null) {
      return BarcodeModel.fromJson(_data["data"]["barcode"]);
    } else {
      return null;
    }
  }

  Future<bool> updateCompanyData(UpdateCompanyProfileModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
      url: '/Account/UpdateKayanApi',
      body: model.toJson(),
      showLoader: false,
      // showMsg: false
    );
    if (_data != null) {
      UserModel user = context.read<UserCubit>().state.model;
      user.companyModel =
          CompanyModel.fromJson(_data['data']["kyanApiViewModel"]);
      user.deviceId = GlobalState.instance.get("token");
      await Utils.saveUserData(user);
      context.read<UserCubit>().onUpdateUserData(user);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeImage(int id, int type) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "id": id,
      "TypeImg": type,
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context)
        .post(url: '/Account/RemoveImagesV1', body: body);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendBrochureData(SendBrochureModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
      url: '/Plans/AddNewCard',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<DropDownSelected>> getPeopleInterests(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/Getinterests", body: body);
    if (_data != null) {
      var data = List<DropDownSelected>.from(
          _data["data"]["interests"].map((e) => DropDownSelected.fromJson(e)));
      data.insert(0, DropDownSelected(id: 0, name: "????????", selected: false));
      return data;
    } else {
      return [];
    }
  }

  Future<List<BranchModel>> getBranches(bool refresh, String userId) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {
      "lang": lang,
      "user_id": userId,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/GetBranch", body: body);
    if (_data != null) {
      return List<BranchModel>.from(
          _data['branch_Kayans'].map((e) => BranchModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<BranchModel?> addBranch(AddBranchModel model) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    model.userId = userId;
    model.lang = lang;
    var _data = await DioHelper(context: context).post(
      url: '/Plans/UpdateBranch',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      return BranchModel.fromJson(_data["data"]);
    } else {
      return null;
    }
  }

  Future<bool> removeBranch(int id) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Map<String, dynamic> body = {
      "lang": lang,
      "id": id,
    };
    var _data = await DioHelper(context: context).post(
      url: '/Plans/RemoveBranch',
      body: body,
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }
}
