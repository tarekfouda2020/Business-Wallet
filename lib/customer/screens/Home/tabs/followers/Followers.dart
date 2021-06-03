part of 'FollowersImports.dart';

class Followers extends StatefulWidget {
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  final FollowersData followersData = new FollowersData();

  @override
  void initState() {
    followersData.pagingController.addPageRequestListener((pageKey) {
      followersData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: "متابعتي",
      search: BuildFollowersSearch(),
      body: Container(
        alignment: Alignment.topCenter,
        child: PagedGridView<int, MainModel>(
          showNewPageProgressIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          pagingController: followersData.pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<MainModel>(
            itemBuilder: (context, item, index) => BuildProviderItem(
              mainModel: item,
            ),
          ),
        ),
      ),
    );
  }
}
