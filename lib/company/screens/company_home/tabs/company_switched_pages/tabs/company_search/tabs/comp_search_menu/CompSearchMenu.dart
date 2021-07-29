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
    BuildContext cxt = widget.companySearchData.scaffold.currentContext!;
    widget.companySearchData.fetchPage(1, cxt, refresh: false);
    widget.companySearchData.pagingController.addPageRequestListener((pageKey) {
      widget.companySearchData.fetchPage(pageKey, cxt);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: PagedGridView<int, MainModel>(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(),
          itemBuilder: (context, item, index) => BuildMainItem(
            mainModel: item,
            checkFollow: false,
          ),
        ),
      ),
    );
  }
}
