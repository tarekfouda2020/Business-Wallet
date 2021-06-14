import 'dart:io';

class UpdateCustomerModel {
  String? name;
  File? img;
  String? phone;
  String? codePhone;
  String? email;
  String? address;
  String? lat;
  String? lng;
  String? gender;
  String? birthDate;
  String? fkCountry;
  String? fkCity;
  String? accommodation;
  String? education;
  String? numberFamily;
  String? averageIncome;
  String? userId;
  String? lang;

  UpdateCustomerModel(
      {this.name,
      this.img,
      this.phone,
      this.codePhone,
      this.email,
      this.address,
      this.lat,
      this.lng,
      this.gender,
      this.birthDate,
      this.fkCountry,
      this.fkCity,
      this.accommodation,
      this.education,
      this.numberFamily,
      this.averageIncome,
      this.userId,
      this.lang});

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Img": img,
        "Phone": phone,
        "CodePhone": codePhone,
        "Email": email,
        "Address": address,
        "Lat": lat,
        "Lng": lng,
        "Gender": gender,
        "BirthDate": birthDate,
        "FK_Country": fkCountry,
        "FK_City": fkCity,
        "Accommodation": accommodation,
        "Education": education,
        "Numberfamily": numberFamily,
        "Average_income": averageIncome,
        "UserId": userId,
        "lang": lang
      };
}
