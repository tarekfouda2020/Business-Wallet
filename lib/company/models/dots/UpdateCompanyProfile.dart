import 'dart:io';

class UpdateCompanyProfileModel {
  String? userId;
  File? background;
  File? img;
  String? name;
  String? phone;
  String? email;
  String? fkCountry;
  String? fkCity;
  String? kayanName;
  String? kayanPhone;
  String? kayanEmail;
  String? address;
  String? lat;
  String? lng;
  String? website;
  bool? showDesc;
  String? description;
  String? interests;
  bool? showBranch;
  String? branch;
  String? textImgKayan;
  bool? showImgKayan;
  List<File>? imgKayan;
  String? textPdfKayan;
  bool? showPdfKayan;
  File? pdfKayan;
  bool? showAccreditationKayan;
  List<File>? accreditationKayan;
  bool? showPartnerKayan;
  List<File>? partnerKayan;
  String? lang;
  String? whats;
  String? instagram;
  String? twitter;
  String? facebook;
  String? google;
  String? codePhone;

  UpdateCompanyProfileModel({
    this.userId,
    this.background,
    this.img,
    this.name,
    this.phone,
    this.email,
    this.fkCountry,
    this.fkCity,
    this.kayanName,
    this.kayanPhone,
    this.kayanEmail,
    this.address,
    this.lat,
    this.lng,
    this.website,
    this.showDesc,
    this.description,
    this.interests,
    this.showBranch,
    this.branch,
    this.textImgKayan,
    this.showImgKayan,
    this.imgKayan,
    this.textPdfKayan,
    this.showPdfKayan,
    this.pdfKayan,
    this.showAccreditationKayan,
    this.accreditationKayan,
    this.showPartnerKayan,
    this.partnerKayan,
    this.lang,
    this.whats,
    this.instagram,
    this.twitter,
    this.facebook,
    this.google,
    this.codePhone,
  });

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "background": background,
        "img": img,
        "user_name": name,
        "phone": phone,
        "email": email,
        "fk_country": fkCountry,
        "fk_city": fkCity,
        "kayan_name": kayanName,
        "kayan_phone": kayanPhone,
        "email_kayan": kayanEmail,
        "address": address,
        "lat": lat,
        "lng": lng,
        "website": website,
        "show_description": showDesc,
        "description": description,
        "interests": interests,
        "show_branch": showBranch,
        "branch": branch,
        "txt_img_kayan": textImgKayan,
        "show_img_kayan": showImgKayan,
        "img_kayan": imgKayan,
        "txt_pdf_kayan": textPdfKayan,
        "show_pdf_kayan": showPdfKayan,
        "pdf_kayan": pdfKayan,
        "show_Accreditation_kayan": showAccreditationKayan,
        "accreditation_kayan_img": accreditationKayan,
        "show_partners_kayan": showPartnerKayan,
        "partners_kayan_img": partnerKayan,
        "lang": lang,
        "whats": whats,
        "instgram": instagram,
        "twitter": twitter,
        "facebook": facebook,
        "google": google,
        "country_code": codePhone,
      };
}
