import 'dart:io';

import 'package:base_flutter/company/models/barcode_model.dart';
import 'package:base_flutter/company/models/comp_fav_details_model.dart';
import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_filter_reconciliation_model.dart';
import 'package:base_flutter/company/models/comp_interest_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/company/models/comp_statistics_details_model.dart';
import 'package:base_flutter/company/models/comp_wallet_model.dart';
import 'package:base_flutter/company/models/dots/AddSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/SendBrochureModel.dart';
import 'package:base_flutter/company/models/dots/UpdateCompanyProfile.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/resources/CompanyHttpMethods.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/conversation_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/customer/models/wallet_details_model.dart';

import 'package:flutter/material.dart';

class CompanyRepository {
  late BuildContext _context;
  late CompanyHttpMethods _companyHttpMethods;

  CompanyRepository(BuildContext context) {
    _context = context;
    _companyHttpMethods = new CompanyHttpMethods(_context);
  }

  Future<bool> compRegister(CompRegisterModel model) =>
      _companyHttpMethods.compRegister(model);

  Future<List<CitiesModel>> getCompCities(int countryId) =>
      _companyHttpMethods.getCompCities(countryId);

  Future<bool> checkCommercial(String commercial, String userId) =>
      _companyHttpMethods.checkCommercial(commercial, userId);

  Future<bool> completeRegister(String commercial, String userId) =>
      _companyHttpMethods.completeRegister(commercial, userId);

  Future<List<DropDownModel>> getMainField({bool refresh = true}) =>
      _companyHttpMethods.getMainField(refresh);

  Future<List<DropDownSelected>> getSubField(int fkMain,
          {bool refresh = true}) =>
      _companyHttpMethods.getSubField(fkMain, refresh);

  Future<bool> saveField(String fkMain, String fkSub, String userId) =>
      _companyHttpMethods.saveField(fkMain, fkSub, userId);

  Future<List<MainModel>> getMain(
          int pageIndex, int cityId, int interestId, int filterId) =>
      _companyHttpMethods.getMain(pageIndex, cityId, interestId, filterId);

  Future<List<AutoSearchModel>> getAutoSearch(String word) =>
      _companyHttpMethods.getAutoSearch(word);

  Future<List<MainModel>> getMainSearch(
          int pageIndex, int searchId, int fieldId, String text) =>
      _companyHttpMethods.getMainSearch(pageIndex, searchId, fieldId, text);

  Future<List<FollowerModel>> getFollowersFiltered(
          int pageIndex, int cityId, int interestId, int filterId) =>
      _companyHttpMethods.getFollowersFiltered(
          pageIndex, cityId, interestId, filterId);

  Future<List<CompFavoriteModel>> getFavoriteData(
          int pageIndex, int fkCity, fkInterest) =>
      _companyHttpMethods.getFavoriteData(pageIndex, fkCity, fkInterest);

  Future<List<CompInvitationModel>> getInvitationData(int pageIndex) =>
      _companyHttpMethods.getInvitationData(pageIndex);

  Future<MainDetailsModel?> getMainDetails(String id) =>
      _companyHttpMethods.getMainDetails(id);

  Future<bool> addLike(String kayanId) => _companyHttpMethods.addLike(kayanId);

  Future<bool> addFollow(String kayanId) =>
      _companyHttpMethods.addFollow(kayanId);

  Future<bool> sendBrochure(String kayanId) =>
      _companyHttpMethods.sendBrochure(kayanId);

  Future<bool> addRate(int rate, String kayanId) =>
      _companyHttpMethods.addRate(rate, kayanId);

  Future<bool> addComment(String kayanId, String msg, File? image) =>
      _companyHttpMethods.addComment(kayanId, msg, image);

  Future<bool> deleteComment(int commentId) =>
      _companyHttpMethods.deleteComment(commentId);

  Future<bool> editComment(int commentId, String msg) =>
      _companyHttpMethods.editComment(commentId, msg);

  Future<bool> reportComment(int commentId, String kayanId, String msg) =>
      _companyHttpMethods.reportComment(commentId, kayanId, msg);

