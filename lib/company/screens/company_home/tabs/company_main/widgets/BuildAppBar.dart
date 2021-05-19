part of 'CompMainWidgetsImports.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyMainData companyMainData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 200),
      required this.companyMainData})
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
              onTap: () => AutoRouter.of(context).push(CompanySearchRoute()),
            ),
            BuildSelectedTabView(),
          ],
        ),
      ),
    );
  }
}
