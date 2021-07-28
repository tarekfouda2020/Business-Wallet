part of'NumberWalletWidgetsImports.dart';

class BuildNumberWalletText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: MyText(
            title: " كيف استفيد من المحفظه؟",
            size: 11,
            color: MyColors.white,
          ),
        ),
        MyText(
          title: "يمكنك الاستفاده من المحفظه باحدي الطرق التاليه:",
          size: 11,
          color: MyColors.greyWhite.withOpacity(0.8),
        ),
        SizedBox(height: 10,),
        BuildRepeatedText(
            title: "كسب ١٠٠ ريال مقابل حث المنشأت التجاريه علي التسجيل في الدليل باستخدام رقم المحفظة.",
            ),
        BuildRepeatedText(title: "كسب مبالغ تبدأ من 30 هللة وحتي 500 ريال مقابل مشاهدة الاعلانات والمشاركة في استطلاعات الرأي.",),
        BuildRepeatedText(title: "تحويل رصيد المحفظة الي حسابك البنكي أو الي مستخدم أخر.",),
      ],
    );
  }
}
