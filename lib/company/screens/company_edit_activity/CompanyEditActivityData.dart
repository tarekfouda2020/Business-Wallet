part of 'CompanyEditActivityImports.dart';

class CompanyEditActivityData {
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<DropdownSearchState> mainField = new GlobalKey();
  final GlobalKey<DropdownSearchState> subField = new GlobalKey();
  final GenericCubit<List<DropDownSelected>> subFieldCubit =
      new GenericCubit([]);

  DropDownModel? mainFieldId;
  DropDownSelected? subFieldId;

  seInitialData(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;
    mainFieldId = DropDownModel(
        id: company!.mainFiled!.id, name: company.mainFiled!.name);
    subFieldCubit.onUpdateData(company.sub!
        .map((e) => DropDownSelected(
            id: int.parse(e.id ?? "0"), name: e.name ?? "", selected: true))
        .toList());
  }

  void onSelectMain(DropDownModel? model) {
    if (model != null) {
      mainFieldId = model;
    }
    subField.currentState!.changeSelectedItem(null);
    subFieldCubit.onUpdateData([]);
  }

  void onSelectSub(DropDownSelected? model, BuildContext context) async {
    if (model != null) {
      if (model.id == 0) {
        var all = await CompanyRepository(context)
            .getSubField(mainFieldId!.id, refresh: false);
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
          subFieldId = model;
          subFieldCubit.state.data.add(model);
          subFieldCubit.onUpdateData(subFieldCubit.state.data);
        }
      }
    }
  }

  void removeExistSub(BuildContext context, DropDownStringModel model) async {
    await CompanyRepository(context).removeImage(int.parse(model.id!), 4);
    var user = context.read<UserCubit>();
    user.state.model.companyModel!.sub!.remove(model);
    user.onUpdateUserData(user.state.model);
  }

  void onDeleteSub(BuildContext context, DropDownSelected? model) {
    if (model != null) {
      subFieldId = model;
      subFieldCubit.state.data.remove(model);
      subFieldCubit.onUpdateData(subFieldCubit.state.data);
      subField.currentState!.clear();
    }
  }

  saveImportantData(BuildContext context) async {
    var company = context.read<UserCubit>().state.model.companyModel;
    String ids = subFieldCubit.state.data
        .where((element) => element.id != 0)
        .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
    btnKey.currentState!.animateForward();
    await CompanyRepository(context)
        .saveField("${mainFieldId?.id}", ids, company!.userId);
    btnKey.currentState!.animateReverse();
  }
}
