import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:flutter/material.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }

  String? validateName(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "من فضلك ادخل اسم المستخدم";
    } else if (this.length < 3) {
      return message ?? "يجب ان يكون الاسم اكثر من 3 احرف";
    } else if (this.contains(RegExp(r"^[A-Za-z0-9|_|.]")) == false) {
      return message ?? "من فضلك اسم المستخدم يجب ان يكون باللغة الانجليزية";
    }
    return null;
  }

  String? validateEmpty(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context, "fillField");
    }
    return null;
  }

  String? validatePassword(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "من فضلك ادخل كلمة المرور";
    } else if (this.length < 8) {
      return message ?? "كلمة المرور يجب ان تكون اكثر من 8 احرف";
    } else if (this.contains(new RegExp("[a-z]")) == false ||
        this.contains(new RegExp("[A-Z]")) == false ||
        this.contains(new RegExp("[0-9]")) == false) {
      return message ??
          "كلمة المرور يجب ان تحتوي علي ارقام وحروف capital و small";
    }
    return null;
  }

  String? validateEmail(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "من فضلك ادخل البريد الالكتروني";
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this)) {
      return message ?? "من فضلك ادخل بريد الكتروني صحيح";
    }
    return null;
  }

  String? validateEmailORNull(BuildContext context, {String? message}) {
    if (this.trim().isNotEmpty) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? tr(context, "mailValidation");
      }
    }
    return null;
  }

  String? validateCity(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "من فضلك اختر المنطقة";
    }
    return null;
  }

  String? validatePhone(BuildContext context, {String? message}) {
    if (this.trim().isEmpty) {
      return message ?? "من فضلك ادخل رقم الجوال";
    } else if (!RegExp(
            r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
        .hasMatch(this)) {
      return message ?? tr(context, "phoneValidation");
    } else if (this.length != 10) {
      return message ?? "من فضلك رقم الجوال يجب ان يكون 10 ارقام";
    }
    return null;
  }

  String? validatePasswordConfirm(BuildContext context,
      {required String pass, String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context, "fillField");
    } else if (this != pass) {
      return message ?? tr(context, "confirmValidation");
    }
    return null;
  }
}

extension ValidatorDrop<DataType> on DataType {
  String? validateDropDown(BuildContext context, {String? message}) {
    if (this == null) {
      return message ?? tr(context, "fillField");
    }
    return null;
  }
}
