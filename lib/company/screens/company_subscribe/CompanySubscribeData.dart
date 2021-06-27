part of 'CompanySubscribeImports.dart';

class CompanySubscribeData {
  late final PageController controller;
  final GenericCubit<int> subscribeCubit = new GenericCubit(0);
  final AddSubscribeModel addSubscribeModel = new AddSubscribeModel();
  double baseCost = 0;
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void moveNext() {
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void moveBack() {
    controller.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

//first page

  final TextEditingController name = new TextEditingController();
  final TextEditingController msg = new TextEditingController();
  final TextEditingController fileName = new TextEditingController();
  final TextEditingController imgName = new TextEditingController();

  final GenericCubit<bool> showFile = new GenericCubit<bool>(false);
  final GenericCubit<bool> showImage = new GenericCubit<bool>(false);
  final GenericCubit<File?> fileCubit = new GenericCubit(null);
  final GenericCubit<List<File>> imageCubit = new GenericCubit([]);

  setFile() async {
    var image = await Utils.getPdf();
    if (image != null) {
      fileCubit.onUpdateData(image);
    }
  }

  removeFile() async {
    fileCubit.onUpdateData(null);
  }

  setImage() async {
    var image = await Utils.getImages();
    if (image.length > 0) {
      imageCubit.onUpdateData(image);
    }
  }

  removeImage(File file) async {
    imageCubit.state.data.remove(file);
    imageCubit.onUpdateData(imageCubit.state.data);
  }

  void onSubscribe(BuildContext context) {
    if (formKey.currentState!.validate()) {
      addSubscribeModel.userId =
          context.read<UserCubit>().state.model.companyModel!.userId;
      addSubscribeModel.adsName = name.text;
      addSubscribeModel.adsDesc = msg.text;
      addSubscribeModel.fileName = fileName.text;
      addSubscribeModel.pdf = fileCubit.state.data ?? null;
      addSubscribeModel.images = imageCubit.state.data;
      moveNext();
    }
  }

//end first page

//second page
  final GenericCubit<String> dateCubit = GenericCubit("");
  final GenericCubit<int> genderCubit = new GenericCubit(1);
  final GenericCubit<int> durationCubit = new GenericCubit(10);

  final GenericCubit<CostSubscribeModel?> costCubit = new GenericCubit(null);
  final GenericCubit<ExtraCostModel?> costViewCubit = new GenericCubit(null);
  final GenericCubit<double?> finalCostCubit = new GenericCubit(0.0);

  final GenericCubit<double> costChangeCubit = new GenericCubit(0.0);
  final GenericCubit<double> costViewChangeCubit = new GenericCubit(0.0);
  final GenericCubit<String> incomeCubit = new GenericCubit("1-10000");
  final GenericCubit<String> livingCubit = new GenericCubit("سكن مشترك");
  final GenericCubit<String> ageCubit = new GenericCubit("1-30");

  final GenericCubit<String> familyCubit = new GenericCubit("1-4");
  final GenericCubit<String> educationCubit = new GenericCubit("ثانوي");
  final GenericCubit<List<DropDownSelected>> subFieldCubit =
      new GenericCubit([]);

  final TextEditingController views = new TextEditingController();
  final TextEditingController duration = new TextEditingController();
  final TextEditingController startDate = new TextEditingController();
  final GlobalKey<DropdownSearchState> city = new GlobalKey();
  final GlobalKey<DropdownSearchState> interest = new GlobalKey();
  final GlobalKey<DropdownSearchState> subField = new GlobalKey();

  final TextEditingController interestId = new TextEditingController();
  final TextEditingController gender = new TextEditingController();
  final TextEditingController living = new TextEditingController();
  final TextEditingController age = new TextEditingController();

  final TextEditingController educationLevel = new TextEditingController();
  final TextEditingController familyMembers = new TextEditingController();
  final TextEditingController averageSalary = new TextEditingController();

  final TextEditingController value = new TextEditingController();

  final GenericCubit<int> idCubit = new GenericCubit(0);

  void getDatePicker(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
      title: "",
      context: context,
      onConfirm: (date) {
        if (date != null) {
          String dateStr = DateFormat("MM/dd/yyyy ").format(date);
          dateCubit.onUpdateData(dateStr);
        }
      },
    );
  }

  CitiesModel? regionId;
  int? subFieldId;

  void changeRegion(CitiesModel model) {
    regionId!.id = model.id;
  }

  void onSelectPeopleInterest(
      DropDownSelected? model, BuildContext context) async {
    if (model != null) {
      if (model.id == 0) {
        var all =
            await CompanyRepository(context).getPeopleInterests(refresh: false);
        subFieldCubit.state.data.clear();
        all.removeAt(0);
        subFieldCubit.state.data.addAll(all);
        subFieldCubit.onUpdateData(subFieldCubit.state.data);
      } else {
        // subFieldCubit.state.data.where((e) => e.id == model.id);
        //
        // subFieldId = model.id;
        // if (subFieldCubit.state.data[index].id == subFieldId) {
        //   return LoadingDialog.showSimpleToast(
        //       "لا يمكن اختيار نفس النشاط الفرعي");
        // } else {
        subFieldId = model.id;
        subFieldCubit.state.data.add(model);
        subFieldCubit.onUpdateData(subFieldCubit.state.data);
      }
    }
  }

  void onDeletePeopleInterest(
      BuildContext context, DropDownSelected? model, int index) {
    if (model != null) {
      subFieldId = model.id;
      subFieldCubit.state.data.remove(model);
      subFieldCubit.onUpdateData(subFieldCubit.state.data);
      subField.currentState!.clear();
    }
  }

  void selectType(String id, BuildContext context) {
    genderCubit.onUpdateData(int.parse(id));
    Navigator.of(context).pop();
  }

  void selectDuration(String id, BuildContext context) {
    durationCubit.onUpdateData(int.parse(id));
    Navigator.of(context).pop();
  }

  void changeInterest(DropDownModel model) {
    interestId.text = model.id.toString();
  }

  void selectIncome(String id, BuildContext context) {
    incomeCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  void selectLiving(String id, BuildContext context) {
    livingCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }

  void selectAge(String id, BuildContext context) {
    ageCubit.onUpdateData(id);
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

  void getCostSubscribe(BuildContext context) async {
    var data = await CompanyRepository(context).getCostSubscribe(
        int.parse(views.text),
        addSubscribeModel.images!.length,
        0,
        durationCubit.state.data);
    baseCost = data?.item1 ?? 0;
    costCubit.onUpdateData(data);
    costChangeCubit.onUpdateData(data!.item1);
    costViewChangeCubit.onUpdateData(data.item3);
  }

  void getExtraCostSubscribe(BuildContext context, int price) async {
    var data = await CompanyRepository(context)
        .getExtraCostSubscribe(int.parse(views.text), price);
    costViewCubit.onUpdateData(data);
    baseCost = data?.item1 ?? 0;

    costChangeCubit.onUpdateData(data!.item1);
    costViewChangeCubit.onUpdateData(data.item2);
  }

  void getFinalCostSubscribe(BuildContext context) async {
    var data = await CompanyRepository(context).finalCost(baseCost);
    finalCostCubit.onUpdateData(data);
  }

  void onSecSubscribe(BuildContext context) async {
    addSubscribeModel.countView = int.parse(views.text);
    addSubscribeModel.durationSec = durationCubit.state.data;
    addSubscribeModel.startTime = dateCubit.state.data;
    addSubscribeModel.fkCity = regionId?.id;
    addSubscribeModel.cityName = regionId?.name;

    addSubscribeModel.interests = "46,47,";
    // addSubscribeModel.interests = subFieldCubit.state.data
    //     .where((element) => element.selected && element.id != 0)
    //     .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
    addSubscribeModel.gender = genderCubit.state.data == 1 ? "M" : "F";
    addSubscribeModel.accommodation = livingCubit.state.data;
    addSubscribeModel.education = educationCubit.state.data;
    addSubscribeModel.numberFamily = familyCubit.state.data;
    addSubscribeModel.ageGroup = ageCubit.state.data;
    addSubscribeModel.averageIncome = incomeCubit.state.data;
    addSubscribeModel.mainCost = costCubit.state.data!.item1.toInt();
    addSubscribeModel.addedCost = costViewCubit.state.data!.item1.toInt();
    addSubscribeModel.mainPoints = costCubit.state.data!.item3.toInt();

    addSubscribeModel.addedPoints = costViewCubit.state.data!.item2.toInt();
    addSubscribeModel.price = int.parse(value.text);
    addSubscribeModel.lang =
        context.read<LangCubit>().state.locale.languageCode;
    var data = await CompanyRepository(context).addSubscribe(addSubscribeModel);
    idCubit.onUpdateData(data!);
    moveNext();
  }

//end second page

//third page

  void savePdf(BuildContext context) async {
    var data = await CompanyRepository(context).savePdf(idCubit.state.data);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }
}
