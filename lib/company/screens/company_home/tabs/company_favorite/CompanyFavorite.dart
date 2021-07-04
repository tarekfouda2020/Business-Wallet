part of 'CompanyFavoriteImports.dart';

class CompanyFavorite extends StatefulWidget {
  @override
  _CompanyFavoriteState createState() => _CompanyFavoriteState();
}

class _CompanyFavoriteState extends State<CompanyFavorite> {
  final CompanyFavoriteData companyFavoriteData = new CompanyFavoriteData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        title: "مفضلتي",
        search: BuildSelectedTabView(companyFavoriteData: companyFavoriteData,),
        body: Column(
          children: [
            BuildMenuView(companyFavoriteData: companyFavoriteData),
            Flexible(
              child: TabBarView(
                children: [
                  FavoriteMenu(companyFavoriteData: companyFavoriteData),
                  FavoriteMap(companyFavoriteData: companyFavoriteData)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
