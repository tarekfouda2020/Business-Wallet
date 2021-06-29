class AddSpecialSubscribeModel {
  String? userId;
  String? startTime;
  String? dayShow;
  String? fkCity;
  String? fkCityName;
  String? age;
  String? people;
  String? interests;
  String? interestsNames;
  double? cost;
  String? lang;

  AddSpecialSubscribeModel(
      {this.userId,
      this.startTime,
      this.dayShow,
      this.fkCity,
      this.fkCityName,
      this.age,
      this.people,
      this.interests,
      this.interestsNames,
      this.cost,
      this.lang});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "time_start": startTime,
        "day_show": dayShow,
        "fk_city": fkCity,
        // "fk_city_name": "${_city.text}",
        "age_group": age,
        "peoples": people,
        "interests": interests,
        "cost": cost,
        "lang": lang,
      };
}
