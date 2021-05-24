part of'EditProfileImports.dart';
class EditProfileData{

  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<CustomButtonState>();

  final TextEditingController name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController country = new TextEditingController();
  final TextEditingController region = new TextEditingController();
  final TextEditingController gender = new TextEditingController();
  final TextEditingController birthDate = new TextEditingController();
  final TextEditingController living = new TextEditingController();
  final TextEditingController educationLevel = new TextEditingController();
  final TextEditingController familyMembers = new TextEditingController();
  final TextEditingController averageSalary = new TextEditingController();


  final GenericCubit<String> dateCubit = GenericCubit("");
  void getDatePicker(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        context: context,
        onConfirm: (date) {
          if (date != null) {
            String dateStr = DateFormat("MM/dd/yyyy hh:mm a").format(date);
            dateCubit.onUpdateData(dateStr);
          }
        },
        title: ""
    );
  }

  // final GlobalKey<DropdownSearchState> region = new GlobalKey();

}