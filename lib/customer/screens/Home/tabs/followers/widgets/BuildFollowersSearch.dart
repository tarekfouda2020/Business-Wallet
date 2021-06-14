part of 'FollowersWidgetsImports.dart';

class BuildFollowersSearch extends StatelessWidget {
  final FollowersData followersData;

  const BuildFollowersSearch({required this.followersData}) ;
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
            onChange: (CitiesModel value) => followersData.onSelectCities(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<UserInterestModel>(
            label: "الاهتمامات",
            validate: (UserInterestModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
            await CustomerRepository(context).getInterest(),
            onChange: (UserInterestModel value) => followersData.onSelectInterest(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<FilterModel>(
            label: "أخرى",
            validate: (FilterModel value) => value.validateDropDown(context),
            useName: true,
            data: FilterModel.filters,
            onChange: (FilterModel value) => followersData.selectType(value),
          ),
        ),
        InkWell(
          onTap: ()=>followersData.pagingController.refresh(),
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
