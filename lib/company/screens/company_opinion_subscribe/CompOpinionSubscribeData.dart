part of 'CompOpinionSubscribeImports.dart';

class CompOpinionSubscribeData {
  late final PageController controller;
  final GenericCubit<int> subscribeCubit = new GenericCubit(0);
  final GlobalKey<FormState> secFormKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  double baseCost = 0;

  final AddOpinionSubscribeModel addOpinionSubscribeModel =
      new AddOpinionSubscribeModel();

  void moveNext() {
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
      imageCubit.onUpdateData(image);
    }
  }

  removeImage(File file) async {
    imageCubit.state.data.remove(file);
    imageCubit.onUpdateData(imageCubit.state.data);
  }

  setVideos() async {
    var videos = await Utils.getVideos();
    if (videos.length > 0) {
      videosCubit.onUpdateData(videos);
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
          "يجب ان يكون هناك اجابة واحدة علي الاقل");
    }
    addOpinionQuestionCubit.state.data[index].answersNameController
        .removeAt(position);
    addOpinionQuestionCubit.onUpdateData(addOpinionQuestionCubit.state.data);
  }

  void onSubscribe(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (imageCubit.state.data.isEmpty && videosCubit.state.data.isEmpty) {
        if (addOpinionQuestionCubit.state.data.isEmpty) {
          return LoadingDialog.showCustomToast(
              "من فضلك ادخل علي الاقل سؤال وجواب ");
        }
        return LoadingDialog.showCustomToast(
            "من فضلك ادخل علي الاقل صورة او فيديو ");
      }
      var questions = addOpinionQuestionCubit.state.data
          .map((e) => {
                "question_name": "${e.questionNameController.text}",
                "ans": e.answersNameController.map((e) => e.text).toList(),
              })
          .toList();
      addOpinionSubscribeModel.userId =
          context.read<UserCubit>().state.model.companyModel!.userId;
      addOpinionSubscribeModel.adsDesc = msg.text;

      addOpinionSubscribeModel.adsImages = imageCubit.state.data;
      addOpinionSubscribeModel.adsVideo = videosCubit.state.data;
      addOpinionSubscribeModel.questions = json.encode(questions);
      moveNext();
    }
  }

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
      var data = interestCubit.state.data.map((e) {
        e.selected = true;
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
    CompanyRepository(context).getPeopleInterests(refresh: false).then((data) {
      interestCubit.onUpdateData(data);
    });
    ModalHelper.showModal(
      context: context,
      title: "تحديد العملاء المهتمين",
      content: BuildInterestDialog(compOpinionSubscribeData: subscribeData),
    );
  }

  void changeRegion(CitiesModel model) {
    regionModel = model;
  }

  void selectType(String id, BuildContext context) {
    genderCubit.onUpdateData(int.parse(id));
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
        int.parse(views.text),
        addOpinionSubscribeModel.adsImages!.length,
        addOpinionSubscribeModel.adsVideo!.length,
        addOpinionQuestionCubit.state.data.length);
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
    if (data != null) {
      onSecSubscribe(context);
    }
  }

  void onSecSubscribe(BuildContext context) async {
    if (secFormKey.currentState!.validate()) {
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
          costViewCubit.state.data!.item1.toString();
      addOpinionSubscribeModel.mainPoints =
          costCubit.state.data!.item3.toString();
      addOpinionSubscribeModel.addedPoints =
          costViewCubit.state.data!.item2.toString();
      addOpinionSubscribeModel.price = value.text;
      addOpinionSubscribeModel.lang =
          context.read<LangCubit>().state.locale.languageCode;
      var data = await CompanyRepository(context)
          .addOpinionSubscribe(addOpinionSubscribeModel);
      btnKey.currentState!.animateReverse();

      idCubit.onUpdateData(data!);
      moveNext();
    }
  }

  void savePdf(BuildContext context) async {
    var data = await CompanyRepository(context).saveSpecificPdf(idCubit.state.data);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }
}
