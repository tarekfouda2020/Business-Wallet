part of 'ForthStepWidgetsImports.dart';

class BuildPaymentText extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;
  const BuildPaymentText(this.companySubscribeData);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        color: MyColors.black,
        child: BlocBuilder<GenericCubit<double?>, GenericState<double?>>(
          bloc: companySubscribeData.finalCostCubit,
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
        ));
  }
}
