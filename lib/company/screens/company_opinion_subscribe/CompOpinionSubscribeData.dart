part of 'CompOpinionSubscribeImports.dart';

class CompOpinionSubscribeData {
  late final PageController controller;
  final FirstStepOpinionData firstStepOpinionData = new FirstStepOpinionData();

  final GenericCubit<int> subscribeCubit = new GenericCubit(0);
  final GlobalKey<FormState> secFormKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> questionFormKey = new GlobalKey<FormState>();

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  double baseCost = 0;

  final AddOpinionSubscribeModel addOpinionSubscribeModel =
      new AddOpinionSubscribeModel();

  void moveNext(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void moveBack() {
    controller.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  //first page

  final TextEditingController msg = new TextEditingController();
  final GenericCubit<List<File>> imageCubit = new GenericCubit([]);
  final GenericCubit<List<File>> videosCubit = new GenericCubit([]);

  final GenericCubit<List<AddOpinionQuestionsModel>> addOpinionQuestionCubit =
      new GenericCubit([]);

  setImage() async {
    var image = await Utils.getImages();
    if (image.length > 0) {
      imageCubit.state.data.addAll(image);
      imageCubit.onUpdateData(imageCubit.state.data);
    }
  }

  removeImage(File file) async {
    imageCubit.state.data.remove(file);
    imageCubit.onUpdateData(imageCubit.state.data);
  }

  setVideos() async {
    var videos = await Utils.getVideos();
    if (videos.length > 0) {
      videosCubit.state.data.addAll(videos);
      videosCubit.onUpdateData(videosCubit.state.data);
    }
  }

  removeVideos(File file) async {
    videosCubit.state.data.remove(file);
    videosCubit.onUpdateData(videosCubit.state.data);
  }

  addQuestion() {
    addOpinionQuestionCubit.state.data.add(
      AddOpinionQuestionsModel(
        questionNameController: TextEditingController(),
        answersNameController: [TextEditingController()],
      ),
    );
    addOpinionQuestionCubit.onUpdateData(addOpinionQuestionCubit.state.data);
  }

  removeQuestion(int index) {
    addOpinionQuestionCubit.state.data.removeAt(index);
    addOpinionQuestionCubit.onUpdateData(addOpinionQuestionCubit.state.data);
  }

  addAnswer(int index) {
    addOpinionQuestionCubit.state.data[index].answersNameController
        .add(TextEditingController());
    addOpinionQuestionCubit.onUpdateData(addOpinionQuestionCubit.state.data);
  }

  removeAnswer(int index, int position) {
    if (position == 0) {
      return LoadingDialog.showCustomToast(
          "?????? ???? ???????? ???????? ?????????? ?????????? ?????? ??????????");
    }
    addOpinionQuestionCubit.state.data[index].answersNameController
        .removeAt(position);
    addOpinionQuestionCubit.onUpdateData(addOpinionQuestionCubit.state.data);
  }

  void onSubscribe(BuildContext context) {
    if (formKey.currentState!.validate() &&
        questionFormKey.currentState!.validate()) {
      if (imageCubit.state.data.isEmpty && videosCubit.state.data.isEmpty) {
        return LoadingDialog.showCustomToast(
            "???? ???????? ???????? ?????? ?????????? ???????? ???? ?????????? ");
      }
      if (addOpinionQuestionCubit.state.data.isEmpty) {
        return LoadingDialog.showCustomToast(
            "???? ???????? ???????? ?????? ?????????? ???????? ?????????? ");
      }
      var questions = addOpinionQuestionCubit.state.data
          .map((e) => {
                "quetion_name": "${e.questionNameController.text}",
                "ans": e.answersNameController.map((e) => e.text).toList(),
              })
          .toList();
      addOpinionSubscribeModel.userId =
          context.read<UserCubit>().state.model.companyModel!.userId;
      addOpinionSubscribeModel.adsDesc = msg.text;

      addOpinionSubscribeModel.adsImages = imageCubit.state.data;
      addOpinionSubscribeModel.adsVideo = videosCubit.state.data;
      addOpinionSubscribeModel.questions = json.encode(questions);
      moveNext(context);
    }
  }

  //second page

  final GenericCubit<String> dateCubit = GenericCubit("");
  final GenericCubit<String> genderCubit = new GenericCubit("A");
  final GenericCubit<int> durationCubit = new GenericCubit(10);

  final GenericCubit<CostSubscribeModel?> costCubit = new GenericCubit(null);
  final GenericCubit<ExtraCostModel?> costViewCubit = new GenericCubit(null);
  final GenericCubit<double?> finalCostCubit = new GenericCubit(0.0);

  final GenericCubit<double> costChangeCubit = new GenericCubit(0.0);
  final GenericCubit<double> costViewChangeCubit = new GenericCubit(0.0);
  final GenericCubit<String> incomeCubit = new GenericCubit("????????");
  final GenericCubit<String> livingCubit = new GenericCubit("????????");
  final GenericCubit<String> ageCubit = new GenericCubit("????????");

  final GenericCubit<String> familyCubit = new GenericCubit("????????");
  final GenericCubit<String> educationCubit = new GenericCubit("????????");
  final GenericCubit<List<DropDownSelected>> interestCubit =
      new GenericCubit([]);

  final TextEditingController views = new TextEditingController();
  final TextEditingController duration = new TextEditingController();
  final TextEditingController startDate = new TextEditingController();
  final GlobalKey<DropdownSearchState> city = new GlobalKey();
  final GlobalKey<DropdownSearchState> subField = new GlobalKey();

  final TextEditingController interest = new TextEditingController();
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

  CitiesModel? regionModel;
  int? subFieldId;

  void onDeletePeopleInterest(
      BuildContext context, DropDownSelected? model, int index) {
    if (model != null) {
      if (model.id == 0) {
        var data = interestCubit.state.data.map((e) {
          e.selected = false;
          return e;
        }).toList();
        interestCubit.onUpdateData(data);
        return;
      }
      subFieldId = model.id;
      interestCubit.state.data.remove(model);
      interestCubit.onUpdateData(interestCubit.state.data);
    }
  }

  onItemChanged(int id, int index) {
    if (id == 0) {
      var value = interestCubit.state.data[index].selected;
      var data = interestCubit.state.data.map((e) {
        e.selected = !value;
        return e;
      }).toList();
      interestCubit.onUpdateData(data);
      return;
    }
    interestCubit.state.data[index].selected =
        !interestCubit.state.data[index].selected;
    interestCubit.onUpdateData(interestCubit.state.data);
  }

  showInterestDialog(
      BuildContext context, CompOpinionSubscribeData subscribeData) {
    ModalHelper.showModal(
      context: context,
      title: "?????????? ?????????????? ????????????????",
      content: BuildInterestDialog(compOpinionSubscribeData: subscribeData),
    );
  }

  void changeRegion(CitiesModel model) {
    regionModel = model;
  }

  void selectType(String id, BuildContext context) {
    genderCubit.onUpdateData(id);
    Navigator.of(context).pop();
  }

  void selectDuration(String id, BuildContext context) {
    durationCubit.onUpdateData(int.parse(id));
    Navigator.of(context).pop();
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
    var data = await CompanyRepository(context).getOpinionSubscribeCost(
        int.parse(Utils.convertDigitsToLatin(views.text)),
        addOpinionSubscribeModel.adsImages!.length,
        addOpinionSubscribeModel.adsVideo!.length,
        addOpinionQuestionCubit.state.data.length);
    baseCost = data?.item1 ?? 0;
    costCubit.onUpdateData(data);
    costChangeCubit.onUpdateData(data!.item1);
    costViewChangeCubit.onUpdateData(data.item3);
  }

  void getExtraCostSubscribe(BuildContext context, int price) async {
    var data = await CompanyRepository(context).getExtraCostSubscribe(
        int.parse(Utils.convertDigitsToLatin(views.text)), price);
    costViewCubit.onUpdateData(data);
    baseCost = data?.item1 ?? 0;

    costChangeCubit.onUpdateData(data!.item1);
    costViewChangeCubit.onUpdateData(data.item2);
  }

  void getFinalCostSubscribe(BuildContext context) async {
    if (secFormKey.currentState!.validate()) {
      var data = await CompanyRepository(context).finalCost(baseCost);
      finalCostCubit.onUpdateData(data);
      if (data != null) {
        onSecSubscribe(context);
      }
    }
  }

  void onSecSubscribe(BuildContext context) async {
    if (secFormKey.currentState!.validate()) {
      int len = interestCubit.state.data
          .where((element) => element.selected)
          .toList()
          .length;
      if (len == 0) {
        LoadingDialog.showCustomToast("???? ???????? ???????? ?????????????? ????????????????");
        return;
      }
      if (int.parse(views.text) < 500) {
        LoadingDialog.showCustomToast("?????? ?????? ?????? ?????? ?????????????????? ???? 500");
        return;
      }
      // if (value.text.isEmpty) {
      //   LoadingDialog.showCustomToast("???? ???????? ???????? ????????????");
      //   return;
      // }
      // if (costCubit.state.data == null || costViewCubit.state.data == null) {
      //   LoadingDialog.showSimpleToast("???????? ?????? ?????? ????????????????");
      //   return;
      // }
      print("base $baseCost");
      btnKey.currentState!.animateForward();
      addOpinionSubscribeModel.countWatch = views.text;
      addOpinionSubscribeModel.timeStart = dateCubit.state.data;
      addOpinionSubscribeModel.fkCity = regionModel?.id.toString();
      addOpinionSubscribeModel.fkCityName = regionModel?.name;
      addOpinionSubscribeModel.interests = interestCubit.state.data
          .where((element) => element.selected && element.id != 0)
          .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
      addOpinionSubscribeModel.interestsNames = interestCubit.state.data
          .where((element) => element.selected && element.id != 0)
          .fold("", (prev, e) => "$prev" + "${e.name}" + ",");
      addOpinionSubscribeModel.gender = genderCubit.state.data == 1 ? "M" : "F";
      addOpinionSubscribeModel.accommodation = livingCubit.state.data;
      addOpinionSubscribeModel.education = educationCubit.state.data;
      addOpinionSubscribeModel.numberFamily = familyCubit.state.data;
      addOpinionSubscribeModel.ageGroup = ageCubit.state.data;
      addOpinionSubscribeModel.averageIncome = incomeCubit.state.data;
      addOpinionSubscribeModel.mainCost =
          costCubit.state.data!.item1.toString();
      addOpinionSubscribeModel.addedCost =
          costViewCubit.state.data?.item1.toString() ?? "0";
      addOpinionSubscribeModel.mainPoints =
          costCubit.state.data!.item3.toString();
      addOpinionSubscribeModel.addedPoints =
          costViewCubit.state.data?.item2.toString() ?? "0";
      addOpinionSubscribeModel.price =
          value.text.trim().isEmpty ? baseCost.toString() : value.text;
      addOpinionSubscribeModel.lang =
          context.read<LangCubit>().state.locale.languageCode;
      var data = await CompanyRepository(context)
          .addOpinionSubscribe(addOpinionSubscribeModel);
      btnKey.currentState!.animateReverse();

      idCubit.onUpdateData(data!);
      moveNext(context);
    }
  }

  void savePdf(BuildContext context) async {
    var data =
        await CompanyRepository(context).saveSpecificPdf(idCubit.state.data);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }

  void navToPayment(
      {required String userId,
      required String cost,
      required int type,
      required String advertId,
      required BuildContext context}) {
    AutoRouter.of(context).push(PackagesPaymentRoute(
        userId: userId, type: type, advertId: advertId, cost: cost));
  }
}
