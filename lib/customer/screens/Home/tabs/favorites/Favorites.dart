part of 'FavoritesImports.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final FavoritesData favoritesData = new FavoritesData();

  @override
  void initState() {
    super.initState();
    favoritesData.initPagesData(favoritesData);
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      scaffold: favoritesData.scaffold,
      title: "مفضلتي",
      search: BuildFavSearch(
        favoritesData: favoritesData,
      ),
      body: BlocBuilder<GenericCubit<int>, GenericState<int>>(
        bloc: favoritesData.pagesCubit,
        builder: (_, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300),
            child: favoritesData.data[state.data],
            transitionBuilder: (child, animation) {
              return FadeTransition(
                child: child,
                opacity: animation,
              );
            },
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
