part of 'MainViewImports.dart';

class BuildMainPageView extends StatefulWidget {
  @override
  _BuildMainPageViewState createState() => _BuildMainPageViewState();
}

class _BuildMainPageViewState extends State<BuildMainPageView> {
  final MainViewData mainViewData = new MainViewData();

  @override
  void initState() {
    mainViewData.pagingController.addPageRequestListener((pageKey) {
      mainViewData.fetchPage(pageKey, context);
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
        pagingController: mainViewData.pagingController,
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
