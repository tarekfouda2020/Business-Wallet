part of 'CompFollowersWidgetsImport.dart';

class BuildSelectedTabView extends StatelessWidget {
  final CompanyFollowersData companyFollowersData;

  const BuildSelectedTabView({required this.companyFollowersData});
  @override
  Widget build(BuildContext context) {
    String userId = context.read<UserCubit>().state.model.companyModel!.userId;

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
            onChange: (CitiesModel value) => companyFollowersData.onSelectCities(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<UserInterestModel>(
            label: "الاهتمامات",
            validate: (UserInterestModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
            await CustomerRepository(context).getInterest(userId),
            onChange: (UserInterestModel value) => companyFollowersData.onSelectInterest(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<FilterModel>(
            label: "أخرى",
            validate: (FilterModel value) => value.validateDropDown(context),
            useName: true,
            data: FilterModel.filters,
            onChange: (FilterModel value) => companyFollowersData.selectType(value),
          ),
        ),
        InkWell(
          onTap: ()=>companyFollowersData.pagingController.refresh(),
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
