part of 'ImportantWidgets.dart';

class ImportantData {
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericCubit<List<UserInterestModel>> interestCubit =
      new GenericCubit([]);
  final GenericCubit<IntroModel?> introCubit = new GenericCubit(null);

  void fetchData(BuildContext context, String userId) async {
    var data = await CustomerRepository(context).getInterest(userId);
    data.insert(0, UserInterestModel(id: 0, name: "الكل", choose: false));
    interestCubit.onUpdateData(data);
  }

  void fetchIntro(BuildContext context, {bool refresh = true}) async {
    var data = await GeneralRepository(context).getIntro(refresh: refresh);
    introCubit.onUpdateData(data);
  }

  onItemChanged(int id, int index) {
    if (id == 0) {
      var value = interestCubit.state.data[index].choose;
      var data = interestCubit.state.data.map((e) {
        e.choose = !value;
        return e;
      }).toList();
      interestCubit.onUpdateData(data);
      return;
    }
    interestCubit.state.data[index].choose =
        !interestCubit.state.data[index].choose;
    interestCubit.onUpdateData(interestCubit.state.data);
  }

  saveImportantData(BuildContext context, String userId) async {
    String ids = interestCubit.state.data
        .where((element) => element.choose && element.id != 0)
        .fold("", (prev, e) => "$prev" + "${e.id}" + ",");
    if (ids == "") {
      return LoadingDialog.showSimpleToast("حدد اهتمامتك");
    } else {
      btnKey.currentState!.animateForward();
      final String id = ids.substring(0, ids.length - 1);
      await CustomerRepository(context).saveInterest(id, userId);
      btnKey.currentState!.animateReverse();
    }
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
