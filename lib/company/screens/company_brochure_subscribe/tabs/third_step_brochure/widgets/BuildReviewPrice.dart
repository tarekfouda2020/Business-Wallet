part of 'ThirdStepBrochureWidgetsImports.dart';

class BuildReviewPrice extends StatelessWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const BuildReviewPrice({required this.compBrochureSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<GenericCubit<double?>, GenericState<double?>>(
        bloc: compBrochureSubscribeData.finalCostCubit,
        builder: (_, state) {
          return Column(
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
                title: "${state.data} ر.س",
                size: 16,
                color: MyColors.primary,
              ),
            ],
          );
        },
      ),
    );
  }
}
