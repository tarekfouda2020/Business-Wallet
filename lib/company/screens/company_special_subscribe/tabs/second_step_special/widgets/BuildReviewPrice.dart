part of 'SecStepSpecialWidgetsImports.dart';

class BuildReviewPrice extends StatelessWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const BuildReviewPrice({required this.compSpecialSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          MyText(
            title: "التكلفة الاجمالية",
            size: 15,
            color: MyColors.white,
          ),
          MyText(
            title: "التكلفة تشمل قيمة الضريبة المضافة و 15% تكاليف التشغيل",
            size: 12,
            color: MyColors.white,
          ),
          MyText(
            title: "${compSpecialSubscribeData.baseCostCubit.state.data} ر.س",
            size: 16,
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }
}
