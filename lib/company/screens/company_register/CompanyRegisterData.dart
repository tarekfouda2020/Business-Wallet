part of 'CompanyRegisterImports.dart';

class CompanyRegisterData {
  final LocationCubit locCubit = LocationCubit();

  final GenericCubit<bool> termCubit = GenericCubit(false);
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GenericCubit<bool> showPass = new GenericCubit(true);
  final GenericCubit<bool> showConfirmPass = new GenericCubit(true);

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
      if (phone.text == "") {
        LoadingDialog.showSimpleToast("من فضلك ادخل رقم الجوال");
        return;
      } else if (!RegExp(
          r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
          .hasMatch(phone.text)) {
        LoadingDialog.showSimpleToast("    من فضلك ادخل الجوال صحيحا");
        return;
      } else if (phone.text.length != 10) {
        LoadingDialog.showSimpleToast(
            "من فضلك رقم الجوال يجب ان يكون 10 ارقام");
        return;
      }
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
        address: locCubit.state.model!.address,
        lat: locCubit.state.model!.lat,
        lng: locCubit.state.model!.lng,
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
