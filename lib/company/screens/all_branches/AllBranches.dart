part of 'AllBranchesImports.dart';

class AllBranches extends StatefulWidget {
final String userId;

  const AllBranches({required this.userId}) ;
  @override
  _AllBranchesState createState() => _AllBranchesState();
}

class _AllBranchesState extends State<AllBranches> {
  final AllBranchesData allBranchesData = new AllBranchesData();

  @override
  void initState() {
    allBranchesData.fetchData(context,widget.userId, refresh: false);
    allBranchesData.fetchData(context,widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: "الفروع",
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: BlocBuilder<BranchesCubit, BranchesState>(
        bloc: allBranchesData.branchesCubit,
        builder: (context, state) {
          if (state is BranchesUpdateState) {
            if (state.branches.length > 0) {
              return RefreshIndicator(
                onRefresh: () =>
                    allBranchesData.fetchData(context, widget.userId),
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                  itemCount: state.branches.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BuildBranchItem(
                      model: state.branches[index],
                      allBranchesData: allBranchesData,
                    );
                  },
                ),
              );
            }
            return Center(
              child: MyText(
                title: "لا يوجد لديك فروع",
                size: 12,
                color: MyColors.primary,
              ),
            );
          }
          return LoadingDialog.showLoadingView();
        },
      ),
    );
  }
}
