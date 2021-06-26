import 'package:json_annotation/json_annotation.dart';

part 'comp_branch_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompBranchModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'fk_kayan')
  String fkKayan;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'hour_work')
  String hourWork;
  @JsonKey(name: 'stutes')
  bool stutes;
  @JsonKey(name: 'hour_work_to')
  String hourWorkTo;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'main_or_no')
  bool mainOrNo;

  CompBranchModel(
      {required this.id,
      required this.fkKayan,
      required this.address,
      required this.phone,
      required this.lat,
      required this.lng,
      required this.hourWork,
      required this.stutes,
      required this.hourWorkTo,
      required this.code,
      required this.mainOrNo});

  factory CompBranchModel.fromJson(Map<String, dynamic> json) =>
      _$CompBranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompBranchModelToJson(this);
}
