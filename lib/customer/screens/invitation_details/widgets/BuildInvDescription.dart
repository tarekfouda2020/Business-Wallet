part of 'InvDetailsWidgetsImports.dart';

class BuildInvDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: MyText(
        title:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
        size: 11,
      ),
    );
  }
}
