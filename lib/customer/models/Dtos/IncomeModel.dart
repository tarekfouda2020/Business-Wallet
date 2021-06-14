class IncomeModel {
  String? id;
  String? name;

  IncomeModel({this.id, this.name});

  List<IncomeModel> get income => [
    IncomeModel(id: "1-10000", name: "1-10000 ريال"),
    IncomeModel(id: "10001-25000", name: "10001-25000 ريال"),
    IncomeModel(id: "+25001", name: "+25001 ريال"),

  ];
}