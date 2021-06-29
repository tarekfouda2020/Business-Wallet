
class AddBrochureSubscribeModel {
  String? userId;
  String? businessCardId;
  String? fkMainField;
  String? fkSubField;
  String? numberCard;
  String? fkCity;
  String? price;
  String? typePayment;
  String? allSubField;
  String? mainCost;
  String? addedCost;
  String? mainPoints;
  String? addedPoints;
  String? lang;

  AddBrochureSubscribeModel(
      {this.userId,
      this.businessCardId,
      this.fkMainField,
      this.fkSubField,
      this.numberCard,
      this.fkCity,
      this.price,
      this.typePayment,
      this.allSubField,
      this.mainCost,
      this.addedCost,
      this.mainPoints,
      this.addedPoints,
      this.lang});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "bussines_card_id": businessCardId,
        "fk_mainfield": fkMainField,
        "fk_subfield": fkSubField,
        "numbercard": numberCard,
        "fk_city": fkCity,
        "price": price,
        "type_payment": typePayment,
        "allsubfiled": allSubField,
        "main_cost": mainCost,
        "cost_add": addedCost,
        "main_points": mainPoints,
        "points_add": addedPoints,
        "lang": lang,
      };
}
