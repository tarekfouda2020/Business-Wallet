part of 'CompSearchWidgetsImports.dart';

class BuildSearchText extends StatelessWidget {
  final CompanySearchData companySearchData;

  BuildSearchText({required this.companySearchData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: BlocConsumer<GenericCubit, GenericState>(
              bloc: companySearchData.searchUpdateCubit,
              listener: (_, state) {
                if (state.data != null)
                  companySearchData.search.text = state.data;
              },
              builder: (context, state) {
                return AutoCompleteField<AutoSearchModel>(
                  label: "كلمة البحث",
                  onSearch: (text) async =>
                      companySearchData.fetchAutoSearch(context, text),
                  onSubmit: (model) =>
                      companySearchData.onSelectModel(context, model),
                  controller: companySearchData.search,
                );
              },
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
      ),
    );
  }
}
