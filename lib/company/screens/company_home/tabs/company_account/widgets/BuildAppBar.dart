part of 'CompAccountWidgetsImports.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyAccountData companyAccountData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 170),
      required this.companyAccountData})
      : super(child: Container(), preferredSize: preferredSize);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: 200,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BuildTopHeader(
              search: true,
              title: "حسابي",
            ),
            Positioned(
              top: 110,
              child: BuildProfileCard(),
            ),
          ],
        ),
      ),
    );
  }
}
