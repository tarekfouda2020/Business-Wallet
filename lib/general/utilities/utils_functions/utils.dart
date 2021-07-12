part of 'UtilsImports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setCachedImage(context);
    var strUser = prefs.getString("user");

    if (strUser != null) {
      UserModel data = UserModel.fromJson(json.decode(strUser));
      changeLanguage(data.lang ?? "ar", context);
      setCurrentUserData(
        data,
        data.step,
        context,
        fromWhere: "splash",
      );
    } else {
      IntroModel? response = await GeneralRepository(context).getIntro();
      changeLanguage("ar", context);
      AutoRouter.of(context).push(LoginRoute(introModel: response));
    }
  }

  static void setCachedImage(BuildContext context) {
    precacheImage(AssetImage(Res.on1), context);
    precacheImage(AssetImage(Res.on2), context);
    precacheImage(AssetImage(Res.on3), context);
    precacheImage(AssetImage(Res.onProv1), context);
    precacheImage(AssetImage(Res.onProv2), context);
    precacheImage(AssetImage(Res.onProv3), context);
    precacheImage(AssetImage(Res.onUser4), context);
  }

  static void setCurrentUserData(
      UserModel model, int? step, BuildContext context,
      {String fromWhere = "login", String? userId}) async {
    context.read<UserCubit>().onUpdateUserData(model);
    if (model.typeUser == 1) {
      if (step == 0) {
        context.router
            .push(CompActiveAccountRoute(userId: model.companyModel!.userId));
      } else if (step == 1) {
        context.router
            .push(SuccessfullyActiveRoute(userId: model.companyModel!.userId));
      } else if (step == 2) {
        context.router.push(
            CompanyRegisterCommercialRoute(userId: model.companyModel!.userId));
      } else if (step == 3) {
        context.router.push(
            CompanyRegisterInterestsRoute(userId: model.companyModel!.userId));
      } else {
        AutoRouter.of(context).push(CompanyHomeRoute(index: 4));
      }
    } else {
      if (model.interest == true) {
        AutoRouter.of(context).push(HomeRoute(index: 4));
      } else {
        AutoRouter.of(context)
            .push(ImportantRoute(fromWhere: fromWhere, userId: userId));
      }
    }
  }

  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }

  static void changeLanguage(String lang, BuildContext context) {
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static UserModel getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // static CustomerModel getCustomerData({@required BuildContext context}){
  //   var provider = Provider.of<UserStore>(context,listen: false);
  //   return provider.model.customer;
  // }

  // static DelegateModel getDelegateData({@required BuildContext context}){
  //   var provider = Provider.of<UserProvider>(context,listen: false);
  //   return provider.model.delegate;
  // }

  // static int getCurrentUserType({@required BuildContext context}){
  //   var provider = Provider.of<UserStore>(context,listen: false);
  //   return provider.model.type;
  // }
  //
  // static String getCurrentUserLang({@required BuildContext context}){
  //   var provider = Provider.of<UserStore>(context,listen: false);
  //   return provider.model.lang;
  // }
  //
  // static String getCurrentUserToken({@required BuildContext context}){
  //   var provider = Provider.of<UserStore>(context,listen: false);
  //   return provider.model.token;
  // }
  //
  // static void setCurrentUserType({@required BuildContext context,@required int type}){
  //   var provider = Provider.of<UserStore>(context,listen: false);
  //   SavedDataModel model=provider.model;
  //   model.type=type;
  //   provider.setUserModel(model);
  // }

  // static void setCurrentUserLang({@required BuildContext context,@required String lang}){
  //   var provider =Provider.of<UserStore>(context,listen: false);
  //   SavedDataModel model=provider.model;
  //   model.lang=lang;
  //   provider.setUserModel(model);
  //   saveUserData(provider.model);
  //   changeLanguage(lang,context);
  // }

  // static String getCurrentUserId({required BuildContext context}) {
  //   var provider = context.watch<UserCubit>().state.model;
  //   return provider.userId;
  // }

  // static void setSelectUser({@required int type, @required BuildContext context}) async {
  //   setCurrentUserType(context: context,type: type);
  //   ExtendedNavigator(router: AppRouter(), name: Routes.login);
  // }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      LoadingDialog.showToastNotification("من فضلك تآكد من الرابط");
    }
  }

  static void launchMap(
      {required String address,
      required double lat,
      required double lng}) async {
    var url = '';
    var urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
      if (await canLaunch(urlAppleMaps)) {
        await launch(urlAppleMaps);
      } else {
        throw 'Could not launch $urlAppleMaps';
      }
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else if (await canLaunch(urlAppleMaps)) {
      await launch(urlAppleMaps);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    print(_whatsAppUrl);
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      throw 'حدث خطأ ما';
    }
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunch('$url')) {
        await launch('$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    LoadingDialog.showLoadingDialog();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  static Future<File?> getImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files.first;
    } else {
      return null;
    }
  }

  static Future<File?> getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf']);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files.first;
    } else {
      return null;
    }
  }

  static Future<List<File>> getImages() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files.first;
    } else {
      return null;
    }
  }

  static Future<List<File>> getVideos() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.video);

    if (result != null) {
      List<File> files = result.paths.map((path) => File("$path")).toList();
      return files;
    } else {
      return [];
    }
  }

  static void copToClipboard({required String text}) {
    if (text.trim().isEmpty) {
      LoadingDialog.showToastNotification("لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        LoadingDialog.showToastNotification("تم النسخ بنجاح");
      });
    }
  }

  static Future<bool> askForPermission(Location location) async {
    var permission = await location.hasPermission();
    if (permission == PermissionStatus.deniedForever) {
      return false;
    } else if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission == PermissionStatus.denied ||
          permission == PermissionStatus.deniedForever) {
        return false;
      }
    }
    return true;
  }

  static Future<LocationData?> getCurrentLocation() async {
    final location = new Location();
    bool permission = await askForPermission(location);
    late LocationData current;
    if (permission) {
      current = await location.getLocation();
    }
    return current;
  }

  static void navigateToMapWithDirection(
      {required String lat,
      required String lng,
      required BuildContext context}) async {
    if (lat == "0") return;
    try {
      final coords = Coords(double.parse(lat), double.parse(lng));
      final title = "Destination";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      LoadingDialog.showSimpleToast("$e");
    }
  }

  static void navigateToLocationAddress(
      BuildContext context, LocationCubit locCubit) async {
    FocusScope.of(context).requestFocus(FocusNode());
    LoadingDialog.showLoadingDialog();
    var current = await Utils.getCurrentLocation();
    LocationModel? locationModel = locCubit.state.model;
    if (current != null) {
      locationModel =
          LocationModel("${current.latitude}", "${current.longitude}", "");
    }
    double lat = double.parse(locationModel!.lat);
    double lng = double.parse(locationModel.lng);
    String? address = await getAddress(LatLng(lat, lng), context);
    locationModel.address = address;
    locCubit.onLocationUpdated(locationModel);
    EasyLoading.dismiss();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (cxt) => BlocProvider.value(
          value: locCubit,
          child: LocationAddress(),
        ),
      ),
    );
  }

  static Future<String> getAddress(LatLng latLng, BuildContext context) async {
    final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
    try {
      List<Address>? addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      print("${first.featureName} : ${first.addressLine}");
      return first.addressLine;
    } catch (e) {
      return "";
    }
  }

  static double determineDistance(double zoom) {
    if (zoom >= 12) {
      return 1;
    } else if (zoom >= 8) {
      return 5;
    } else if (zoom >= 6) {
      return 10;
    }
    return 15;
  }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }
}
