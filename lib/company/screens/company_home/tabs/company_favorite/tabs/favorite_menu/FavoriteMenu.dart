part of 'FavoriteMenuImports.dart';

class FavoriteMenu extends StatefulWidget {
  @override
  _FavoriteMenuState createState() => _FavoriteMenuState();
}

class _FavoriteMenuState extends State<FavoriteMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      itemCount: 2,
      itemBuilder: (_, index) {
        return BuildFavItem();
      },
    );
  }
}
