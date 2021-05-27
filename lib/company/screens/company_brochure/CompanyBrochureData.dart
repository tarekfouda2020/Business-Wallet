part of 'CompanyBrochureImports.dart';

class CompanyBrochureData {
  final TextEditingController phone = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController desc = new TextEditingController();
  final TextEditingController fileName = new TextEditingController();
  final TextEditingController service = new TextEditingController();
  final TextEditingController serviceName = new TextEditingController();
  final TextEditingController servicePrice = new TextEditingController();
  final TextEditingController image = new TextEditingController();

  final GenericCubit<bool> showService = new GenericCubit<bool>(false);
  final GenericCubit<bool> showFile = new GenericCubit<bool>(false);
  final GenericCubit<bool> showImage = new GenericCubit<bool>(false);


  final GenericCubit<File?> imageCubit = new GenericCubit(null);
  final GenericCubit<File?> fileCubit = new GenericCubit(null);
  final GenericCubit<File?> serviceCubit = new GenericCubit(null);

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
  setService() async {
    var image = await Utils.getImage();
    if (image != null) {
      serviceCubit.onUpdateData(image);
    }
  }
}
