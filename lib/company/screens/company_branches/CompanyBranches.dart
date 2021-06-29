part of 'CompanyBranchesImports.dart';

class CompanyBranches extends StatefulWidget {
  @override
  _CompanyBranchesState createState() => _CompanyBranchesState();
}

class _CompanyBranchesState extends State<CompanyBranches> {

  final CompanyBranchesData branchesData = new CompanyBranchesData();


  @override
  void initState() {
    branchesData.fetchData(context, refresh: false);
    branchesData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,

      appBar: PreferredSize(
        child: DefaultAppBar(title: "الفروع",),
        preferredSize: Size.fromHeight(60),
      ),

      body: BlocBuilder<BranchesCubit, BranchesState>(
        bloc: branchesData.branchesCubit,
        builder: (context, state) {
          if (state is BranchesUpdateState) {
            if (state.branches.length>0) {
              return RefreshIndicator(
                onRefresh: ()=> branchesData.fetchData(context),
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 15,left: 15,bottom: 20),
                  itemCount: state.branches.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildBranchItem(model: state.branches[index]);
                  },
                ),
              );
            }
            return Center(
              child: MyText(title: "لا يوجد لديك فروع",size: 12,color: MyColors.primary,),
            );
          }
          return LoadingDialog.showLoadingView();
        },
      ),

      floatingActionButton: BuildAddButton(branchesData: branchesData),

    );
  }
}

