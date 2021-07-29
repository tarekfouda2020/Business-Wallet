class GenderModel {
  String? id;
  String? name;

  GenderModel({this.id, this.name});

  List<GenderModel> get genders => [
        GenderModel(id: "A", name: "الكل"),
        GenderModel(id: "M", name: "ذكر"),
        GenderModel(id: "F", name: "انثي"),
      ];
}
