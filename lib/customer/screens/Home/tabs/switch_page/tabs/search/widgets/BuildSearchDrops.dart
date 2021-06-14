part of 'SearchWidgetsImports.dart';

class BuildSearchDrops extends StatelessWidget {
  final SearchData searchData;

  const BuildSearchDrops({required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FutureBottomSheet<FieldDropDownModel>(
              label: "الكل",
              validate: (FieldDropDownModel value) =>
                  value.validateDropDown(context),
              useName: true,
              finData: (filter) async =>
                  await CustomerRepository(context).getFields(),
              onChange: (FieldDropDownModel value) =>
                  searchData.onSelectField(value),
            ),
          ),
          Flexible(
            child: FutureBottomSheet<FilterModel>(
              label: "صنف حسب",
              validate: (FilterModel value) => value.validateDropDown(context),
              useName: true,
              data: FilterModel.mainSearchFilters,
              onChange: (FilterModel value) => searchData.selectType(value),
            ),
          ),
          InkWell(
            onTap: () => searchData.pagingController.refresh(),
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
      ),
    );
  }
}
