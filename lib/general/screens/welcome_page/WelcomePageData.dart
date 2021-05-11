part of 'WelcomePageImports.dart';

class WelcomePageData {
  GenericCubit<int> pagesCubit = new GenericCubit(0);
  List<Widget> data = [];
  late PageController pgController;

  initPagesData() {
    data = [
      BuildPageView(
        key: Key("1"),
        model: WelcomeModel(
            desc:
                "introModel.introOneintroModel.introOneintroModel.introOne introModel.introOne ",
            image: Res.on1,
            index: 0,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("2"),
        model: WelcomeModel(
            desc: "introModel.introTwo",
            image: Res.on2,
            index: 1,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("3"),
        model: WelcomeModel(
            desc: "introModel.introThree",
            image: Res.on3,
            index: 2,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("4"),
        model: WelcomeModel(
            desc: "introModel.introThree",
            image: Res.onProv1,
            index: 3,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: Key("5"),
        model: WelcomeModel(
            desc: "introModel.introThree",
            image: Res.onProv2,
            last: true,
            index: 4,
            pageCubit: pagesCubit),
      )
    ];
  }
}
