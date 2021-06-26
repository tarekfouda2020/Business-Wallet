class BrochureDropDownModel {
  String? id;
  String? name;

  BrochureDropDownModel({this.id, this.name});

  List<BrochureDropDownModel> get brochure => [
        BrochureDropDownModel(id: "1", name: "أرباح الدعوات التجارية"),
        BrochureDropDownModel(id: "2", name: "أرباح الصفقات"),
        BrochureDropDownModel(id: "3", name: "أرباح سوف تفقد بتاريخ"),
      ];
}
