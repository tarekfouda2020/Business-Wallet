part of 'CompSearchWidgetsImports.dart';

class BuildSearchText extends StatelessWidget {
  final CompanySearchData companySearchData;

  BuildSearchText({required this.companySearchData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: LabelTextField(
            hint: "ابحث عما تريد",
            controller: companySearchData.search,
            validate: (value) => value!.validateEmpty(context),
            minHeight: 30,
            maxHeight: 45,
            // borderColor: MyColors.primary,
            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: 100,
            child: TabBar(
              indicatorColor: MyColors.darken.withOpacity(.1),
              tabs: [
                Tab(
                  icon: Image.asset(
                    Res.noun_men,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    Res.noun_mapp,
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
