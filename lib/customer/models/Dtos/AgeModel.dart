class AgeModel {
  String? id;
  String? name;

  AgeModel({this.id, this.name});

  List<AgeModel> get age => [
        AgeModel(id: "1-30", name: "1-30"),
        AgeModel(id: "30-100", name: "30-100"),
        AgeModel(id: "1-100", name: "الكل"),
      ];
}
