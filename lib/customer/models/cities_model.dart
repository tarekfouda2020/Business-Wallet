import 'package:json_annotation/json_annotation.dart'; 

part 'cities_model.g.dart'; 

@JsonSerializable(nullable: true)
class CitiesModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "fk_country")
  int? fkCountry;


  CitiesModel({this.id, this.name, this.fkCountry});

  factory CitiesModel.fromJson(Map<String, dynamic> json) => _$CitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesModelToJson(this);
}

