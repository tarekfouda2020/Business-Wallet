part of 'CompMainWidgetsImports.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyMainData companyMainData;
  final Function()? onTap;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 200),
      required this.companyMainData,
      this.onTap})
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
            BuildTopHeader(
              search: false,
              onTap: onTap,
            ),
            BuildSelectedTabView(),
          ],
        ),
      ),
    );
  }
}