  Future<CompFavDetailsModel?> getAds(
          int adsId, int sendCard, int showSendCard) =>
      _companyHttpMethods.getAds(adsId, sendCard, showSendCard);

  Future<bool> updateAds(int adsId, int showSend) =>
      _companyHttpMethods.updateAds(adsId, showSend);

  Future<bool> getAdsPoint(
          String type, int points, int adsId, String adsType) =>
      _companyHttpMethods.getAdsPoint(type, points, adsId, adsType);

  Future<bool> likeAds(int announcementId, String type) =>
      _companyHttpMethods.likeAds(announcementId, type);

  Future<bool> followAds(String kayanId) =>
      _companyHttpMethods.followAds(kayanId);

  Future<List<CompInterestModel>> getInterest() =>
      _companyHttpMethods.getInterest();

  Future<bool> saveInterest(String items) =>
      _companyHttpMethods.saveInterest(items);

  Future<List<ProfileCommentsModel>> getProfileComments() =>
      _companyHttpMethods.getProfileComments();

  Future<bool> rateProfileComment(int rate, String kayanId) =>
      _companyHttpMethods.rateProfileComment(rate, kayanId);

  Future<List<ConversationModel>> getConversation() =>
      _companyHttpMethods.getConversation();

  Future<String?> promoCode() => _companyHttpMethods.promoCode();

  Future<CompWalletModel?> getWalletData() =>
      _companyHttpMethods.getWalletData();

  Future<bool> updateWallet(int points) =>
      _companyHttpMethods.updateWallet(points);

  Future<List<WalletDetailsModel>> getWalletDetails() =>
      _companyHttpMethods.getWalletDetails();

  Future<bool> shareWalletPoint(String type, double package) =>
      _companyHttpMethods.shareWalletPoint(type, package);

  Future<CompFilterReconciliationModel?> getReconciliation() =>
      _companyHttpMethods.getReconciliation();

  Future<List<DropDownModel>> getBank() => _companyHttpMethods.getBank();

  Future<bool> reconciliationBank(double cost, double point, String fullName,
          String fkBank, String iBAN) =>
      _companyHttpMethods.reconciliationBank(
          cost, point, fullName, fkBank, iBAN);

  Future<CompStatisticsDetailsModel?> getStatistics() =>
      _companyHttpMethods.getStatistics();

  Future<BarcodeModel?> getBarcode() => _companyHttpMethods.getBarcode();

  Future<bool> updateCompanyData(UpdateCompanyProfileModel model) async =>
      _companyHttpMethods.updateCompanyData(model);

  Future<bool> removeImage(int id, int type) =>
      _companyHttpMethods.removeImage(id, type);

  Future<bool> sendBrochureData(SendBrochureModel model) async =>
      _companyHttpMethods.sendBrochureData(model);

  Future<bool> addSubscribe(AddSubscribeModel model) async =>
      _companyHttpMethods.addSubscribe(model);

  Future<SpecificAdsModel?> getSpecificAds(int adsId) =>
      _companyHttpMethods.getSpecificAds(adsId);

  Future<bool> updateSpecificAds(int adsId) =>
      _companyHttpMethods.updateSpecificAds(adsId);

  Future<bool> getSpecificAdsPoint(
          String type, int points, int adsId, String adsType) =>
      _companyHttpMethods.getSpecificAdsPoint(type, points, adsId, adsType);

  Future<bool> likeSpecificAds(int announcementId, String type) =>
      _companyHttpMethods.likeSpecificAds(announcementId, type);

  Future<bool> specificAdsRate(int adsId, int rate, String type) =>
      _companyHttpMethods.specificAdsRate(adsId, rate, type);


  Future<bool> specificAdsComment(
      int adsId, String msg, File? image, String type) =>
      _companyHttpMethods.specificAdsComment(adsId, msg, image, type);

  Future<InvestmentAdsModel?> getInvestmentAds(int adsId) =>
      _companyHttpMethods.getInvestmentAds(adsId);

}
