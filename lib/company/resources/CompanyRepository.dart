import 'package:base_flutter/company/models/dots/comp_register_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_model.dart';
import 'package:base_flutter/company/models/dots/drop_down_selected.dart';
import 'package:base_flutter/company/resources/CompanyHttpMethods.dart';
import 'package:base_flutter/customer/models/cities_model.dart';

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

  Future<List<DropDownSelected>> getSubField(int fkMain,{bool refresh = true}) =>
      _companyHttpMethods.getSubField(fkMain,refresh);

  Future<bool> saveField(String fkMain, String fkSub,String userId) =>
      _companyHttpMethods.saveField(fkMain, fkSub,userId);
}
