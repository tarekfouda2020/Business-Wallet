part of 'CompBrochureSubscribeImports.dart';

class CompBrochureSubscribeData {
  late final PageController controller;
  final GenericCubit<int> subscribeCubit = new GenericCubit(0);
  double baseCost = 0;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<int> idCubit = new GenericCubit(0);

  final GenericCubit<CostSubscribeModel?> costCubit = new GenericCubit(null);
  final GenericCubit<ExtraCostModel?> costViewCubit = new GenericCubit(null);
  final GenericCubit<double?> finalCostCubit = new GenericCubit(0.0);

  final GenericCubit<double> costChangeCubit = new GenericCubit(0.0);
  final GenericCubit<double> costViewChangeCubit = new GenericCubit(0.0);

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
  final GenericCubit<BrochureDetailsModel?> brochureDataCubit =
      new GenericCubit(null);

  void fetchBrochureData(BuildContext context, {bool refresh=true}) async {
    var data = await CompanyRepository(context).getBrochureDetails(refresh);
    brochureDataCubit.onUpdateData(data);
  }

  void navigateToSec(BuildContext context, int id) {
    if (id == 0) {
      return LoadingDialog.showCustomToast("من فضلك ادخل بيانات البروشور اولا");
    } else {
      moveNext(context);
    }
  }

//second page

  final GlobalKey<DropdownSearchState> mainField = new GlobalKey();
  final GlobalKey<DropdownSearchState> subField = new GlobalKey();
  final GenericCubit<List<DropDownSelected>> subFieldCubit =
      new GenericCubit([]);
  final GlobalKey<DropdownSearchState> city = new GlobalKey();

  final TextEditingController brochure = new TextEditingController();
  final TextEditingController extraCost = new TextEditingController();

  CitiesModel? regionModel;

  int? mainFieldId;
  int? subFieldId;

  void changeRegion(CitiesModel model) {
    regionModel = model;
  }

  void onSelectMain(DropDownModel? model) {
    if (model != null) {
      mainFieldId = model.id;
    }
    subField.currentState!.changeSelectedItem(null);
    subFieldCubit.onUpdateData([]);
  }

  void onSelectSub(DropDownSelected? model, BuildContext context) async {
    if (model != null) {
      if (model.id == 0) {
        var all = await CompanyRepository(context)
            .getSubField(mainFieldId!, refresh: false);
        subFieldCubit.state.data.clear();
        all.removeAt(0);
        subFieldCubit.state.data.addAll(all);
        subFieldCubit.onUpdateData(subFieldCubit.state.data);
      } else {
        var exist =
            subFieldCubit.state.data.where((e) => e.id == model.id).toList();
        if (exist.length > 0) {
          return LoadingDialog.showSimpleToast(
              "لا يمكن اختيار نفس النشاط الفرعي");
        } else {
          subFieldId = model.id;
          subFieldCubit.state.data.add(model);
          subFieldCubit.onUpdateData(subFieldCubit.state.data);
        }
      }
    }
  }

  void onDeleteSub(BuildContext context, DropDownSelected? model, int index) {
    if (model != null) {
      subFieldId = model.id;
      subFieldCubit.state.data.remove(model);
      subFieldCubit.onUpdateData(subFieldCubit.state.data);
      subField.currentState!.clear();
    }
  }

  void getCostSubscribe(BuildContext context) async {
    var data = await CompanyRepository(context).getCostBrochureSubscribe(
        int.parse(Utils.convertDigitsToLatin(brochure.text)));
    baseCost = data?.item1 ?? 0;
    costCubit.onUpdateData(data);
    costChangeCubit.onUpdateData(data!.item1);
    costViewChangeCubit.onUpdateData(data.item3);
  }

  void getExtraCostSubscribe(BuildContext context, int price) async {
    var data = await CompanyRepository(context)
        .getExtraCostSubscribe(costCubit.state.data!.item2.toInt(), price);
    costViewCubit.onUpdateData(data);
    baseCost = data?.item1 ?? 0;

    costChangeCubit.onUpdateData(data!.item1);
    costViewChangeCubit.onUpdateData(data.item2);
  }

  void getFinalCostSubscribe(BuildContext context) async {
    var data = await CompanyRepository(context).finalCost(baseCost);
    if (data != null) {
      finalCostCubit.onUpdateData(data);
      moveNext(context);
    }
  }

  void navigateToThird(BuildContext context) {
    onBrochureSubscribe(context);
  }

  void onBrochureSubscribe(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (subFieldCubit.state.data.length == 0) {
        LoadingDialog.showSimpleToast("من فضلك ادخل الانشطة الفرعية");
        return;
      }

      // if (extraCost.text.trim().isEmpty) {
      //   LoadingDialog.showSimpleToast("من فضلك ادخل المبلغ");
      //   return;
      // }
      //
      // if (costCubit.state.data == null) {
      //   LoadingDialog.showSimpleToast("جاري عمل بعض الحسابات");
      //   return;
      // }
      btnKey.currentState!.animateForward();
      AddBrochureSubscribeModel addBrochureSubscribeModel =
          new AddBrochureSubscribeModel(
        userId: context.read<UserCubit>().state.model.companyModel!.userId,
        businessCardId: brochureDataCubit.state.data!.businessId.toString(),
        fkMainField: mainFieldId.toString(),
        numberCard: brochure.text,
        fkCity: regionModel?.id.toString(),
        price: extraCost.text,
        typePayment: "1",
        allSubField: subFieldCubit.state.data
            .where((element) => element.id != 0)
            .fold("", (prev, e) => "$prev" + "${e.id}" + ","),
        mainCost: costCubit.state.data!.item1.toString(),
        addedCost: costViewCubit.state.data?.item1.toString() ?? "0",
        mainPoints: costCubit.state.data!.item3.toString(),
        addedPoints: costViewCubit.state.data?.item2.toString() ?? "0",
        lang: context.read<LangCubit>().state.locale.languageCode,
      );

      var data = await CompanyRepository(context)
          .addBrochureSubscribe(addBrochureSubscribeModel);
      btnKey.currentState!.animateReverse();

      if (data) {
        getFinalCostSubscribe(context);
      }
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
