part of 'FavWidgetsImports.dart';

class BuildFavSearch extends StatelessWidget {
  final FavoritesData favoritesData;

  const BuildFavSearch({required this.favoritesData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FutureBottomSheet<CitiesModel>(
            label: "المنطقة",
            validate: (CitiesModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
                await CustomerRepository(context).getCities(3),
            onChange: (CitiesModel value) =>
                favoritesData.onSelectCities(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<UserInterestModel>(
            label: "الاهتمامات",
            validate: (UserInterestModel value) =>
                value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
                await CustomerRepository(context).getInterest(),
            onChange: (UserInterestModel value) =>
                favoritesData.onSelectInterest(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<FilterModel>(
            label: "أخرى",
            validate: (FilterModel value) => value.validateDropDown(context),
            useName: true,
            data: FilterModel.favoriteFilters,
            onChange: (FilterModel value) => favoritesData.selectType(value),
          ),
        ),
        InkWell(
          onTap: () {
            favoritesData.pagingController.refresh();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: MyText(
              title: "البحث",
              size: 10,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
