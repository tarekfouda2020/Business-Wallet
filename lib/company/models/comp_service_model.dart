import 'package:json_annotation/json_annotation.dart'; 

part 'comp_service_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompServiceModel {

  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "price")
  String? price;


  CompServiceModel({this.name, this.price});


  factory CompServiceModel.fromJson(Map<String, dynamic> json) => _$CompServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompServiceModelToJson(this);
}

