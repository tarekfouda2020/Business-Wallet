import 'dart:io';

import 'package:base_flutter/company/models/comp_favorite_model.dart';
import 'package:base_flutter/company/models/comp_invitation_model.dart';
import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/resources/CompanyHttpMethods.dart';
import 'package:base_flutter/customer/models/auto_search_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/follower_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';

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


}
