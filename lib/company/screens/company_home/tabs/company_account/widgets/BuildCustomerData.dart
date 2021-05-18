part of 'CompAccountWidgetsImports.dart';

class BuildCustomerData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        BuildAccountItem(
          title: "الباقات الاعلانية",
          iconData: Icons.assignment,
        ),
        BuildAccountItem(
          title: "احصائيات وتقارير",
          iconData: Icons.insert_chart,
        ),
        BuildAccountItem(
          title: "المحفظة",
          iconData: Icons.monetization_on,
        ),
        BuildAccountItem(
          title: "رقم المحفظة",
          iconData: MdiIcons.codeNotEqualVariant,
        ),
        BuildAccountItem(
          title: "باركود",
          iconData: Icons.qr_code,
        ),
        BuildAccountItem(
          title: "المراسلات",
          iconData: Icons.chat,
        ),
        BuildAccountItem(
          title: "التعليقات",
          iconData: Icons.chat,
        ),
        BuildAccountItem(
          title: "الاهتمامات",
          iconData: MdiIcons.accountGroup,
        ),
        BuildAccountItem(
          title: "بيانات البروشور",
          iconData: Icons.credit_card_outlined,
        ),
      ],
    );
  }
}