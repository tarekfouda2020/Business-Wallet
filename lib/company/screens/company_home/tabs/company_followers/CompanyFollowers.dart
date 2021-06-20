part of 'CompanyFollowersImports.dart';

class CompanyFollowers extends StatefulWidget {
  @override
  _CompanyFollowersState createState() => _CompanyFollowersState();
}

class _CompanyFollowersState extends State<CompanyFollowers> {
  final CompanyFollowersData companyFollowersData = new CompanyFollowersData();

  @override
  void initState() {
    companyFollowersData.pagingController.addPageRequestListener((pageKey) {
      companyFollowersData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: "متابعتي",
      search: BuildSelectedTabView(
        companyFollowersData: companyFollowersData,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: PagedGridView<int, FollowerModel>(
          padding: const EdgeInsets.symmetric(vertical: 20),
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          pagingController: companyFollowersData.pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<FollowerModel>(
            itemBuilder: (context, item, index) => BuildMainItem(
              followerModel: item,
            ),
          ),
        ),
      ),
    );
  }
}
