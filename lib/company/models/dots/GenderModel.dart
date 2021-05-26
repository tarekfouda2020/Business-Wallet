class GenderModel {
  int? id;
  String? name;

  GenderModel({this.id, this.name});

  List<GenderModel> get genders => [
        GenderModel(id: 1, name: "male"),
        GenderModel(id: 2, name: "female"),
      ];
}
