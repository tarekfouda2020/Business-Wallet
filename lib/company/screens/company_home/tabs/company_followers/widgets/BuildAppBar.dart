part of 'CompFollowersWidgetsImport.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyFollowersData companyFollowersData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 200),
      required this.companyFollowersData})
      : super(child: Container(), preferredSize: preferredSize);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: Container(
        height: 150,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BuildTopHeader(search: true,title: "متابعتي",),

            BuildSelectedTabView(),
          ],
        ),
      ),
    );
  }
}
