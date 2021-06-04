part of 'MainPageImports.dart';

class MainPage extends StatefulWidget {
  final Function()? onTap;

  const MainPage({this.onTap});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageData mainPageData = new MainPageData();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        search: BuildMainSearch(mainPageData: mainPageData,),
        searchOnTap: widget.onTap,
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
        ),
      ),
    );
  }
}
