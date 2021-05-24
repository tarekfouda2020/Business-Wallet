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
        BuildRepeatedText(),
        BuildRepeatedText(),
        BuildRepeatedText(),
      ],
    );
  }
}
