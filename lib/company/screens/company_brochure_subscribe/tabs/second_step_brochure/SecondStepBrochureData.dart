part of 'SecondStepBrochureImports.dart';

class SecondStepBrochureData {
  final GlobalKey<DropdownSearchState> region = new GlobalKey();
  final TextEditingController regionId = new TextEditingController();
  final TextEditingController brochureNum = new TextEditingController();
  final TextEditingController extraNum = new TextEditingController();

  final GlobalKey<DropdownSearchState> mainField = new GlobalKey();
  final GlobalKey<DropdownSearchState> subField = new GlobalKey();
  final GenericCubit<List<DropDownSelected>> subFieldCubit =
      new GenericCubit([]);

  int? mainFieldId;
  int? subFieldId;

  void changeRegion(DropDownModel model) {
    regionId.text = model.id.toString();
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
}
