part of 'SearchViewImports.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchViewData searchViewData = new SearchViewData();

  @override
  void initState() {
    searchViewData.pagingController.addPageRequestListener((pageKey) {
      searchViewData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: PagedGridView<int, MainModel>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: searchViewData.pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<MainModel>(
          itemBuilder: (context, item, index) => BuildProviderItem(
            mainModel: item,
            checkFollow: false,
          ),
        ),
      ),
    );
  }
}
