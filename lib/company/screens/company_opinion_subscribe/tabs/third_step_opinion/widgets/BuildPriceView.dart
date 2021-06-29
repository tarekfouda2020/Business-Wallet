part of 'ThirdStepOpinionWidgetsImports.dart';

class BuildPriceView extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildPriceView({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<double?>, GenericState<double?>>(
      bloc: compOpinionSubscribeData.finalCostCubit,
      builder: (_, state) {
        return Column(
          children: [
            MyText(
              title: "التكلفة الاجمالية",
              size: 17,
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
    );
  }
}
