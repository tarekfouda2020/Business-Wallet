part of 'SearchImports.dart';

class Search extends StatefulWidget {
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
        searchOnTap: ()=> AutoRouter.of(context).pop(),
        body: Column(
          children: [
            BuildSearchChangeView(searchData: searchData,),
            Flexible(
              child: TabBarView(
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
