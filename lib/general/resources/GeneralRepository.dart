import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/models/intro_model.dart';
import 'package:base_flutter/general/models/user_model.dart';
import 'package:flutter/material.dart';

import 'GeneralHttpMethods.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;

  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<bool> setUserLogin(String phone, String pass) =>
      _generalHttpMethods.userLogin(phone, pass);

  Future<IntroModel?> getIntro({bool refresh = true}) =>
      _generalHttpMethods.getIntro(refresh: refresh);

  Future<bool> sendCode(String code, String userId) =>
      _generalHttpMethods.sendCode(code, userId);

  Future<bool> compSendCode(String code, String userId) =>
      _generalHttpMethods.compSendCode(code, userId);

  Future<bool> resendCode(String userId) =>
      _generalHttpMethods.resendCode(userId);

  Future<bool> compResendCode(String userId) =>
      _generalHttpMethods.compResendCode(userId);

  Future<String?> aboutApp() => _generalHttpMethods.aboutApp();

  Future<String?> terms() => _generalHttpMethods.terms();

  Future<bool> switchNotify() => _generalHttpMethods.switchNotify();

  Future<bool> forgetPasswordByPhone(String phone) =>
      _generalHttpMethods.forgetPasswordByPhone(phone);

  Future<bool> forgetPasswordByEmail(String email) =>
      _generalHttpMethods.forgetPasswordByEmail(email);

  Future<bool> forgetPasswordCode(String phone, String code) =>
      _generalHttpMethods.forgetPasswordCode(phone, code);

  Future<bool> resetUserPassword(String userId, String newPassword) =>
      _generalHttpMethods.resetUserPassword(userId, newPassword);

  Future<List<QuestionModel>> frequentQuestions() =>
      _generalHttpMethods.frequentQuestions();

  Future<bool> sendMessage({String? name, String? mail, String? message}) =>
      _generalHttpMethods.sendMessage(name, mail, message);

  Future<UserModel?> checkActive(String phone) =>
      _generalHttpMethods.checkActive(phone);

  Future<void> customerLogout() => _generalHttpMethods.customerLogout();

  Future<void> companyLogout() => _generalHttpMethods.companyLogout();
}
