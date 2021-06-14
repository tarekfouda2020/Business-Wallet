class EducationModel {
  String? id;
  String? name;

  EducationModel({this.id, this.name});

  List<EducationModel> get education => [
    EducationModel(id: "ثانوي", name: "ثانوي"),
    EducationModel(id: "دبلوم", name: "دبلوم"),
    EducationModel(id: "جامعى", name: "جامعى"),

  ];
}