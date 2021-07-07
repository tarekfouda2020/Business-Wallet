import 'dart:io';

import 'package:base_flutter/company/models/barcode_model.dart';
import 'package:base_flutter/company/models/branch_model.dart';
import 'package:base_flutter/company/models/brochure_details_model.dart';
import 'package:base_flutter/company/models/business_ads_details_model.dart';
import 'package:base_flutter/company/models/comp_fav_details_model.dart';
import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_filter_reconciliation_model.dart';
import 'package:base_flutter/company/models/comp_interest_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/company/models/comp_statistics_details_model.dart';
import 'package:base_flutter/company/models/comp_wallet_model.dart';
import 'package:base_flutter/company/models/cost_subscribe_model.dart';
import 'package:base_flutter/company/models/dots/AddBrochureSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddOpinionSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddSpecialSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/AddBranchModel.dart';
import 'package:base_flutter/company/models/dots/AddSubscribeModel.dart';
import 'package:base_flutter/company/models/dots/SendBrochureModel.dart';
import 'package:base_flutter/company/models/dots/UpdateCompanyProfile.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/models/extra_cost_model.dart';
import 'package:base_flutter/company/models/packages_model.dart';
import 'package:base_flutter/company/models/product_ads_details_model.dart';
import 'package:base_flutter/company/models/specific_ads_details_model.dart';
import 'package:base_flutter/company/resources/CompanyDetailsMethods.dart';
import 'package:base_flutter/company/resources/CompanyHomeMethods.dart';
import 'package:base_flutter/company/resources/CompanyHttpMethods.dart';
import 'package:base_flutter/company/resources/CompanyStatisticsMethods.dart';
import 'package:base_flutter/company/resources/CompanySubscribeMethods.dart';
import 'package:base_flutter/customer/models/Dtos/MapFilterModel.dart';
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
  late CompanyHomeMethods _companyHomeMethods;
  late CompanyDetailsMethods _companyDetailsMethods;
  late CompanySubscribeMethods _companySubscribeMethods;
  late CompanyStatisticsMethods _companyStatisticsMethods;

  CompanyRepository(BuildContext context) {
    _context = context;
    _companyHttpMethods = new CompanyHttpMethods(_context);
    _companyHomeMethods = new CompanyHomeMethods(_context);
    _companyDetailsMethods = new CompanyDetailsMethods(_context);
    _companySubscribeMethods = new CompanySubscribeMethods(_context);
    _companyStatisticsMethods = new CompanyStatisticsMethods(_context);
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

  Future<List<MainModel>> getMain(int pageIndex, int cityId, int interestId,
          int filterId, bool refresh) =>
      _companyHomeMethods.getMain(
          pageIndex, cityId, interestId, filterId, refresh);

  Future<List<AutoSearchModel>> getAutoSearch(String word) =>
      _companyHomeMethods.getAutoSearch(word);

  Future<List<MainModel>> getMapProviders(MapFilterModel model) =>
      _companyHomeMethods.getMapProviders(model);

  Future<List<MainModel>> getMainSearch(int pageIndex, int searchId,
          int fieldId, String text, bool refresh) =>
      _companyHomeMethods.getMainSearch(
          pageIndex, searchId, fieldId, text, refresh);

  Future<List<FollowerModel>> getFollowersFiltered(int pageIndex, int cityId,
          int interestId, int filterId, bool refresh) =>
      _companyHomeMethods.getFollowersFiltered(
          pageIndex, cityId, interestId, filterId, refresh);

  Future<List<CompFavoriteModel>> getFavoriteData(
          int pageIndex, int fkCity, fkInterest, bool refresh) =>
      _companyHomeMethods.getFavoriteData(
          pageIndex, fkCity, fkInterest, refresh);

  Future<List<CompInvitationModel>> getInvitationData(
          int pageIndex, bool refresh) =>
      _companyHomeMethods.getInvitationData(pageIndex, refresh);

  Future<MainDetailsModel?> getMainDetails(String id, bool refresh) =>
      _companyDetailsMethods.getMainDetails(id, refresh);

  Future<bool> addLike(String kayanId) =>
      _companyDetailsMethods.addLike(kayanId);

  Future<bool> addFollow(String kayanId) =>
      _companyDetailsMethods.addFollow(kayanId);

  Future<bool> sendBrochure(String kayanId) =>
      _companyDetailsMethods.sendBrochure(kayanId);

  Future<bool> addRate(int rate, String kayanId) =>
      _companyDetailsMethods.addRate(rate, kayanId);

  Future<bool> addComment(String kayanId, String msg, File? image) =>
      _companyDetailsMethods.addComment(kayanId, msg, image);

  Future<bool> deleteComment(int commentId) =>
      _companyDetailsMethods.deleteComment(commentId);

  Future<bool> editComment(int commentId, String msg) =>
      _companyDetailsMethods.editComment(commentId, msg);

  Future<bool> reportComment(int commentId, String kayanId, String msg) =>
      _companyDetailsMethods.reportComment(commentId, kayanId, msg);

  Future<CompFavDetailsModel?> getAds(
          int adsId, int sendCard, int showSendCard, bool refresh) =>
      _companyDetailsMethods.getAds(adsId, sendCard, showSendCard, refresh);

  Future<bool> updateAds(int adsId, int showSend) =>
      _companyDetailsMethods.updateAds(adsId, showSend);

  Future<bool> getAdsPoint(
          String type, int points, int adsId, String adsType) =>
      _companyDetailsMethods.getAdsPoint(type, points, adsId, adsType);

  Future<bool> likeAds(int announcementId, String type) =>
      _companyDetailsMethods.likeAds(announcementId, type);

  Future<bool> followAds(String kayanId) =>
      _companyDetailsMethods.followAds(kayanId);

  Future<List<CompInterestModel>> getInterest(bool refresh) =>
      _companyHttpMethods.getInterest(refresh);

  Future<bool> saveInterest(String items) =>
      _companyHttpMethods.saveInterest(items);

  Future<List<ProfileCommentsModel>> getProfileComments(bool refresh) =>
      _companyHttpMethods.getProfileComments(refresh);

  Future<bool> rateProfileComment(int rate, String kayanId) =>
      _companyHttpMethods.rateProfileComment(rate, kayanId);

  Future<List<ConversationModel>> getConversation(bool refresh) =>
      _companyHttpMethods.getConversation(refresh);

  Future<String?> promoCode(bool refresh) =>
      _companyHttpMethods.promoCode(refresh);

  Future<CompWalletModel?> getWalletData(bool refresh) =>
      _companyHttpMethods.getWalletData(refresh);

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

  Future<CompStatisticsDetailsModel?> getStatistics(bool refresh) =>
      _companyStatisticsMethods.getStatistics(refresh);

  Future<BarcodeModel?> getBarcode(bool refresh) =>
      _companyHttpMethods.getBarcode(refresh);

  Future<bool> updateCompanyData(UpdateCompanyProfileModel model) async =>
      _companyHttpMethods.updateCompanyData(model);

  Future<bool> removeImage(int id, int type) =>
      _companyHttpMethods.removeImage(id, type);

  Future<bool> sendBrochureData(SendBrochureModel model) async =>
      _companyHttpMethods.sendBrochureData(model);

  Future<SpecificAdsModel?> getSpecificAds(int adsId, bool refresh) =>
      _companyStatisticsMethods.getSpecificAds(adsId, refresh);

  Future<bool> likeSpecificAds(int announcementId, String type) =>
      _companyStatisticsMethods.likeSpecificAds(announcementId, type);

  Future<bool> specificAdsRate(int adsId, int rate, String type) =>
      _companyStatisticsMethods.specificAdsRate(adsId, rate, type);

  Future<bool> specificAdsComment(
          int adsId, String msg, File? image, String type) =>
      _companyStatisticsMethods.specificAdsComment(adsId, msg, image, type);

  Future<InvestmentAdsModel?> getInvestmentAds(int adsId, bool refresh) =>
      _companyStatisticsMethods.getInvestmentAds(adsId, refresh);

  Future<List<PackagesModel>> getAllPackages(bool refresh) =>
      _companySubscribeMethods.getAllPackages(refresh);

  Future<CostSubscribeModel?> getCostSubscribe(
          int countView, int countImage, int countVideo, int time) =>
      _companySubscribeMethods.getCostSubscribe(
          countView, countImage, countVideo, time);

  Future<ExtraCostModel?> getExtraCostSubscribe(int cost, int price) =>
      _companySubscribeMethods.getExtraCostSubscribe(cost, price);

  Future<List<DropDownSelected>> getPeopleInterests({bool refresh = true}) =>
      _companyHttpMethods.getPeopleInterests(refresh);

  Future<double?> finalCost(double baseCost) =>
      _companySubscribeMethods.finalCost(baseCost);

  Future<String?> saveSpecificPdf(int id) async =>
      _companyStatisticsMethods.saveSpecificPdf(id);

  Future<String?> saveProductPdf(int id) async =>
      _companyStatisticsMethods.saveProductPdf(id);

  Future<String?> saveBusinessPdf(int id) async =>
      _companyStatisticsMethods.saveBusinessPdf(id);

  Future<String?> saveMainPdf(int id) async =>
      _companyStatisticsMethods.saveMainPdf(id);

  Future<SpecificAdsDetailsModel?> getSpecificAdsDetails(
          int id, bool refresh) =>
      _companyStatisticsMethods.getSpecificAdsDetails(id, refresh);

  Future<ProductAdsDetailsModel?> getProductAdsDetails(int id, bool refresh) =>
      _companyStatisticsMethods.getProductAdsDetails(id, refresh);

  Future<BusinessAdsDetailsModel?> getBusinessAdsDetails(
          int id, bool refresh) =>
      _companyStatisticsMethods.getBusinessAdsDetails(id, refresh);

  Future<BusinessAdsDetailsModel?> getMainAdsDetails(int id, bool refresh) =>
      _companyStatisticsMethods.getMainAdsDetails(id, refresh);

  Future<BrochureDetailsModel?> getBrochureDetails() =>
      _companySubscribeMethods.getBrochureDetails();

  Future<CostSubscribeModel?> getCostBrochureSubscribe(int brochureNum) =>
      _companySubscribeMethods.getCostBrochureSubscribe(brochureNum);

  Future<CostSubscribeModel?> getOpinionSubscribeCost(
          int countView, int countImage, int countVideo, int countQuestion) =>
      _companySubscribeMethods.getOpinionSubscribeCost(
          countView, countImage, countVideo, countQuestion);

  Future<ExtraCostModel?> getExtraBrochureCost(int cost, int price) =>
      _companySubscribeMethods.getExtraBrochureCost(cost, price);

  Future<int?> addSubscribe(AddSubscribeModel model) async =>
      _companySubscribeMethods.addSubscribe(model);

  Future<int?> addSpecialSubscribe(AddSpecialSubscribeModel model) async =>
      _companySubscribeMethods.addSpecialSubscribe(model);

  Future<int?> addOpinionSubscribe(AddOpinionSubscribeModel model) async =>
      _companySubscribeMethods.addOpinionSubscribe(model);

  Future<bool> addBrochureSubscribe(AddBrochureSubscribeModel model) async =>
      _companySubscribeMethods.addBrochureSubscribe(model);

  Future<List<BranchModel>> getBranches(bool refresh,String userId) =>
      _companyHttpMethods.getBranches(refresh,userId);

  Future<BranchModel?> addBranch(AddBranchModel model) =>
      _companyHttpMethods.addBranch(model);

  Future<bool> removeBranch(int id) => _companyHttpMethods.removeBranch(id);
}
