import 'package:base_flutter/customer/models/cities_model.dart';

class FilterCitiesModel {
  List<CitiesModel> allCities;
  int? current;

  FilterCitiesModel({required this.allCities, this.current});
}
