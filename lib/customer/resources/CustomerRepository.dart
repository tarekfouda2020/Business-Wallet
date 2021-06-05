import 'package:base_flutter/customer/models/Dtos/register_model.dart';
import 'package:base_flutter/customer/models/cities_model.dart';
import 'package:base_flutter/customer/models/main_details_model.dart';
import 'package:base_flutter/customer/models/main_model.dart';
import 'package:base_flutter/customer/models/user_interest_model.dart';
import 'package:base_flutter/customer/resources/CustomerHttpMethods.dart';
import 'package:flutter/material.dart';

class CustomerRepository {
  late BuildContext _context;
  late CustomerHttpMethods _customerHttpMethods;

  CustomerRepository(BuildContext context) {
    _context = context;
    _customerHttpMethods = new CustomerHttpMethods(_context);
  }

  Future<List<CitiesModel>> getCities(int countryId) =>
      _customerHttpMethods.getCities(countryId);

  Future<bool> userRegister(RegisterModel model) =>
      _customerHttpMethods.userRegister(model);

  Future<List<UserInterestModel>> getInterest() =>
      _customerHttpMethods.getInterest();

  Future<bool> saveInterest(String items) =>
      _customerHttpMethods.saveInterest(items);

  Future<List<MainModel>> getMainData(int pageIndex) =>
      _customerHttpMethods.getMainData(pageIndex);

  Future<MainDetailsModel?> getMainDetails(String id) =>
      _customerHttpMethods.getMainDetails(id);

  Future<List<MainModel>> getFollowersData(int pageIndex) =>
      _customerHttpMethods.getFollowersData(pageIndex);
}