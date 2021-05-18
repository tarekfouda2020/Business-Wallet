part of 'SearchWidgetsImports.dart';

class BuildSearchChangeView extends StatelessWidget {
  final SearchData searchData;
  const BuildSearchChangeView({required this.searchData});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: LabelTextField(
              hint: "ابحث عمّا تريد",
              controller: searchData.search,
            validate: (value) => value!.validateEmpty(context),
            minHeight: 30,
            maxHeight: 35,
            // borderColor: MyColors.primary,
            margin: const EdgeInsets.all(10),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 15,
            width: 90,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TabBar(
              indicatorColor: MyColors.secondary,
              tabs: [
                Tab(
                  child: Image.asset(
                    Res.noun_men,
                    height: 10,
                    color: MyColors.white,
                  ),
                ),
                Tab(
                  child: Image.asset(
                    Res.noun_mapp,
                    height: 13,
                    color: MyColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
