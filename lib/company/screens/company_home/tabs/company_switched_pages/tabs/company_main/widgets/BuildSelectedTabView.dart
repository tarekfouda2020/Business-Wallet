part of 'CompMainWidgetsImports.dart';

class BuildSelectedTabView extends StatelessWidget {
  final CompanyMainData companyMainData;

  const BuildSelectedTabView({required this.companyMainData}) ;
  @override
  Widget build(BuildContext context) {
    String userId = context.read<UserCubit>().state.model.companyModel!.userId;

    return Row(
      children: <Widget>[
        Flexible(
          child: FutureBottomSheet<CitiesModel>(
            label: "المنطقة",
            validate: (CitiesModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
            await CompanyRepository(context).getCompCities(3),
            onChange: (CitiesModel value) => companyMainData.onSelectCities(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<UserInterestModel>(
            label: "الاهتمامات",
            validate: (UserInterestModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
            await CustomerRepository(context).getInterest(userId),
            onChange: (UserInterestModel value) => companyMainData.onSelectInterest(value),
          ),
        ),
        Flexible(
          child: FutureBottomSheet<FilterModel>(
            label: "أخرى",
            validate: (FilterModel value) => value.validateDropDown(context),
            useName: true,
            data: FilterModel.filters,
            onChange: (FilterModel value) => companyMainData.selectType(value),
          ),
        ),
        InkWell(
          onTap: ()=>companyMainData.pagingController.refresh(),
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
