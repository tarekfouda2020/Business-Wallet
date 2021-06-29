class DaysModel {
  int? id;
  String? name;

  DaysModel({this.id, this.name});

  List<DaysModel> get duration => [
    DaysModel(id: 1, name: "1"),
    DaysModel(id: 2, name: "2"),
    DaysModel(id: 3, name: "3"),
    DaysModel(id: 4, name: "4"),
    DaysModel(id: 5, name: "5"),
    DaysModel(id: 6, name: "6"),

  ];
}
