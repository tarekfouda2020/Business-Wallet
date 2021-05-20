part of 'FavoritesImports.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: "مفضلتي",
      search: BuildFavSearch(),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 55),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: 3,
        itemBuilder: (_, index){
          return BuildFavoritesItem();
        },
      ),
    );
  }
}
