part of 'CompanyEditProfileImports.dart';

class CompanyEditProfileData {
  final LocationCubit locCubit = LocationCubit();

  final GenericCubit<bool> compInfoDropCubit = new GenericCubit(false);
  final GenericCubit<bool> mainDropCubit = new GenericCubit(false);
  final GenericCubit<bool> descDropCubit = new GenericCubit(false);
  final GenericCubit<bool> interestDropCubit = new GenericCubit(false);
  final GenericCubit<bool> branchDropCubit = new GenericCubit(false);
  final GenericCubit<bool> socialDropCubit = new GenericCubit(false);
  final GenericCubit<bool> imagesDropCubit = new GenericCubit(false);
  final GenericCubit<bool> filesDropCubit = new GenericCubit(false);
  final GenericCubit<bool> certificateDropCubit = new GenericCubit(false);
  final GenericCubit<bool> partnersDropCubit = new GenericCubit(false);

  final GenericCubit<bool> showDescCubit = new GenericCubit(true);
  final GenericCubit<bool> showCertificateCubit = new GenericCubit(true);
  final GenericCubit<bool> showPartnerCubit = new GenericCubit(true);
  final GenericCubit<bool> showBranchCubit = new GenericCubit(true);
  final GenericCubit<bool> showImagesCubit = new GenericCubit(true);
  final GenericCubit<bool> showFilesCubit = new GenericCubit(true);
  final GenericCubit<Object?> showBranchViewCubit = new GenericCubit(true);
  final GenericCubit<Object?> interestCubit = new GenericCubit(true);

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController userName = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final GlobalKey<DropdownSearchState> city = new GlobalKey();

  final TextEditingController compName = new TextEditingController();
  final TextEditingController compPhone = new TextEditingController();
  final TextEditingController compEmail = new TextEditingController();
  final TextEditingController compLocation = new TextEditingController();
  late String lat;
  late String lng;
  final TextEditingController compWebsite = new TextEditingController();

  final TextEditingController desc = new TextEditingController();

  final TextEditingController whatsApp = new TextEditingController();
  final TextEditingController instagram = new TextEditingController();
  final TextEditingController twitter = new TextEditingController();
  final TextEditingController facebook = new TextEditingController();
  final TextEditingController google = new TextEditingController();

  final TextEditingController branchLocation = new TextEditingController();
  final TextEditingController branchPhone = new TextEditingController();
  final TextEditingController workHoursFrom = new TextEditingController();
  final TextEditingController workHoursTo = new TextEditingController();
  final TextEditingController branchStatus = new TextEditingController();

  final TextEditingController image = new TextEditingController();
  final TextEditingController file = new TextEditingController();

  final GenericCubit<File?> imageCubit = new GenericCubit(null);
  final GenericCubit<File?> backgroundImgCubit = new GenericCubit(null);

  final GenericCubit<List<File>> addImgCubit = new GenericCubit([]);

