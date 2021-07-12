part of 'MainPageWidgetsImports.dart';

class BuildMainSearch extends StatelessWidget {
  final MainPageData mainPageData;

  BuildMainSearch({required this.mainPageData});

  @override
  Widget build(BuildContext context) {
    String userId = context.read<UserCubit>().state.model.customerModel!.userId;

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
            onChange: (CitiesModel value) => mainPageData.onSelectCities(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<UserInterestModel>(
            label: "الاهتمامات",
            validate: (UserInterestModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
                await CustomerRepository(context).getInterest(userId),
            onChange: (UserInterestModel value) => mainPageData.onSelectInterest(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<FilterModel>(
            label: "أخرى",
            validate: (FilterModel value) => value.validateDropDown(context),
            useName: true,
            data: FilterModel.filters,
            onChange: (FilterModel value) => mainPageData.selectType(value),
          ),
        ),
        InkWell(
          onTap: ()=>mainPageData.refreshCurrentPage(context,mainPageData),
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
