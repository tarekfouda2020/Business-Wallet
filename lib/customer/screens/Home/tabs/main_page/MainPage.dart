part of 'MainPageImports.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
          search: BuildMainSearch(),
          body: Column(
            children: [
              BuildChangeView(),
              Flexible(
                child: TabBarView(
                  children: [
                    BuildMainPageView(),
                    BuildMainPageView(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
