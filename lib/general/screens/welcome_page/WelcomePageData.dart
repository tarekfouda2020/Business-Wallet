part of 'WelcomePageImports.dart';

class WelcomePageData {
  GenericCubit<int> pagesCubit = new GenericCubit(0);
  List<Widget> data = [];

  initPagesData(IntroModel? introModel) {
    data = [
      BuildPageView(
        key: Key("1"),
        model: WelcomeModel(
            desc: introModel!.kayanOne,
            image: Res.on1,
            index: 0,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("2"),
        model: WelcomeModel(
            desc: introModel.kayanTwo,
            image: Res.on2,
            index: 1,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("3"),
        model: WelcomeModel(
            desc: introModel.kayanThree,
            image: Res.on3,
            index: 2,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("4"),
        model: WelcomeModel(
            desc: introModel.kayanFour,
            image: Res.onProv1,
            index: 3,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("5"),
        model: WelcomeModel(
            desc: introModel.kayanFive,
            image: Res.onProv2,
            index: 4,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("6"),
        model: WelcomeModel(
            desc: introModel.kayanSex,
            image: Res.onProv3,
            last: true,
            index: 5,
            pageCubit: pagesCubit),
      ),
    ];
  }
}
