part of 'CompanyEditProfileImports.dart';

class CompanyEditProfileData {
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

  final GenericCubit<Object?> showDescCubit = new GenericCubit(true);
  final GenericCubit<Object?> showCertificateCubit = new GenericCubit(true);
  final GenericCubit<Object?> showPartnerCubit = new GenericCubit(true);
  final GenericCubit<Object?> showBranchCubit = new GenericCubit(true);
  final GenericCubit<Object?> showImagesCubit = new GenericCubit(true);
  final GenericCubit<Object?> showFilesCubit = new GenericCubit(true);
  final GenericCubit<Object?> showBranchViewCubit = new GenericCubit(true);

  final GenericCubit<Object?> interestCubit = new GenericCubit(true);

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController userName = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController city = new TextEditingController();
  final TextEditingController countryId = new TextEditingController();
  final GlobalKey<DropdownSearchState> country = new GlobalKey();

  final TextEditingController compName = new TextEditingController();
  final TextEditingController compPhone = new TextEditingController();
  final TextEditingController compEmail = new TextEditingController();
  final TextEditingController compLocation = new TextEditingController();
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

  void changeRegion(DropDownModel model) {
    countryId.text = model.id.toString();
  }

  final GenericCubit<File?> imageCubit = new GenericCubit(null);
  final GenericCubit<File?> fileCubit = new GenericCubit(null);
  final GenericCubit<File?> certificateCubit = new GenericCubit(null);
  final GenericCubit<File?> partnerCubit = new GenericCubit(null);

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  setFile() async {
    var image = await Utils.getImage();
    if (image != null) {
      fileCubit.onUpdateData(image);
    }
  }
  setCertificate() async {
    var image = await Utils.getImage();
    if (image != null) {
      certificateCubit.onUpdateData(image);
    }
  }
  setPartner() async {
    var image = await Utils.getImage();
    if (image != null) {
      partnerCubit.onUpdateData(image);
    }
  }
}
