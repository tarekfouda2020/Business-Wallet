part of 'FavoritesViewImports.dart';

class FavoritesView extends StatefulWidget {
  final FavoritesData favoritesData;

  const FavoritesView({required this.favoritesData});

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final FavoritesData favoritesData = new FavoritesData();

  @override
  void initState() {
    widget.favoritesData.fetchPage(1, context, refresh: false);
    widget.favoritesData.pagingController.addPageRequestListener((pageKey) {
      widget.favoritesData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildChangeView2(
          onTap: (tab)=>widget.favoritesData.pagesCubit.onUpdateData(tab),
        ),
        Flexible(
          child: PagedListView<int, FavoriteModel>(
            pagingController: widget.favoritesData.pagingController,
            builderDelegate: PagedChildBuilderDelegate<FavoriteModel>(
              noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(),
              itemBuilder: (context, item, index) => BuildFavoritesItem(
                favoriteModel: item,
                checkInvite: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
