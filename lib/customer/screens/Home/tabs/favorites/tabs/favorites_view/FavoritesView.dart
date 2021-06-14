part of 'FavoritesViewImports.dart';

class FavoritesView extends StatefulWidget {
final FavoritesData favoritesData;

  const FavoritesView({required this.favoritesData}) ;
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  @override
  void initState() {
    widget.favoritesData.pagingController.addPageRequestListener((pageKey) {
      widget.favoritesData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, FavoriteModel>(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController:  widget.favoritesData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<FavoriteModel>(
        itemBuilder: (context, item, index) => BuildFavoritesItem(
          favoriteModel: item,
          checkInvite: false,
        ),
      ),
    );
  }
}
