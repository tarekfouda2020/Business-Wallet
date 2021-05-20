part of 'SearchImports.dart';

class Search extends StatefulWidget {
  final Function()? onTap;
  const Search({this.onTap});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchData searchData = SearchData();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        search: BuildSearchDrops(),
        searchOnTap: widget.onTap,
        // searchOnTap: () => AutoRouter.of(context).pop(),
        body: Column(
          children: [
            BuildSearchChangeView(
              searchData: searchData,
            ),
            Flexible(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BuildSearchView(),
                  BuildSearchView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
