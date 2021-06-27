part of 'CompanyRegisterImports.dart';

class CompanyRegisterData {
  final LocationCubit locationCubit = LocationCubit();

  final GenericCubit<bool> termCubit = GenericCubit(false);
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController companyName = new TextEditingController();
  final TextEditingController companyEmail = new TextEditingController();
  final TextEditingController companyPhone = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController regionId = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmPassword = new TextEditingController();
  final TextEditingController walletNumb = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  String? lat;
  String? lng;

  final GlobalKey<DropdownSearchState> city = new GlobalKey();

  int? cityId;

  void onSelectCities(CitiesModel model) {
    cityId = model.id;
  }


  void setCompRegister(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      if (!termCubit.state.data) {
        LoadingDialog.showSimpleToast("هل وافقت علي الشروط والاحكام");
        return;
      }
      btnKey.currentState!.animateForward();
      CompRegisterModel model = new CompRegisterModel(
        userName: name.text,
        email: email.text,
        phone: phone.text,
        fKCountry: 3,
        fKCity: cityId,
        codePhone: "+966",
        kayanPhoneCode: "+966",
        address: locationCubit.state.model!.address,
        lat: locationCubit.state.model!.lat,
        lng: locationCubit.state.model!.lng,
        password: password.text,
        kayanEmail: companyEmail.text,
        kayanName: companyName.text,
        kayanPhone: companyPhone.text,
        promoCode: walletNumb.text,
        lang: context.read<LangCubit>().state.locale.languageCode,
      );
      await CompanyRepository(context).compRegister(model);
      btnKey.currentState!.animateReverse();
    }
  }
}
