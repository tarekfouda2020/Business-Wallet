part of 'FirstStepSpecialImports.dart';
class FirstStepSpecialData{
  final GenericCubit<String> dateCubit = GenericCubit("");

  final TextEditingController regionId = new TextEditingController();
  final TextEditingController durationId = new TextEditingController();
  final TextEditingController interestId = new TextEditingController();
  final GlobalKey<DropdownSearchState> interest = new GlobalKey();

  final GlobalKey<DropdownSearchState> duration = new GlobalKey();
  final GlobalKey<DropdownSearchState> region = new GlobalKey();
  final TextEditingController startDate = new TextEditingController();

  void getDatePicker(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
      title: "",
      context: context,
      onConfirm: (date) {
        if (date != null) {
          String dateStr = DateFormat("MM/dd/yyyy hh:mm a").format(date);
          dateCubit.onUpdateData(dateStr);
        }
      },
    );
  }

  void changeDuration(DropDownModel model) {
    durationId.text = model.id.toString();
  }

  void changeRegion(DropDownModel model) {
    regionId.text = model.id.toString();
  }

  void changeInterest(DropDownModel model) {
    interestId.text = model.id.toString();
  }
}