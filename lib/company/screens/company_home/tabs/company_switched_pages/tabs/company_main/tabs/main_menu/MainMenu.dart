part of 'MainMenuImports.dart';

class MainMenu extends StatefulWidget {
  final CompanyMainData companyMainData;

  const MainMenu({required this.companyMainData});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    BuildContext cxt = widget.companyMainData.scaffold.currentContext!;
    widget.companyMainData.fetchPage(1, cxt, refresh: false);
    widget.companyMainData.pagingController.addPageRequestListener((pageKey) {
      widget.companyMainData.fetchPage(pageKey, cxt);
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
        pagingController: widget.companyMainData.pagingController,
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
