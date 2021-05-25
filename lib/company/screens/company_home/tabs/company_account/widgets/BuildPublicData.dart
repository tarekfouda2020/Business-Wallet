part of 'CompAccountWidgetsImports.dart';

class BuildPublicData extends StatelessWidget {
  final CompanyAccountData companyAccountData;

  BuildPublicData({required this.companyAccountData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: [
        BuildAccountItem(
          title: "مشاركة التطبيق",
          iconData: Icons.share,
          onTap: companyAccountData.shareApp,

        ),
        BuildAccountItem(
          title: "معلومات التطبيق",
          iconData: Icons.settings,
          onTap: ()=>AutoRouter.of(context).push(AppInfoRoute()),
        ),
      ],
    );
  }
}