  final GenericCubit<File?> fileCubit = new GenericCubit(null);
  final GenericCubit<List<File>> certificateCubit = new GenericCubit([]);
  final GenericCubit<List<File>> partnerCubit = new GenericCubit([]);

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  setBackgroundImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      backgroundImgCubit.onUpdateData(image);
    }
  }

  CitiesModel? cityId;

  void onSelectCities(CitiesModel? model) {
    cityId = model != null ? model : null;
  }

  addImage() async {
    var image = await Utils.getImages();
    if (image != null) {
      addImgCubit.onUpdateData(image);
    }
  }

  removeImage(File file) async {
    addImgCubit.state.data.remove(file);
    addImgCubit.onUpdateData(addImgCubit.state.data);
  }

  void removeExistImage(BuildContext context, DropDownImageModel model) async {
    await CompanyRepository(context).removeImage(model.id!, 1);
    var user = context.read<UserCubit>();
    user.state.model.companyModel!.imgkayan!.remove(model);
    user.onUpdateUserData(user.state.model);
  }

  setFile() async {
    var file = await Utils.getPdf();
    if (file != null) {
      fileCubit.onUpdateData(file);
    }
  }
  removeFile() async {
    fileCubit.onUpdateData(null);
  }


  addCertificate() async {
    var image = await Utils.getImages();
    if (image != null) {
      certificateCubit.onUpdateData(image);
    }
  }

  removeCertificate(File file) async {
    certificateCubit.state.data.remove(file);
    certificateCubit.onUpdateData(certificateCubit.state.data);
  }

  void removeExistCertificate(
      BuildContext context, DropDownImageModel model) async {
    await CompanyRepository(context).removeImage(model.id!, 2);
    var user = context.read<UserCubit>();
    user.state.model.companyModel!.accreditationKayan!.remove(model);
    user.onUpdateUserData(user.state.model);
  }

  addPartner() async {
    var image = await Utils.getImages();
    if (image != null) {
      partnerCubit.onUpdateData(image);
    }
  }

  removePartner(File file) async {
    partnerCubit.state.data.remove(file);
    partnerCubit.onUpdateData(partnerCubit.state.data);
  }

  void removeExistPartner(
      BuildContext context, DropDownImageModel model) async {
    await CompanyRepository(context).removeImage(model.id!, 1);
    var user = context.read<UserCubit>();
    user.state.model.companyModel!.partnersKayan!.remove(model);
    user.onUpdateUserData(user.state.model);
  }

  seInitialData(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;
    userName.text = company!.userName!;
    phone.text = company.phone!;
    email.text = company.email!;
    cityId =
        CitiesModel(fkCountry: 3, id: company.fkCity!, name: company.cityName!);
    compName.text = company.kayanName!;
    compPhone.text = company.phoneKayan!;
    compEmail.text = company.emailKayan!;
    compLocation.text = company.address!;
    compWebsite.text = company.website!;
    desc.text = company.description!;
    whatsApp.text = company.whats!;
    instagram.text = company.instgram!;
    twitter.text = company.twitter!;
    facebook.text = company.facebook!;
    google.text = company.google!;
  }

  void updateCompanyData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var user = context.read<UserCubit>().state.model.companyModel;

      btnKey.currentState!.animateForward();
      UpdateCompanyProfileModel model = UpdateCompanyProfileModel(
        name: userName.text,
        phone: phone.text,
        email: email.text,
        fkCountry: "3",
        fkCity: cityId?.id.toString(),
        kayanName: compName.text,
        kayanPhone: compPhone.text,
        kayanEmail: compEmail.text,
        address: locCubit.state.model!.address,
        lat: locCubit.state.model!.lat,
        lng: locCubit.state.model!.lng,
        website: compWebsite.text,
        description: desc.text,
        whats: whatsApp.text,
        instagram: instagram.text,
        twitter: twitter.text,
        facebook: facebook.text,
        google: google.text,
        codePhone: "+966",
        accreditationKayan: certificateCubit.state.data,
        background: backgroundImgCubit.state.data,
        imgKayan: addImgCubit.state.data,
        partnerKayan: partnerCubit.state.data,
        textImgKayan: image.text,
        textPdfKayan: file.text,
        pdfKayan: fileCubit.state.data,
        showAccreditationKayan: showCertificateCubit.state.data,
        showDesc: showDescCubit.state.data,
        showImgKayan: showImagesCubit.state.data,
        showPartnerKayan: showPartnerCubit.state.data,
        showPdfKayan: showFilesCubit.state.data,
        showBranch: showBranchCubit.state.data,
        // interests: "",
        // branch: "",
        userId: user!.userId,
        img: imageCubit.state.data,
        lang: context.read<LangCubit>().state.locale.languageCode,
      );
      await CompanyRepository(context).updateCompanyData(model);
      btnKey.currentState!.animateReverse();
    }
  }
}
