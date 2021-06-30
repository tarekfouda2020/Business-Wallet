part of 'CompanyRegisterInterestsImports.dart';

class CompanyRegisterInterestsData {
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GlobalKey<DropdownSearchState> mainField = new GlobalKey();
  final GlobalKey<DropdownSearchState> subField = new GlobalKey();
  final GenericCubit<List<DropDownSelected>> subFieldCubit =
      new GenericCubit([]);

  int? mainFieldId;
  int? subFieldId;

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

  saveImportantData(BuildContext context, String userId) async {
    String ids = subFieldCubit.state.data
        .where((element) => element.id != 0)
        .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
    btnKey.currentState!.animateForward();
    await CompanyRepository(context)
        .saveField(mainFieldId.toString(), ids, userId);
    btnKey.currentState!.animateReverse();
  }
}
