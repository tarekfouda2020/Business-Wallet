part of 'CompMainWidgetsImports.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyMainData companyMainData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 170),
      required this.companyMainData})
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
            BuildTopHeader("", false),
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
