import 'dart:io';

import 'package:base_flutter/customer/models/Dtos/MapFilterModel.dart';
import 'package:base_flutter/customer/models/Dtos/UpdateCustomerModel.dart';
import 'package:base_flutter/customer/models/Dtos/drop_down_model.dart';
import 'package:base_flutter/customer/models/Dtos/field_drop_down_model.dart';
import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/MessageModel.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/conversation_model.dart';
import 'package:base_flutter/customer/models/favorite_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/invitation_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/reconciliation_data_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
import 'package:base_flutter/customer/models/wallet_details_model.dart';
import 'package:base_flutter/customer/models/wallet_model.dart';
import 'package:base_flutter/customer/resources/CustomerDetailsMethods.dart';
import 'package:base_flutter/customer/resources/CustomerHomeMethods.dart';
import 'package:base_flutter/customer/resources/CustomerHttpMethods.dart';
import 'package:flutter/material.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerHttpMethods _customerHttpMethods;
  late CustomerHomeMethods _customerHomeMethods;
  late CustomerDetailsMethods _customerDetailsMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = new CustomerHttpMethods(_context);
    _customerHomeMethods = new CustomerHomeMethods(_context);

    _customerDetailsMethods = new CustomerDetailsMethods(_context);
  }

  Future<bool> userRegister(RegisterModel model) =>
      _customerHttpMethods.userRegister(model);

  Future<List<CitiesModel>> getCities(int countryId) =>
      _customerHttpMethods.getCities(countryId);

  Future<List<DropDownModel>> getBank() => _customerHttpMethods.getBank();

  Future<List<FieldDropDownModel>> getFields() =>
      _customerHttpMethods.getFields();

  Future<List<UserInterestModel>> getInterest(String userId) =>
      _customerHttpMethods.getInterest(userId);

  Future<bool> saveInterest(String items, String userId) =>
      _customerHttpMethods.saveInterest(items, userId);

  Future<List<AutoSearchModel>> getAutoSearch(String word) =>
      _customerHomeMethods.getAutoSearch(word);

  Future<List<MainModel>> getMainFiltered(int pageIndex, int cityId,
          int interestId, int filterId, bool refresh) =>
      _customerHomeMethods.getMainFiltered(
          pageIndex, cityId, interestId, filterId, refresh);

  Future<List<MainModel>> getMapProviders(MapFilterModel model) =>
      _customerHomeMethods.getMapProviders(model);

  Future<List<MainModel>> getMainSearched(int pageIndex, int searchId,
          int fieldId, String text, bool refresh) =>
      _customerHomeMethods.getMainSearched(
          pageIndex, searchId, fieldId, text, refresh);

  Future<MainDetailsModel?> getMainDetails(String id, bool refresh) =>
      _customerDetailsMethods.getMainDetails(id, refresh);

  Future<List<FollowerModel>> getFollowersFiltered(int pageIndex, int cityId,
          int interestId, int filterId, bool refresh) =>
      _customerHomeMethods.getFollowersFiltered(
          pageIndex, cityId, interestId, filterId, refresh);

  Future<bool> addLike(String kayanId) =>
      _customerDetailsMethods.addLike(kayanId);

  Future<bool> addFollow(String kayanId) =>
      _customerDetailsMethods.addFollow(kayanId);

  Future<bool> addRate(int rate, String kayanId) =>
      _customerDetailsMethods.addRate(rate, kayanId);

  Future<bool> addComment(String kayanId, String msg, File? image) =>
      _customerDetailsMethods.addComment(kayanId, msg, image);

  Future<bool> deleteComment(int commentId) =>
      _customerDetailsMethods.deleteComment(commentId);

  Future<bool> editComment(int commentId, String msg) =>
      _customerDetailsMethods.editComment(commentId, msg);

  Future<bool> reportComment(int commentId, String kayanId, String msg) =>
      _customerDetailsMethods.reportComment(commentId, kayanId, msg);

  Future<List<FavoriteModel>> getFavoriteData(
          int pageIndex, int fkCity, fkInterest, String rate, bool refresh) =>
      _customerHomeMethods.getFavoriteData(
          pageIndex, fkCity, fkInterest, rate, refresh);

  Future<List<InvitationModel>> getInvitationData(int pageIndex, int fkCity,
          int fkInterest, String rate, bool refresh) =>
      _customerHomeMethods.getInvitationData(
          pageIndex, fkCity, fkInterest, rate, refresh);

  Future<SpecificAdsModel?> getSpecificAds(int adsId, bool refresh) =>
      _customerDetailsMethods.getSpecificAds(adsId, refresh);

  Future<bool> updateSpecificAds(int adsId) =>
      _customerDetailsMethods.updateSpecificAds(adsId);

  Future<bool> getSpecificAdsPoint(
          String type, int points, int adsId, String adsType) =>
      _customerDetailsMethods.getSpecificAdsPoint(type, points, adsId, adsType);

  Future<bool> likeSpecificAds(int announcementId, String type) =>
      _customerDetailsMethods.likeSpecificAds(announcementId, type);

  Future<bool> specificAdsRate(int adsId, int rate, String type) =>
      _customerDetailsMethods.specificAdsRate(adsId, rate, type);

  Future<bool> specificAdsComment(
          int adsId, String msg, File? image, String type) =>
      _customerDetailsMethods.specificAdsComment(adsId, msg, image, type);

  Future<InvestmentAdsModel?> getInvestmentAds(int adsId, bool refresh) =>
      _customerDetailsMethods.getInvestmentAds(adsId, refresh);

  Future<bool> updateInvestmentAds(int adsId) =>
      _customerDetailsMethods.updateInvestmentAds(adsId);

  Future<bool> answerQuestion(String answers, int fkAds) =>
      _customerDetailsMethods.answerQuestion(answers, fkAds);

  Future<String?> promoCode(bool refresh) =>
      _customerHttpMethods.promoCode(refresh);

  Future<List<ProfileCommentsModel>> getProfileComments(bool refresh) =>
      _customerHttpMethods.getProfileComments(refresh);

  Future<bool> rateProfileComment(int rate, String kayanId) =>
      _customerHttpMethods.rateProfileComment(rate, kayanId);

  Future<WalletModel?> getWalletData(bool refresh) =>
      _customerHttpMethods.getWalletData(refresh);

  Future<bool> shareWalletPoint(int costMoney, int point, String code) =>
      _customerHttpMethods.shareWalletPoint(costMoney, point, code);

  Future<bool> updateCustomerData(UpdateCustomerModel model) async =>
      _customerHttpMethods.updateCustomerData(model);

  Future<bool> changePassword(
          String oldPassword, String newPassword, String userId) async =>
      _customerHttpMethods.changePassword(oldPassword, newPassword, userId);

  Future<String?> walletHelp(bool refresh) =>
      _customerHttpMethods.walletHelp(refresh);

  Future<List<WalletDetailsModel>> getWalletDetails(bool refresh) =>
      _customerHttpMethods.getWalletDetails(refresh);

  Future<ReconciliationDataModel?> getReconciliation(
          double cost, double costMun, bool refresh) =>
      _customerHttpMethods.getReconciliation(cost, costMun, refresh);

  Future<bool> reconciliationBank(double cost, double point, String fullName,
          String fkBank, String iBAN) =>
      _customerHttpMethods.reconciliationBank(
          cost, point, fullName, fkBank, iBAN);

  Future<List<ConversationModel>> getConversation(bool refresh) =>
      _customerHttpMethods.getConversation(refresh);

  Future<List<MessageModel>> getChatMessages(String sender , String receiver, int pageNumber) =>
      _customerHttpMethods.getChatMessages(sender,receiver,pageNumber);

  Future<bool> sendMessage(String sender, String receiver, String msg) =>
      _customerHttpMethods.sendMessage(sender, receiver, msg);
}
