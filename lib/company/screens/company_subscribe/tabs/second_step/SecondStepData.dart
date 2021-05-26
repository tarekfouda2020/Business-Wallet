part of 'SecondStepImports.dart';

class SecondStepData {
  final GenericCubit<String> dateCubit = GenericCubit("");
  final GenericCubit<int> genderCubit = new GenericCubit(1);

  final TextEditingController views = new TextEditingController();
  final TextEditingController durationId = new TextEditingController();
  final TextEditingController startDate = new TextEditingController();
  final TextEditingController regionId = new TextEditingController();
  final TextEditingController interestId = new TextEditingController();
  final TextEditingController gender = new TextEditingController();
  final TextEditingController livingId = new TextEditingController();
  final TextEditingController educationId = new TextEditingController();
  final TextEditingController familyMembersId = new TextEditingController();
  final TextEditingController agesId = new TextEditingController();
  final TextEditingController salaryId = new TextEditingController();
  final TextEditingController value = new TextEditingController();

  final GlobalKey<DropdownSearchState> duration = new GlobalKey();
  final GlobalKey<DropdownSearchState> region = new GlobalKey();
  final GlobalKey<DropdownSearchState> interest = new GlobalKey();
  final GlobalKey<DropdownSearchState> living = new GlobalKey();
  final GlobalKey<DropdownSearchState> education = new GlobalKey();
  final GlobalKey<DropdownSearchState> familyMembers = new GlobalKey();
  final GlobalKey<DropdownSearchState> ages = new GlobalKey();
  final GlobalKey<DropdownSearchState> salary = new GlobalKey();

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

  void selectType(String id, BuildContext context) {
    genderCubit.onUpdateData(int.parse(id));
    Navigator.of(context).pop();
  }

  void changeInterest(DropDownModel model) {
    interestId.text = model.id.toString();
  }

  void changeLiving(DropDownModel model) {
    livingId.text = model.id.toString();
  }

  void changeEducation(DropDownModel model) {
    educationId.text = model.id.toString();
  }

  void changeFamilyMember(DropDownModel model) {
    familyMembersId.text = model.id.toString();
  }

  void changeAge(DropDownModel model) {
    agesId.text = model.id.toString();
  }

  void changeSalary(DropDownModel model) {
    salaryId.text = model.id.toString();
  }
}
