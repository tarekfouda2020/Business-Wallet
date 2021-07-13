part of 'RegisterImports.dart';

class RegisterData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<bool> termsCubit = GenericCubit(false);
  final GenericCubit<String> genderCubit = new GenericCubit("m");

  final TextEditingController userName = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final TextEditingController gender = new TextEditingController();

  final GenericCubit<bool> showPass = new GenericCubit(true);
  final GenericCubit<bool> showConfirmPass = new GenericCubit(true);

  final GlobalKey<DropdownSearchState> city = new GlobalKey();

  int? cityId;

  void onSelectCities(CitiesModel model) {
    cityId = model.id;
  }

  void selectType(String id, BuildContext context) {
    genderCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  final GenericCubit<String> dateCubit = GenericCubit("");

  void getDatePicker(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
      title: "",
      minDate: DateTime(1800),
      initial: DateTime.now().subtract(Duration(days: 365)),
      maxDate: DateTime.now().subtract(Duration(days: 365)),
      context: context,
      onConfirm: (date) {
        if (date != null) {
          String dateStr = DateFormat("MM-dd-yyyy").format(date);
          dateCubit.onUpdateData(dateStr);
        }
      },
    );
  }

  final GenericCubit<IntroModel?> introCubit = new GenericCubit(null);

  void fetchIntro(BuildContext context, {bool refresh = true}) async {
    var data = await GeneralRepository(context).getIntro(refresh: refresh);
    introCubit.onUpdateData(data);
  }

  void setUserRegister(BuildContext context) async {
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

      if (!termsCubit.state.data) {
        LoadingDialog.showSimpleToast("هل وافقت علي الشروط والاحكام");
        return;
      }
      btnKey.currentState!.animateForward();
      RegisterModel model = new RegisterModel(
        userName: userName.text,
        email: mail.text,
        phone: phone.text,
        fKCountry: 3,
        fKCity: cityId,
        codePhone: "+966",
        gender: genderCubit.state.data,
        birthDate: dateCubit.state.data,
        password: pass.text,
        lang: context.read<LangCubit>().state.locale.languageCode,
      );
      await CustomerRepository(context).userRegister(model);
      btnKey.currentState!.animateReverse();
    }
  }
}
