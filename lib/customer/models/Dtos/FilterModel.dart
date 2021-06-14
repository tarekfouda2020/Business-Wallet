class FilterModel {
  String id;
  String name;

  FilterModel({required this.id, required this.name});

  static List<FilterModel> get filters => [
        FilterModel(id: "0", name: "الأعلى تقييم"),
        FilterModel(id: "1", name: "الأقل تقييم"),
        FilterModel(id: "2", name: "الأقرب"),
        FilterModel(id: "3", name: "منشأت نشطة"),
        FilterModel(id: "-1", name: "اخري"),
      ];

  static List<FilterModel> get favoriteFilters => [
        FilterModel(id: "M", name: "الأعلى تقييم"),
        FilterModel(id: "S", name: "الأقل تقييم"),
      ];

  static List<FilterModel> get invitationFilters => [
        FilterModel(id: "M", name: "الأعلى تقييم"),
        FilterModel(id: "S", name: "الأقل تقييم"),
        FilterModel(id: "H", name: "الأعلى  ربحا"),
      ];
  static List<FilterModel> get mainSearchFilters => [
    FilterModel(id: "1", name: "الأعلى تقييم"),
    FilterModel(id: "2", name: "الأقل تقييم"),
    FilterModel(id: "3", name: "الأقرب"),
  ];
}
