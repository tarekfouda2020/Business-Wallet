part of 'CompInvitationWidgetsImports.dart';

class BuildAppBar extends PreferredSize {
  final Size preferredSize;
  final CompanyInvitationData companyInvitationData;

  BuildAppBar(
      {this.preferredSize = const Size.fromHeight(kToolbarHeight + 170),
      required this.companyInvitationData})
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
            BuildTopHeader(search: true,title: "دعوة تجارية"),
            BuildMenuView(
              companyInvitationData: companyInvitationData,
            ),
          ],
        ),
      ),
    );
  }
}
