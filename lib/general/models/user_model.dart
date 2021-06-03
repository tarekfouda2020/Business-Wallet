import 'package:base_flutter/company/models/company_model.dart';
import 'package:base_flutter/customer/models/customer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(nullable: true)
class UserModel {
  CustomerModel? customerModel;
  CompanyModel? companyModel;
  @JsonKey(name: "device_id")
  String? deviceId;
  @JsonKey(name: "type_user")
  int? typeUser;
  @JsonKey(name: "lang")
  String? lang;
  @JsonKey(name: "interest")
  bool? interest;
  @JsonKey(name: "step")
  int? step;
  UserModel(
      {this.customerModel,
      this.companyModel,
      this.deviceId,
      this.typeUser,
      this.lang,
      this.interest,
      this.step});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
