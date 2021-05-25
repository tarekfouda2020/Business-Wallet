part of 'CompanyAccountImports.dart';

class CompanyAccountData {
  final GenericCubit<bool> closedDrop = new GenericCubit(true);
  final GenericCubit<bool> closedPublicDrop = new GenericCubit(true);

  void shareApp() async {
    if (Platform.isIOS) {
      Utils.shareApp("https://www.google.com.eg/");
    } else {
      Utils.shareApp("https://www.google.com.eg/");
    }
  }
}
