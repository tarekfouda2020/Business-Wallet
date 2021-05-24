part of 'CompAccountWidgetsImports.dart';

class BuildCustomerData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: [
        BuildAccountItem(
          title: "الباقات الاعلانية",
          iconData: Icons.assignment,
          onTap: () => AutoRouter.of(context).push(CompanyPackagesRoute()),
        ),
        BuildAccountItem(
          title: "احصائيات وتقارير",
          iconData: Icons.insert_chart,
          onTap: () => AutoRouter.of(context).push(CompanyStatisticsRoute()),
        ),
        BuildAccountItem(
          title: "المحفظة",
          iconData: Icons.monetization_on,
          onTap: () => AutoRouter.of(context).push(CompanyWalletRoute()),
        ),
        BuildAccountItem(
          title: "رقم المحفظة",
          iconData: MdiIcons.codeNotEqualVariant,
          onTap: () => AutoRouter.of(context).push(CompanyWalletNumbRoute()),
        ),
        BuildAccountItem(
          title: "باركود",
          iconData: Icons.qr_code,
          onTap: () => AutoRouter.of(context).push(CompanyBarcodeRoute()),
        ),
        BuildAccountItem(
          title: "المراسلات",
          iconData: Icons.chat,
          onTap: () => AutoRouter.of(context).push(CompanyConversationsRoute()),
        ),
        BuildAccountItem(
          title: "التعليقات",
          iconData: Icons.chat,
          onTap: () => AutoRouter.of(context).push(CompanyCommentsRoute()),
        ),
        BuildAccountItem(
          title: "الاهتمامات",
          iconData: MdiIcons.accountGroup,
          onTap: () => AutoRouter.of(context).push(CompanyInterestsRoute()),
        ),
        BuildAccountItem(
          title: "بيانات البروشور",
          iconData: Icons.credit_card_outlined,
          onTap: () => AutoRouter.of(context).push(CompanyBrochureRoute()),
        ),
      ],
    );
  }
}
