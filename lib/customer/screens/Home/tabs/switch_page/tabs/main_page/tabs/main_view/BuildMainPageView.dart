part of 'MainViewImports.dart';

class BuildMainPageView extends StatefulWidget {
  final MainPageData mainPageData;
  final GlobalKey<ScaffoldState> scaffold;
  const BuildMainPageView({required this.mainPageData, required this.scaffold});

  @override
  _BuildMainPageViewState createState() => _BuildMainPageViewState();
}

class _BuildMainPageViewState extends State<BuildMainPageView> {
  @override
  void initState() {
    widget.mainPageData.fetchPage(1, widget.scaffold.currentContext!, refresh: false);
    widget.mainPageData.pagingController.addPageRequestListener((pageKey) {
      widget.mainPageData.fetchPage(pageKey, widget.scaffold.currentContext!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: PagedGridView<int, MainModel>(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: widget.mainPageData.pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<MainModel>(
          noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(),
          itemBuilder: (context, item, index) => BuildProviderItem(
            mainModel: item,
            checkFollow: false,
          ),
        ),
      ),
    );
  }
}
