import 'package:json_annotation/json_annotation.dart';

part 'AddBranchModel.g.dart';

@JsonSerializable(nullable: true)
class AddBranchModel {

  int? id;
  String? address;
  String? lat;
  String? lng;
  String? phone;
  String? code;
  @JsonKey(name: "from_hour_work")
  String? fromHour;
  @JsonKey(name: "to_hour_work")
  String? toHour;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "lang")
  String? lang;


  AddBranchModel(
      {this.id,
      this.address,
      this.lat,
      this.lng,
      this.phone,
      this.code,
      this.fromHour,
      this.toHour,
      this.status,
      this.lang});

  factory AddBranchModel.fromJson(Map<String, dynamic> json) => _$AddBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddBranchModelToJson(this);
}