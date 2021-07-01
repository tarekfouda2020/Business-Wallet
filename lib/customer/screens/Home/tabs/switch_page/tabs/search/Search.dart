part of 'SearchImports.dart';



class Search extends StatefulWidget {
  final Function()? onTap;

  const Search({this.onTap});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SearchData searchData = SearchData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        search: BuildSearchDrops(
          searchData: searchData,
        ),
        searchOnTap: widget.onTap,
        body: Column(
          children: [
            BuildSearchChangeView(searchData: searchData),
            Flexible(
              child: TabBarView(
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
