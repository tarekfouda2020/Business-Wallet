part of 'MainPageImports.dart';

class MainPage extends StatefulWidget {
  final Function()? onTap;

  const MainPage({this.onTap});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final MainPageData mainPageData = new MainPageData();


  @override
  void initState() {
    super.initState();
    mainPageData.tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        scaffold: mainPageData.scaffold,
        search: BuildMainSearch(
          mainPageData: mainPageData,
        ),
        searchOnTap: widget.onTap,
        body: Column(
          children: [
            BuildChangeView(tabController: mainPageData.tabController,),
            Flexible(
              child: TabBarView(
                controller: mainPageData.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BuildMainPageView(mainPageData: mainPageData, scaffold: mainPageData.scaffold,),
                  MapScreen(mainPageData: mainPageData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
