part of 'CompanyInterestsImports.dart';

class CompanyInterestData {
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericCubit<List<CompInterestModel>> interestCubit =
      new GenericCubit([]);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getInterest();
    data.insert(0, CompInterestModel(id: 0, name: "الكل", active: false));
    interestCubit.onUpdateData(data);
  }

  onItemChanged(int id, int index) {
    if (id == 0) {
      var value = interestCubit.state.data[index].active;
      var data = interestCubit.state.data.map((e) {
        e.active = !value;
        return e;
      }).toList();
      interestCubit.onUpdateData(data);
      return;
    }
    interestCubit.state.data[index].active =
        !interestCubit.state.data[index].active;
    interestCubit.onUpdateData(interestCubit.state.data);
  }

  saveImportantData(BuildContext context) async {
    String ids = interestCubit.state.data
        .where((element) => element.active && element.id != 0)
        .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
    if (ids == "") {
      return LoadingDialog.showSimpleToast("حدد اهتمامتك");
    } else {
      btnKey.currentState!.animateForward();
      await CompanyRepository(context).saveInterest(ids);
      btnKey.currentState!.animateReverse();
    }
  }
}
