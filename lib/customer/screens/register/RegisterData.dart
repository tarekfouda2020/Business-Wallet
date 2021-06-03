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
      context: context,
      onConfirm: (date) {
        if (date != null) {
          String dateStr = DateFormat("MM-dd-yyyy").format(date);
          dateCubit.onUpdateData(dateStr);
        }
      },
    );
  }

  void setUserRegister(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState!.validate()) {
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
