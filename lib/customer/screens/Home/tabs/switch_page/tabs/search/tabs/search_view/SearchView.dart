part of 'SearchViewImports.dart';

class SearchView extends StatefulWidget {
  final SearchData searchData;

  const SearchView({required this.searchData});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    widget.searchData.pagingController.addPageRequestListener((pageKey) {
      widget.searchData.fetchPage(pageKey, context);
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
        pagingController: widget.searchData.pagingController,
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
