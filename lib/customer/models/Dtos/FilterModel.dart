class FilterModel {
  String? id;
  String? name;

  FilterModel({this.id, this.name});

  List<FilterModel> get filters => [
        FilterModel(id: "0", name: "الأعلى تقييم"),
        FilterModel(id: "1", name: "الأقل تقييم"),
        FilterModel(id: "2", name: "الأقرب"),
        FilterModel(id: "3", name: "منشأت نشطة"),
        FilterModel(id: "-1", name: "اخري"),
      ];
}
