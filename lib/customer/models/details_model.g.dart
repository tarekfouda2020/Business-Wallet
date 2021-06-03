// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) {
  return DetailsModel(
    branch: json['branch'] as bool,
    kayanId: json['Kayan_Id'] as String,
    kayanName: json['KayanName'] as String,
    baseImg: json['BaseImg'] as String,
    backgroundImg: json['BackgroundImg'] as String,
    phone: json['Photo'] as String,
    email: json['Email'] as String,
    website: json['Website'] as String,
    address: json['Address'] as String,
    twitter: json['Twwitter'] as String,
    faceBook: json['FaceBook'] as String,
    instagram: json['Instagram'] as String,
    whatsUp: json['WhatsUp'] as String,
    countryCode: json['CountryCode'] as String,
    lat: json['Lat'] as String,
    lng: json['Lng'] as String,
    like: json['Like'] as bool,
    myRate: json['MyRate'] as int,
    countLike: json['CountLike'] as int,
    countFollow: json['CountFollow'] as int,
    showPdfKayan: json['show_pdf_kayan'] as bool,
    showBranchesKayan: json['show_branches_kayan'] as bool,
    showDescriptionKayan: json['show_description_kayan'] as bool,
    showImgKayan: json['show_img_kayan'] as bool,
    showPartnersKayan: json['show_partners_kayan'] as bool,
    showAccreditationKayan: json['show_Accreditation_kayan'] as bool,
    nameImg: json['name_img'] as String,
    namePdf: json['name_pdf'] as String,
    countRate: json['CountRate'] as int,
    numberRate: json['NumberRate'] as int,
    description: json['Description'] as String,
    descriptionText: json['Description_text'] as String,
    follow: json['Follow'] as bool,
    pdf: json['Pdf'] as String,
    specialization: (json['Specialization'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    products:
        (json['Products'] as List<dynamic>).map((e) => e as String).toList(),
    accreditationCertificates:
        (json['Accreditation_Certificates'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
    partners:
        (json['Partners'] as List<dynamic>).map((e) => e as String).toList(),
    mainFiled: json['mainFiled'] as int,
    visit: json['Visit'] as int,
    rate: json['Rate'] as int,
    fkUserIsLogin: json['Fk_User_iSLogin'] as int,
    business: json['business'] as bool,
  );
}

Map<String, dynamic> _$DetailsModelToJson(DetailsModel instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'Kayan_Id': instance.kayanId,
      'KayanName': instance.kayanName,
      'BaseImg': instance.baseImg,
      'BackgroundImg': instance.backgroundImg,
      'Photo': instance.phone,
      'Email': instance.email,
      'Website': instance.website,
      'Address': instance.address,
      'Twwitter': instance.twitter,
      'FaceBook': instance.faceBook,
      'Instagram': instance.instagram,
      'WhatsUp': instance.whatsUp,
      'CountryCode': instance.countryCode,
      'Lat': instance.lat,
      'Lng': instance.lng,
      'Like': instance.like,
      'MyRate': instance.myRate,
      'CountLike': instance.countLike,
      'CountFollow': instance.countFollow,
      'show_pdf_kayan': instance.showPdfKayan,
      'show_branches_kayan': instance.showBranchesKayan,
      'show_description_kayan': instance.showDescriptionKayan,
      'show_img_kayan': instance.showImgKayan,
      'show_partners_kayan': instance.showPartnersKayan,
      'show_Accreditation_kayan': instance.showAccreditationKayan,
      'name_img': instance.nameImg,
      'name_pdf': instance.namePdf,
      'CountRate': instance.countRate,
      'NumberRate': instance.numberRate,
      'Description': instance.description,
      'Description_text': instance.descriptionText,
      'Follow': instance.follow,
      'Pdf': instance.pdf,
      'Specialization': instance.specialization,
      'Products': instance.products,
      'Accreditation_Certificates': instance.accreditationCertificates,
      'Partners': instance.partners,
      'mainFiled': instance.mainFiled,
      'Visit': instance.visit,
      'Rate': instance.rate,
      'Fk_User_iSLogin': instance.fkUserIsLogin,
      'business': instance.business,
    };
