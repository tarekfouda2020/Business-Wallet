part of 'CompSearchWidgetsImports.dart';

class BuildSelectedTabView extends StatelessWidget {
  final CompanySearchData companySearchData;

  const BuildSelectedTabView({required this.companySearchData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FutureBottomSheet<FieldDropDownModel>(
              label: "المجال الرئيسي",
              validate: (FieldDropDownModel value) =>
                  value.validateDropDown(context),
              useName: true,
              finData: (filter) async =>
                  await CustomerRepository(context).getFields(),
              onChange: (FieldDropDownModel value) =>
                  companySearchData.onSelectField(value),
            ),
          ),
          Flexible(
            child: FutureBottomSheet<DropDownSelected>(
              label: "المجال الفرعي",
              validate: (DropDownSelected value) =>
                  value.validateDropDown(context),
              useName: true,
              finData: (filter) async => await CompanyRepository(context)
                  .getSubField(companySearchData.fieldId),
              onChange: (DropDownSelected value) =>
                  companySearchData.onSelectSubField(value),
            ),
          ),
          Flexible(
            child: FutureBottomSheet<FilterModel>(
              label: "صنف حسب",
              validate: (FilterModel value) => value.validateDropDown(context),
              useName: true,
              data: FilterModel.mainSearchFilters,
              onChange: (FilterModel value) =>
                  companySearchData.selectType(value),
            ),
          ),
          InkWell(
            onTap: () => companySearchData.pagingController.refresh(),
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
