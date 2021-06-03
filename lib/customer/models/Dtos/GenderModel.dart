class GenderModel {
  String? id;
  String? name;

  GenderModel({this.id, this.name});

  List<GenderModel> get genders => [
        GenderModel(id: "m", name: "ذكر"),
        GenderModel(id: "f", name: "انثي"),
      ];
}
