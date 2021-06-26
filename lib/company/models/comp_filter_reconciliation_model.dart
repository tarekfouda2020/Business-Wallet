import 'package:json_annotation/json_annotation.dart';

part 'comp_filter_reconciliation_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompFilterReconciliationModel {
  @JsonKey(name: 'user_name')
  String userName;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'address')
  String address;

  CompFilterReconciliationModel({
    required this.userName,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory CompFilterReconciliationModel.fromJson(Map<String, dynamic> json) =>
      _$CompFilterReconciliationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompFilterReconciliationModelToJson(this);
}
