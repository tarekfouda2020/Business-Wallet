import 'package:base_flutter/company/models/brochure_details_model.dart';
import 'package:base_flutter/company/models/cost_subscribe_model.dart';
import 'package:base_flutter/company/models/dots/AddBrochureSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddOpinionSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddSpecialSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddSubscribeModel.dart';
import 'package:base_flutter/company/models/extra_cost_model.dart';
import 'package:base_flutter/company/models/packages_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanySubscribeMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CompanySubscribeMethods(this.context);

  Future<List<PackagesModel>> getAllPackages(bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "lang": lang,
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/Plans/GetAllPackages", body: body);
    if (_data != null) {
      return List<PackagesModel>.from(
          _data['packages'].map((e) => PackagesModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<CostSubscribeModel?> getCostSubscribe(
      int countView, int countImage, int countVideo, int time) async {
    Map<String, dynamic> body = {
      "count_view": countView,
      "count_image": countImage,
      "count_video": countVideo,
      "time": time,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/CostAdvirtisment',
      body: body,
    );
    if (_data != null) {
      return CostSubscribeModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<ExtraCostModel?> getExtraCostSubscribe(int cost, int price) async {
    Map<String, dynamic> body = {
      "cost": cost,
      "price": price,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AddPriceAdvirtisment',
      body: body,
    );
    if (_data != null) {
      return ExtraCostModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<double?> finalCost(double baseCost) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"base_cost": baseCost, "lang": lang};
    var _data = await DioHelper(context: context)
        .get(url: "/Plans/AccountFinalCost", body: body);
    if (_data != null) {
      return _data["data"]['FinalCost'].toDouble();
    } else {
      return null;
    }
  }

  Future<CostSubscribeModel?> getOpinionSubscribeCost(
      int countView, int countImage, int countVideo, int countQuestion) async {
    Map<String, dynamic> body = {
      "count_view": countView,
      "count_image": countImage,
      "count_video": countVideo,
      "count_question": countQuestion,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/CostAdvirtismentEvelation',
      body: body,
    );
    if (_data != null) {
      return CostSubscribeModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<BrochureDetailsModel?> getBrochureDetails() async {
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    Map<String, dynamic> body = {"user_id": userId, "lang": lang};
    var _data = await DioHelper(context: context).get(
      url: '/Plans/GetDataCard',
      body: body,
    );
    if (_data != null) {
      return BrochureDetailsModel.fromJson(_data['data']['businesscardDB']);
    } else {
      return null;
    }
  }

  Future<CostSubscribeModel?> getCostBrochureSubscribe(int brochureNum) async {
    Map<String, dynamic> body = {
      "numbercard": brochureNum,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AccountBusinessCard',
      body: body,
    );
    if (_data != null) {
      return CostSubscribeModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<ExtraCostModel?> getExtraBrochureCost(int cost, int price) async {
    Map<String, dynamic> body = {
      "cost": cost,
      "price": price,
    };
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AccountNewCost',
      body: body,
    );
    if (_data != null) {
      return ExtraCostModel.fromJson(_data['data']['costs']);
    } else {
      return null;
    }
  }

  Future<int?> addSubscribe(AddSubscribeModel model) async {
    var _data = await DioHelper(context: context).post(
      url: '/Plans/Announcementsentspecificcategory',
      body: model.toJson(),
      showLoader: false,
    );
    if (_data != null) {
      return _data["ID"];
    } else {
      return null;
    }
  }

  Future<int?> addSpecialSubscribe(AddSpecialSubscribeModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
        url: '/Plans/MainPageAdvert', body: model.toJson(), showLoader: false);
    if (_data != null) {
      return _data["ID"];
    } else {
      return null;
    }
  }

  Future<int?> addOpinionSubscribe(AddOpinionSubscribeModel model) async {
    var _data = await DioHelper(context: context).uploadFile(
        url: '/Plans/AddAnnouncement_service_evaluation',
        body: model.toJson(),
        showLoader: false);
    if (_data != null) {
      return _data["ID"];
    } else {
      return null;
    }
  }

  Future<bool> addBrochureSubscribe(AddBrochureSubscribeModel model) async {
    var _data = await DioHelper(context: context).get(
      url: '/Plans/AddNewBusinessCard',
      body: model.toJson(),
    );
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeBrochureImage(int id) async {
    final String lang = context.read<LangCubit>().state.locale.languageCode;
    var _data = await DioHelper(context: context).post(
        url: '/Plans/RemoveBusiness_Card_Img',
        body: {"id": id, "lang": lang},
        showLoader: true);
    if (_data != null) {
      return true;
    } else {
      return false;
    }
  }
}
