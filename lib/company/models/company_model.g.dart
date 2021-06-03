// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return CompanyModel(
    userId: json['user_id'] as String,
    background: json['background'] as String?,
    img: json['img'] as String?,
    userName: json['user_name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    kayanName: json['kayan_name'] as String?,
    emailKayan: json['email_kayan'] as String?,
    address: json['address'] as String?,
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
    showDescription: json['show_description'] as bool?,
    description: json['description'] as String?,
    showClassifications: json['show_classifications'] as bool?,
    showBranch: json['show_branch'] as bool?,
    showPdfKayan: json['show_pdf_kayan'] as bool?,
    showPartnersKayan: json['show_partners_kayan'] as bool?,
    showAccreditationKayan: json['show_Accreditation_kayan'] as bool?,
    fkCountry: json['fk_country'] as int?,
    fkCity: json['fk_city'] as int?,
    barcodeImg: json['pare_code_Img'] as String?,
    barcode: json['pare_code'] as String?,
    interests: (json['interests'] as List<dynamic>?)
        ?.map((e) => DropDownModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    branchKayans: (json['branch_Kayans'] as List<dynamic>?)
        ?.map((e) => DropDownImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    whats: json['whats'] as String?,
    instgram: json['instgram'] as String?,
    code: json['code'] as String?,
    twitter: json['twitter'] as String?,
    facebook: json['facebook'] as String?,
    google: json['google'] as String?,
    showImgKayan: json['show_img_kayan'] as bool?,
    imgkayan: (json['img_kayan'] as List<dynamic>?)
        ?.map((e) => DropDownImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    accreditationKayan: (json['accreditation_kayan'] as List<dynamic>?)
        ?.map((e) => DropDownImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    partnersKayan: (json['partners_kayan'] as List<dynamic>?)
        ?.map((e) => DropDownImageModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    txtImgKayan: json['txt_img_kayan'] as String?,
    txtPdfKayan: json['txt_pdf_kayan'] as String?,
    pdfKayan: json['pdf_kayan'] as String?,
    website: json['website'] as String?,
    commentKayan: (json['comment_kayan'] as List<dynamic>?)
        ?.map((e) => CompCommentModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    countLike: json['count_like'] as int?,
    rate: json['rate'] as int?,
    countyName: json['county_name'] as String?,
    cityName: json['city_name'] as String?,
    phoneKayan: json['phone_kayan'] as String?,
    CountLike: json['CountLike'] as int?,
    CountRate: json['CountRate'] as int?,
    Rate: json['Rate'] as int?,
  );
}

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'background': instance.background,
      'img': instance.img,
      'user_name': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'kayan_name': instance.kayanName,
      'email_kayan': instance.emailKayan,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'show_description': instance.showDescription,
      'description': instance.description,
      'show_classifications': instance.showClassifications,
      'show_branch': instance.showBranch,
      'show_pdf_kayan': instance.showPdfKayan,
      'show_partners_kayan': instance.showPartnersKayan,
      'show_Accreditation_kayan': instance.showAccreditationKayan,
      'fk_country': instance.fkCountry,
      'fk_city': instance.fkCity,
      'pare_code_Img': instance.barcodeImg,
      'pare_code': instance.barcode,
      'interests': instance.interests,
      'branch_Kayans': instance.branchKayans,
      'whats': instance.whats,
      'instgram': instance.instgram,
      'code': instance.code,
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'google': instance.google,
      'show_img_kayan': instance.showImgKayan,
      'img_kayan': instance.imgkayan,
      'accreditation_kayan': instance.accreditationKayan,
      'partners_kayan': instance.partnersKayan,
      'txt_img_kayan': instance.txtImgKayan,
      'txt_pdf_kayan': instance.txtPdfKayan,
      'pdf_kayan': instance.pdfKayan,
      'website': instance.website,
      'comment_kayan': instance.commentKayan,
      'count_like': instance.countLike,
      'rate': instance.rate,
      'county_name': instance.countyName,
      'city_name': instance.cityName,
      'phone_kayan': instance.phoneKayan,
      'CountLike': instance.CountLike,
      'CountRate': instance.CountRate,
      'Rate': instance.Rate,
    };
