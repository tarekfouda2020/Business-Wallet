import 'dart:io';

import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/favorite_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/investment_ads_model.dart';
import 'package:base_flutter/customer/models/invitation_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/profile_comments_model.dart';
import 'package:base_flutter/customer/models/specific_ads_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
import 'package:base_flutter/customer/models/wallet_model.dart';
import 'package:base_flutter/customer/resources/CustomerHttpMethods.dart';
import 'package:flutter/material.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerHttpMethods _customerHttpMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = new CustomerHttpMethods(_context);
  }

  Future<bool> userRegister(RegisterModel model) =>
      _customerHttpMethods.userRegister(model);

  Future<List<CitiesModel>> getCities(int countryId) =>
      _customerHttpMethods.getCities(countryId);

  Future<List<UserInterestModel>> getInterest() =>
      _customerHttpMethods.getInterest();

  Future<bool> saveInterest(String items) =>
      _customerHttpMethods.saveInterest(items);

  Future<List<MainModel>> getMainFiltered(
          int pageIndex, int cityId, int interestId, int filterId) =>
      _customerHttpMethods.getMainFiltered(
          pageIndex, cityId, interestId, filterId);

  Future<MainDetailsModel?> getMainDetails(String id) =>
      _customerHttpMethods.getMainDetails(id);

  Future<List<FollowerModel>> getFollowersData(int pageIndex) =>
      _customerHttpMethods.getFollowersData(pageIndex);

  Future<bool> addLike(String kayanId) => _customerHttpMethods.addLike(kayanId);

  Future<bool> addFollow(String kayanId) =>
      _customerHttpMethods.addFollow(kayanId);

  Future<bool> addRate(int rate, String kayanId) =>
      _customerHttpMethods.addRate(rate, kayanId);

  Future<bool> addComment(String kayanId, String msg, File? image) =>
      _customerHttpMethods.addComment(kayanId, msg, image);

  Future<bool> deleteComment(int commentId) =>
      _customerHttpMethods.deleteComment(commentId);

  Future<bool> editComment(int commentId, String msg) =>
      _customerHttpMethods.editComment(commentId, msg);

  Future<bool> reportComment(int commentId, String kayanId, String msg) =>
      _customerHttpMethods.reportComment(commentId, kayanId, msg);

  Future<List<FavoriteModel>> getFavoriteData(
          int pageIndex, int fkCity, fkInterest, String rate) =>
      _customerHttpMethods.getFavoriteData(pageIndex, fkCity, fkInterest, rate);

  Future<List<InvitationModel>> getInvitationData(
          int pageIndex, int fkCity, fkInterest, String rate) =>
      _customerHttpMethods.getInvitationData(
          pageIndex, fkCity, fkInterest, rate);

  Future<SpecificAdsModel?> getSpecificAds(int adsId) =>
      _customerHttpMethods.getSpecificAds(adsId);

  Future<bool> updateSpecificAds(int adsId) =>
      _customerHttpMethods.updateSpecificAds(adsId);

  Future<bool> getSpecificAdsPoint(
          String type, int points, int adsId, String adsType) =>
      _customerHttpMethods.getSpecificAdsPoint(type, points, adsId, adsType);

  Future<bool> likeSpecificAds(int announcementId, String type) =>
      _customerHttpMethods.likeSpecificAds(announcementId, type);

  Future<bool> specificAdsRate(int adsId, int rate, String type) =>
      _customerHttpMethods.specificAdsRate(adsId, rate, type);

  Future<bool> specificAdsComment(
          int adsId, String msg, File? image, String type) =>
      _customerHttpMethods.specificAdsComment(adsId, msg, image, type);

  Future<InvestmentAdsModel?> getInvestmentAds(int adsId) =>
      _customerHttpMethods.getInvestmentAds(adsId);

  Future<bool> updateInvestmentAds(int adsId) =>
      _customerHttpMethods.updateInvestmentAds(adsId);

  Future<bool> answerQuestion(String answers, int fkAds) =>
      _customerHttpMethods.answerQuestion(answers, fkAds);

  Future<String?> promoCode() => _customerHttpMethods.promoCode();

  Future<List<ProfileCommentsModel>> getProfileComments() =>
      _customerHttpMethods.getProfileComments();

  Future<bool> rateProfileComment(int rate, String kayanId) =>
      _customerHttpMethods.rateProfileComment(rate, kayanId);

  Future<WalletModel?> getWalletData() => _customerHttpMethods.getWalletData();

  Future<bool> shareWalletPoint(int costMoney, int point, String code) =>
      _customerHttpMethods.shareWalletPoint(costMoney, point, code);
}
