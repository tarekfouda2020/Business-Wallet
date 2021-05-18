part of 'CompFollowersWidgetsImport.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyFollowersData companyFollowersData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 170),
      required this.companyFollowersData})
      : super(child: Container(), preferredSize: preferredSize);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: 150,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BuildTopHeader("متابعتي", true),
            Positioned(
              top: 100,
              child: BuildSelectedTabView(),
            ),
          ],
        ),
      ),
    );
  }
}
