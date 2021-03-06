part of 'CompWalletNumbWidgetsImports.dart';

class BuildBenefitsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "كيف استفيد من محفظتي؟",
          size: 14,
          color: MyColors.white,
        ),
        SizedBox(
          height: 5,
        ),
        MyText(
          title: "يمكنك الاستفادة من المحفظة باحدي الطرق التالية :",
          size: 12,
          color: MyColors.white,
        ),
        ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            BuildTextItem(
              title:
                  "كسب ١٠٠ ريال مقابل حث المنشأت التجاريه علي التسجيل في الدليل باستخدام رقم المحفظة.",
            ),
            BuildTextItem(
              title:
                  "كسب مبالغ تبدأ من 30 هللة وحتي 500 ريال مقابل مشاهدة الاعلانات والمشاركة في استطلاعات الرأي.",
            ),
            BuildTextItem(
              title: "تحويل رصيد المحفظة الي حسابك البنكي أو الي مستخدم أخر.",
            ),
          ],
        )
      ],
    );
  }
}
