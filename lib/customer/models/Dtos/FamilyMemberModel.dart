class FamilyMemberModel {
  String? id;
  String? name;

  FamilyMemberModel({this.id, this.name});

  List<FamilyMemberModel> get family => [
    FamilyMemberModel(id: "1-4", name: "1-4"),
    FamilyMemberModel(id: "8-5", name: "8-5"),
    FamilyMemberModel(id: "9+", name: "9+"),

  ];
}