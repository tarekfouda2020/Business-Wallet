part of 'CompBrochureSubscribeImports.dart';

class CompBrochureSubscribeData {
  late final PageController controller;
  final GenericCubit<int> subscribeCubit = new GenericCubit(0);
  double baseCost = 0;

  final GenericCubit<CostSubscribeModel?> costCubit = new GenericCubit(null);
  final GenericCubit<ExtraCostModel?> costViewCubit = new GenericCubit(null);
  final GenericCubit<double?> finalCostCubit = new GenericCubit(0.0);

  final GenericCubit<double> costChangeCubit = new GenericCubit(0.0);
  final GenericCubit<double> costViewChangeCubit = new GenericCubit(0.0);

  void moveNext() {
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

  void fetchBrochureData(BuildContext context) async {
    var data = await CompanyRepository(context).getBrochureDetails();
    brochureDataCubit.onUpdateData(data);
  }

  void navigateToSec(BuildContext context, int id) {
    if (id == 0) {
      return LoadingDialog.showCustomToast("من فضلك ادخل بيانات البروشور اولا");
    } else {
      moveNext();
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

  void onDeleteSub(BuildContext context, DropDownSelected? model, int index) {
    if (model != null) {
      subFieldId = model.id;
      subFieldCubit.state.data.remove(model);
      subFieldCubit.onUpdateData(subFieldCubit.state.data);
      subField.currentState!.clear();
    }
  }

  void getCostSubscribe(BuildContext context) async {
    var data = await CompanyRepository(context)
        .getCostBrochureSubscribe(int.parse(brochure.text));
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
    finalCostCubit.onUpdateData(data);
  }


  void navigateToThird(BuildContext context){
    getFinalCostSubscribe(context);
    moveNext();
  }
}
