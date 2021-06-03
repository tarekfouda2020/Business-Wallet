part of 'SuccessActiveWidgetsImports.dart';

class BuildButtons extends StatelessWidget {
  final String userId;
  final SuccessfullyActiveData successfullyActiveData;

  BuildButtons({required this.successfullyActiveData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: "الدفع ماستر كارد/ فيزا",
          onTap: () =>
              successfullyActiveData.navigateToPayment(context, userId, 0),
          color: MyColors.primary,
          textColor: MyColors.blackOpacity,
        ),
        DefaultButton(
          title: "الدفع مدي",
          onTap: () =>
              successfullyActiveData.navigateToPayment(context, userId, 1),
          color: MyColors.white,
          textColor: MyColors.blackOpacity,
        )
      ],
    );
  }
}
