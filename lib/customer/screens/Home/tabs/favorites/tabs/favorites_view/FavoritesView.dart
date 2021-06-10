part of 'FavoritesViewImports.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final FavoritesViewData favoritesViewData = new FavoritesViewData();

  @override
  void initState() {
    favoritesViewData.pagingController.addPageRequestListener((pageKey) {
      favoritesViewData.fetchPage(pageKey, 0, 0, "M", context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, FavoriteModel>(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: favoritesViewData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<FavoriteModel>(
        itemBuilder: (context, item, index) => BuildFavoritesItem(
          favoriteModel: item,
          checkInvite: false,
        ),
      ),
    );
  }
}
