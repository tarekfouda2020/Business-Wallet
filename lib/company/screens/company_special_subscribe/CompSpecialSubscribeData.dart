part of 'CompSpecialSubscribeImports.dart';

class CompSpecialSubscribeData {
  late final PageController controller;
  final GenericCubit<int> subscribeCubit = new GenericCubit(0);
  final AddSpecialSubscribeModel addSpecialSubscribeModel =
      new AddSpecialSubscribeModel();

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GenericCubit<double> baseCostCubit = new GenericCubit(0.0);

  void moveNext() {
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void moveBack() {
    controller.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  final GenericCubit<String> dateCubit = GenericCubit("");
  final GenericCubit<List<DropDownSelected>> interestCubit =
      new GenericCubit([]);
  final TextEditingController startDate = new TextEditingController();
  final TextEditingController interest = new TextEditingController();
  final GlobalKey<DropdownSearchState> days = new GlobalKey();

  final GlobalKey<DropdownSearchState> city = new GlobalKey();
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
  DropDownModel? daysModel;

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
      BuildContext context, CompSpecialSubscribeData subscribeData) {
    CompanyRepository(context).getPeopleInterests(refresh: false).then((data) {
      interestCubit.onUpdateData(data);
    });
    ModalHelper.showModal(
      context: context,
      title: "تحديد العملاء المهتمين",
      content: BuildShowInterestDialog(subscribeData: subscribeData),
    );
  }

  void changeRegion(CitiesModel model) {
    regionModel = model;
  }

  void changeDays(DropDownModel model) {
    daysModel = model;
    var data = model.id * 1207.5;
    baseCostCubit.onUpdateData(data);
  }

  void onSpecialSubscribe(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();

      addSpecialSubscribeModel.userId =
          context.read<UserCubit>().state.model.companyModel!.userId;
      addSpecialSubscribeModel.startTime = dateCubit.state.data;
      addSpecialSubscribeModel.interests = interestCubit.state.data
          .where((element) => element.selected && element.id != 0)
          .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
      addSpecialSubscribeModel.interestsNames=interestCubit.state.data
          .where((element) => element.selected && element.id != 0)
          .fold("", (prev, e) => "$prev" + "${e.name}" + ",");
      addSpecialSubscribeModel.fkCity = regionModel?.id.toString();
      addSpecialSubscribeModel.fkCityName=regionModel?.name;
      addSpecialSubscribeModel.dayShow = daysModel?.id.toString();
      addSpecialSubscribeModel.cost = baseCostCubit.state.data;
      addSpecialSubscribeModel.age = "30-1";
      addSpecialSubscribeModel.lang =
          context.read<LangCubit>().state.locale.languageCode;

      var data = await CompanyRepository(context)
          .addSpecialSubscribe(addSpecialSubscribeModel);
      btnKey.currentState!.animateReverse();
      idCubit.onUpdateData(data!);
      moveNext();
    }
  }

  void savePdf(BuildContext context) async {
    var data = await CompanyRepository(context).savePdf(idCubit.state.data);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }
}
