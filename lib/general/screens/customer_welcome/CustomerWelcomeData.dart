part of 'CustomerWelcomeImports.dart';

class CustomerWelcomeData {
  GenericCubit<int> pagesCubit = new GenericCubit(0);
  List<Widget> data = [];
  late PageController pgController;

  initPagesData({required IntroModel introModel}) {
    data = [
      BuildCustomerPageView(
        key: Key("1"),
        model: WelcomeModel(
            desc: introModel.textStepOneUser,
            image: Res.on1,
            index: 0,
            pageCubit: pagesCubit),
      ),
      BuildCustomerPageView(
        key: Key("2"),
        model: WelcomeModel(
            desc: introModel.textStepTwoUser,
            image: Res.on2,
            index: 1,
            pageCubit: pagesCubit),
      ),
      BuildCustomerPageView(
        key: Key("3"),
        model: WelcomeModel(
            desc: introModel.textStepThreeUser,
            image: Res.on3,
            index: 2,
            pageCubit: pagesCubit),
      ),
      BuildCustomerPageView(
        key: Key("4"),
        model: WelcomeModel(
            desc: introModel.textStepFourUser,
            image: Res.onUser4,
            index: 3,
            last: true,
            pageCubit: pagesCubit),
      ),
    ];
  }
}
