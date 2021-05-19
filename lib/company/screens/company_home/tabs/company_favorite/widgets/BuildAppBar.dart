part of 'CompFavoriteWidgetsImports.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyFavoriteData companyFavoriteData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 170),
      required this.companyFavoriteData})
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
            BuildTopHeader(search: true,title: "مفضلتي",),

            BuildSelectedTabView(),
          ],
        ),
      ),
    );
  }
}
