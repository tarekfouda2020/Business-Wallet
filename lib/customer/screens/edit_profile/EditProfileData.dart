part of 'EditProfileImports.dart';

class EditProfileData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<String> dateCubit = GenericCubit("");
  final GenericCubit<File?> imageCubit = new GenericCubit(null);
  final GenericCubit<String> genderCubit = new GenericCubit("m");
  final GenericCubit<String> incomeCubit = new GenericCubit("1-10000");
  final GenericCubit<String> livingCubit = new GenericCubit("سكن مشترك");
  final GenericCubit<String> familyCubit = new GenericCubit("1-4");
  final GenericCubit<String> educationCubit = new GenericCubit("ثانوي");

  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController region = new TextEditingController();
  final TextEditingController birthDate = new TextEditingController();
  final TextEditingController living = new TextEditingController();
  final TextEditingController educationLevel = new TextEditingController();
  final TextEditingController familyMembers = new TextEditingController();
  final TextEditingController averageSalary = new TextEditingController();
  CitiesModel? cityId;

  // GenderModel? genderId;
  // IncomeModel? incomeId;
  // LivingModel? livingId;
  // FamilyMemberModel? familyMemberId;
  // EducationModel? educationId;

  final TextEditingController gender = new TextEditingController();

  final GlobalKey<DropdownSearchState> city = new GlobalKey();

  void onSelectCities(CitiesModel? model) {
    cityId = model != null ? model : null;
  }

  void selectType(String id, BuildContext context) {
    genderCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  void selectIncome(String id, BuildContext context) {
    incomeCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  void selectLiving(String id, BuildContext context) {
    livingCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  void selectFamily(String id, BuildContext context) {
    familyCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  void selectEducation(String id, BuildContext context) {
    educationCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  seInitialData(BuildContext context) {
    var user = context.read<UserCubit>().state.model.customerModel;
    print("__________${user!.educationLevel}");
    name.text = user.userName!;
    email.text = user.email!;
    phone.text = user.phoneNumber!;
    cityId = CitiesModel(fkCountry: 3, id: user.fkCity!, name: user.cityName!);
    gender.text = (user.genderUser!) == "f" ? "انثي" : "ذكر";
    birthDate.text = user.birthDateUser!;
    living.text = user.accommodationType!;
    educationLevel.text = user.educationLevel!;
    familyMembers.text = user.numFamily!;
    averageSalary.text = user.averageIncomePerYear!;
  }

  setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  void getDatePicker(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
      title: "",
      minDate: DateTime(1800),
      context: context,
      onConfirm: (date) {
        if (date != null) {
          String dateStr = DateFormat("MM-dd-yyyy").format(date);
          dateCubit.onUpdateData(dateStr);
        }
      },
    );
  }

  void updateUserData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      // var user = context.read<UserCubit>().state.model.customerModel;

      btnKey.currentState!.animateForward();
      UpdateCustomerModel model = UpdateCustomerModel(
        name: name.text,
        phone: phone.text,
        address: "",
        averageIncome: incomeCubit.state.data,
        birthDate: dateCubit.state.data,
        codePhone: "+966",
        education: educationCubit.state.data,
        email: email.text,
        fkCity: cityId?.id.toString(),
        fkCountry: "3",
        gender: genderCubit.state.data,
        lat: "",
        lng: "",
        numberFamily: familyCubit.state.data,
        accommodation: livingCubit.state.data,
        userId: context.read<UserCubit>().state.model.customerModel!.userId,
        img: imageCubit.state.data,
        lang: context.read<LangCubit>().state.locale.languageCode,
      );
      await CustomerRepository(context).updateCustomerData(model);
      btnKey.currentState!.animateReverse();
    }
  }
}
