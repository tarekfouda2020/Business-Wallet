import 'package:json_annotation/json_annotation.dart';

part 'reconciliation_data_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ReconciliationDataModel {
  @JsonKey(name: 'Cost')
  int cost;
  @JsonKey(name: 'CostMun')
  double costMun;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'PhoneNumber')
  String phoneNumber;
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Address')
  String address;

  ReconciliationDataModel(
      {required this.cost,
      required this.costMun,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.address});

  factory ReconciliationDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReconciliationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReconciliationDataModelToJson(this);
}
