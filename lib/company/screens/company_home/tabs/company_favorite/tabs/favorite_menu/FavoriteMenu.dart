part of 'FavoriteMenuImports.dart';

class FavoriteMenu extends StatefulWidget {
  final CompanyFavoriteData companyFavoriteData;

  const FavoriteMenu({required this.companyFavoriteData});

  @override
  _FavoriteMenuState createState() => _FavoriteMenuState();
}

class _FavoriteMenuState extends State<FavoriteMenu> {
  @override
  void initState() {
    widget.companyFavoriteData.fetchPage(1, context,refresh: false);
    widget.companyFavoriteData.pagingController
        .addPageRequestListener((pageKey) {
      widget.companyFavoriteData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, CompFavoriteModel>(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: widget.companyFavoriteData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<CompFavoriteModel>(
        itemBuilder: (context, item, index) => BuildFavItem(
          favoriteModel: item,
        ),
      ),
    );
  }
}
