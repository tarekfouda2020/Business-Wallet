part of 'FisrtStepSpecialWidgetImports.dart';

class BuildPrice extends StatelessWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const BuildPrice({required this.compSpecialSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: "التكلفة",
          color: MyColors.primary,
          size: 12,
        ),
        BlocBuilder<GenericCubit<double>, GenericState<double>>(
          bloc: compSpecialSubscribeData.baseCostCubit,
          builder: (_, state) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.primary),
                borderRadius: BorderRadius.circular(5),
              ),
              child: MyText(
                title:
                    "${compSpecialSubscribeData.baseCostCubit.state.data} ريال سعودي",
                size: 12,
                color: MyColors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
