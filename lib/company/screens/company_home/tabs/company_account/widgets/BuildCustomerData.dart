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
          page: CompanyPackages(),
        ),
        BuildAccountItem(
          title: "احصائيات وتقارير",
          iconData: Icons.insert_chart,
          page: CompanyStatistics(),
        ),
        BuildAccountItem(
          title: "المحفظة",
          iconData: Icons.monetization_on,
          page: CompanyWallet(),
        ),
        BuildAccountItem(
          title: "رقم المحفظة",
          iconData: MdiIcons.codeNotEqualVariant,
          page: CompanyWalletNumb(),
        ),
        BuildAccountItem(
          title: "باركود",
          iconData: Icons.qr_code,
          page: CompanyBarcode(),
        ),
        BuildAccountItem(
          title: "المراسلات",
          iconData: Icons.chat,
          page: CompanyConversations(),
        ),
        BuildAccountItem(
          title: "التعليقات",
          iconData: Icons.chat,
          page: CompanyComments(),
        ),
        BuildAccountItem(
          title: "الاهتمامات",
          iconData: MdiIcons.accountGroup,
          page: CompanyInterests(),
        ),
        BuildAccountItem(
          title: "بيانات البروشور",
          iconData: Icons.credit_card_outlined,
          page: CompanyBrochure(),
        ),
      ],
    );
  }
}
