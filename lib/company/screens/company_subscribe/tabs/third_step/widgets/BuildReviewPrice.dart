part of 'ThirdStepWidgetsImports.dart';

class BuildReviewPrice extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;

  const BuildReviewPrice({required this.companySubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: "التكلفة الاجمالية",
          size: 17,
          color: MyColors.white,
        ),
        MyText(
          title: "${companySubscribeData.baseCost} ر.س",
          size: 16,
          color: MyColors.primary,
        ),
      ],
    );
  }
}
