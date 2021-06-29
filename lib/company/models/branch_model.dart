import 'package:json_annotation/json_annotation.dart'; 

part 'branch_model.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class BranchModel {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'fk_kayan')
  final  String fkKayan;
  @JsonKey(name: 'address')
  final  String address;
  @JsonKey(name: 'phone')
  final  String phone;
  @JsonKey(name: 'lat')
  final  String lat;
  @JsonKey(name: 'lng')
  final  String lng;
  @JsonKey(name: 'hour_work')
  final  String hourWork;
  @JsonKey(name: 'stutes')
  final  bool statues;
  @JsonKey(name: 'hour_work_to')
  final  String hourWorkTo;
  @JsonKey(name: 'code')
  final  String code;
  @JsonKey(name: 'main_or_no')
  final  bool mainOrNo;

  BranchModel({required this.id, required this.fkKayan, required this.address, required this.phone, required this.lat, required this.lng, required this.hourWork, required this.statues, required this.hourWorkTo, required this.code, required this.mainOrNo});

  factory BranchModel.fromJson(Map<String, dynamic> json) => _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}

