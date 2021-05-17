part of 'RegisterImports.dart';

class RegisterData {
  TextEditingController userName = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GenericCubit<bool> termsCubit = GenericCubit(false);

  final GlobalKey<CustomButtonState> btnKey = new GlobalKey<
      CustomButtonState>();

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

}