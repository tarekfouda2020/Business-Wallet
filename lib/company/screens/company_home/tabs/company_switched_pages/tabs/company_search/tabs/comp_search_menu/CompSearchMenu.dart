part of 'CompSearchMenuImports.dart';

class CompSearchMenu extends StatefulWidget {
  final CompanySearchData companySearchData;

  const CompSearchMenu({required this.companySearchData});

  @override
  _CompSearchMenuState createState() => _CompSearchMenuState();
}

class _CompSearchMenuState extends State<CompSearchMenu> {
  @override
  void initState() {
    widget.companySearchData.pagingController.addPageRequestListener((pageKey) {
      widget.companySearchData.fetchPage(pageKey, context);
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
        pagingController: widget.companySearchData.pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate<MainModel>(
          itemBuilder: (context, item, index) => BuildMainItem(
            mainModel: item,
            checkFollow: false,

          ),
        ),
      ),
    );
  }
}
