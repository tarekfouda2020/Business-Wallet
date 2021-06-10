class FilterModel {
  int id;
  String name;

  FilterModel({required this.id, required this.name});

  static List<FilterModel> get filters => [
        FilterModel(id: 0, name: "الأعلى تقييم"),
        FilterModel(id: 1, name: "الأقل تقييم"),
        FilterModel(id: 2, name: "الأقرب"),
        FilterModel(id: 3, name: "منشأت نشطة"),
        FilterModel(id: -1, name: "اخري"),
      ];
}
