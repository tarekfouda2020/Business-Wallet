part of 'FavoritesImports.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final FavoritesData favoritesData = new FavoritesData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        title: "مفضلتي",
        search: BuildFavSearch(
          favoritesData: favoritesData,
        ),
        body: Column(
          children: [
            BuildChangeView(),
            Flexible(
              child: TabBarView(
                children: [
                  FavoritesView(
                    favoritesData: favoritesData,
                  ),
                  FavoritesView(
                    favoritesData: favoritesData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
