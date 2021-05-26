part of 'ForthStepWidgetsImports.dart';

class BuildPaymentText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: MyColors.black,
      child: Row(
        children: [
          MyText(
            title: "اختر طريقة الدفع",
            color: MyColors.greyWhite.withOpacity(.9),
            size: 12,
          )
        ],
      ),
    );
  }
}
