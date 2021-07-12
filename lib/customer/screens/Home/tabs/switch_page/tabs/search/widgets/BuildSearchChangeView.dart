part of 'SearchWidgetsImports.dart';

class BuildSearchChangeView extends StatefulWidget {
  final SearchData searchData;

  const BuildSearchChangeView({required this.searchData});

  @override
  _BuildSearchChangeViewState createState() => _BuildSearchChangeViewState();
}

class _BuildSearchChangeViewState extends State<BuildSearchChangeView> {

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
              bloc: widget.searchData.searchUpdateCubit,
              listener: (_,state){
                if(state.data!=null)widget.searchData.search.text=state.data;
              },
              builder: (context, state) {
                return AutoCompleteField<AutoSearchModel>(
                  label: "كلمة البحث",
                  onSearch: (text) async =>
                      widget.searchData.fetchAutoSearch(context, text),
                  onSubmit: (model) =>
                      widget.searchData.onSelectModel(context, model),
                  controller: widget.searchData.search,
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              child: TabBar(
                controller: widget.searchData.tabController,
                indicatorColor: MyColors.darken.withOpacity(.1),
                tabs: [
                  Tab(
                    child: Image.asset(
                      Res.noun_men,
                      color: MyColors.white,
                    ),
                  ),
                  Tab(
                    child: Image.asset(
                      Res.noun_mapp,
                      color: MyColors.white,
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

