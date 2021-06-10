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
            finData: (filter) async =>
                await CustomerRepository(context).getCities(3),
            onChange: (CitiesModel value) {},
          ),
        ),
        Flexible(
          child: FutureBottomSheet<UserInterestModel>(
            label: "الاهتمامات",
            validate: (UserInterestModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
                await CustomerRepository(context).getInterest(),
            onChange: (UserInterestModel value) {},
          ),
        ),

        // BlocConsumer<GenericCubit<String>, GenericState<String>>(
        //   bloc: mainPageData.filterCubit,
        //   listener: (_, state) {
        //     mainPageData.filter.text = FilterModel()
        //         .filters
        //         .firstWhere((e) => e.id == state.data)
        //         .name!;
        //   },
        //   builder: (_, state) {
        //     return InkWellTextField(
        //       icon: Icon(Icons.arrow_drop_down),
        //       controller: mainPageData.filter,
        //       validate: (value) => value!.validateEmpty(context),
        //       margin: const EdgeInsets.symmetric(vertical: 10),
        //       onTab: () => DownBottomSheet(
        //         context: context,
        //         title: 'أخرى',
        //         onTab: (name, id) => FilterModel.selectType(id, context),
        //         data: FilterModel().filters,
        //       ).show(),
        //       hint: 'أخرى',
        //     );
        //   },
        // ),
        Flexible(
          child: FutureBottomSheet<CitiesModel>(
            label: "أخرى",
            validate: (CitiesModel value) => value.validateDropDown(context),
            useName: true,
            finData: (filter) async =>
                await CustomerRepository(context).getCities(3),
            onChange: (CitiesModel value) {},
          ),
        ),
        InkWell(
          // onTap: ()=>mainPageData.setMainFiltered(context),
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
