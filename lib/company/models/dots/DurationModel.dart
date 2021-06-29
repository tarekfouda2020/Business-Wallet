class DurationModel {
  int? id;
  String? name;

  DurationModel({this.id, this.name});

  List<DurationModel> get duration => [
    DurationModel(id: 10, name: "10"),
    DurationModel(id: 20, name: "20"),
    DurationModel(id: 30, name: "30"),
    DurationModel(id: 40, name: "40"),
    DurationModel(id: 50, name: "50"),
    DurationModel(id: 60, name: "60"),

  ];
}
