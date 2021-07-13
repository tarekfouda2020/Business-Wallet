part of 'SearchImports.dart';

class Search extends StatefulWidget {
  final Function()? onTap;

  const Search({this.onTap});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  final SearchData searchData = SearchData();

  @override
  void initState() {
    super.initState();
    searchData.tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        scaffold: searchData.scaffold,
        search: BuildSearchDrops(
          searchData: searchData,
        ),
        searchOnTap: widget.onTap,
        body: Column(
          children: [
            BuildSearchChangeView(searchData: searchData),
            Flexible(
              child: TabBarView(
                controller: searchData.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SearchView(searchData: searchData),
                  MapScreen(searchData: searchData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
