class LivingModel {
  String? id;
  String? name;

  LivingModel({this.id, this.name});

  List<LivingModel> get living => [
        LivingModel(id: "الكل", name: "الكل"),
        LivingModel(id: "سكن مشترك", name: "سكن مشترك"),
        LivingModel(id: "شقة", name: "شقة"),
        LivingModel(id: "فله", name: "فله"),
      ];
}
