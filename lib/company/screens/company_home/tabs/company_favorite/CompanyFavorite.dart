part of 'CompanyFavoriteImports.dart';

class CompanyFavorite extends StatefulWidget {
  @override
  _CompanyFavoriteState createState() => _CompanyFavoriteState();
}

class _CompanyFavoriteState extends State<CompanyFavorite>
    with SingleTickerProviderStateMixin {
  final CompanyFavoriteData companyFavoriteData = new CompanyFavoriteData();

  @override
  void initState() {
    companyFavoriteData.pageController =
        new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: MyColors.darken,
        appBar: BuildAppBar(
          companyFavoriteData: companyFavoriteData,
        ),
        body: Column(
          children: [
            BuildMenuView(
              companyFavoriteData: companyFavoriteData,
            ),
            Flexible(
              child: TabBarView(
                children: [
                  FavoriteMenu(),
                  FavoriteMap(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
