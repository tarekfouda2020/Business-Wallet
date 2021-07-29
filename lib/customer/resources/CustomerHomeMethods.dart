import 'package:base_flutter/customer/blocs/Invist_count_cubit/invist_count_cubit.dart';
import 'package:base_flutter/customer/blocs/follow_count_cubit/follow_count_cubit.dart';
import 'package:base_flutter/customer/blocs/wallet_count_cubit/wallet_count_cubit.dart';
import 'package:base_flutter/customer/models/Dtos/FilterModel.dart';
import 'package:base_flutter/customer/models/Dtos/MapFilterModel.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/favorite_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/invitation_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/utilities/dio_helper/DioImports.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHomeMethods {
  final BuildContext context;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  CustomerHomeMethods(this.context);

  Future<List<FavoriteModel>> getFavoriteData(
      int pageIndex, int fkCity, fkInterest, String rate, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "fk_city": fkCity,
      "fk_intrest": fkInterest,
      "Rate": rate,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/User/WishlistApi", body: body);
    if (_data != null) {
      return List<FavoriteModel>.from(
          _data['data']["MyWishlist1"].map((e) => FavoriteModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<FollowerModel>> getFollowersFiltered(int pageIndex, int cityId,
      int interestId, int filterId, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "CityId": cityId,
      "interestId": interestId,
      "RateId": filterId,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/User/MyFollowApiV1", body: body);
    if (_data != null) {
      context.read<FollowCountCubit>().onUpdateCount(0);
      return List<FollowerModel>.from(
          _data['follows'].map((e) => FollowerModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<InvitationModel>> getInvitationData(
      int pageIndex, int fkCity, fkInterest, String rate, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "fk_city": fkCity,
      "fk_intrest": fkInterest,
      "Rate": rate,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/User/IndexInvetionsApiV1", body: body);
    if (_data != null) {
      context.read<InvistCountCubit>().onUpdateCount(0);
      return List<InvitationModel>.from(
          _data['data']["allProducts"].map((e) => InvitationModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMainFiltered(int pageIndex, int cityId,
      int interestId, int filterId, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "city_id": cityId,
      "interests": interestId,
      "top_rate": filterId,
      "page_index": pageIndex
    };
    var _data = await DioHelper(context: context, forceRefresh: refresh)
        .get(url: "/User/IndexApiV1", body: body);
    if (_data != null) {
      context
          .read<FollowCountCubit>()
          .onUpdateCount(_data["followNotify"] ?? 0);
      context
          .read<InvistCountCubit>()
          .onUpdateCount(_data["invetionNotify"] ?? 0);
      context
          .read<WalletCountCubit>()
          .onUpdateCount(_data["walletNotify"] ?? 0);
      return List<MainModel>.from(
          _data['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<MainModel>> getMapProviders(MapFilterModel model) async {
    var _data = await DioHelper(
      context: context,
    ).get(
      url: "/User/IndexAndSearchApi",
      body: model.toJson(),
      showLoader: true
    );
    if (_data != null) {
      return List<MainModel>.from(
          _data['Kayans'].map((e) => MainModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<AutoSearchModel>> getAutoSearch(String word) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;

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

  Future<List<MainModel>> getMainSearched(int pageIndex, int searchId,
      int fieldId, int subFieldId, String text, bool refresh) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;

    Map<String, dynamic> body = {
      "lang": lang,
      "userId": userId,
      "SearchId": searchId,
      "id": fieldId,
      "subFieldId": subFieldId,
      "text": text,
      "page_index": pageIndex
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
}
