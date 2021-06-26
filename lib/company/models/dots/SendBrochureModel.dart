import 'dart:io';

class SendBrochureModel {
  String? userId;
  String? email;
  String? phone;
  String? details;
  File? pdf;
  String? fileName;
  List<File>? images;
  String? imageName;
  String? services;
  String? serviceName;
  String? lang;

  SendBrochureModel(
      {this.userId,
      this.email,
      this.phone,
      this.details,
      this.pdf,
      this.fileName,
      this.images,
      this.imageName,
      this.services,
      this.serviceName,
      this.lang});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "phone": phone,
        "details": details,
        "catag_name": fileName,
        "services": services,
        "upload_file": pdf,
        "imgs": images,
        "name_service": serviceName,
        "name_product": imageName,
        "lang": lang,
      };
}
