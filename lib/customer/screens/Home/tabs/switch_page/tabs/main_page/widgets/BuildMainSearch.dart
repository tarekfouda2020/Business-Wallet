part of 'MainPageWidgetsImports.dart';

class BuildMainSearch extends StatelessWidget {
  final MainPageData mainPageData;

  BuildMainSearch({required this.mainPageData});

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
            finData: (filter) async => await CustomerRepository(context).getCities(3),
            onChange: (CitiesModel value){},
          ),
        ),
        Flexible(
          child: FutureBottomSheet<CitiesModel>(
            label: "الاهتمامات",
            validate: (CitiesModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async => await CustomerRepository(context).getCities(3),
            onChange: (CitiesModel value){},
          ),
        ),
        Flexible(
          child: FutureBottomSheet<CitiesModel>(
            label: "أخرى",
            validate: (CitiesModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async => await CustomerRepository(context).getCities(3),
            onChange: (CitiesModel value){},
          ),
        ),
        Container(
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
        )
      ],
    );
  }
}
