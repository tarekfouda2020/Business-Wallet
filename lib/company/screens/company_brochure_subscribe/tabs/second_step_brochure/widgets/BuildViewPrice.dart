part of 'SecStepBrochureWidgetsImports.dart';

class BuildViewPrice extends StatelessWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const BuildViewPrice({required this.compBrochureSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                MyText(
                  title: "التكلفة",
                  color: MyColors.primary,
                  size: 14,
                ),
                BlocBuilder<GenericCubit<double>, GenericState<double>>(
                  bloc: compBrochureSubscribeData.costChangeCubit,
                  builder: (_, state) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MyText(
                        title: "${state.data}ريال ",
                        color: MyColors.primary,
                        size: 12,
                      ),
                    );
                  },
                ),
                BlocBuilder<GenericCubit<double>, GenericState<double>>(
                  bloc: compBrochureSubscribeData.costViewChangeCubit,
                  builder: (_, state) {
                    return MyText(
                      title: "رصيد المشاهدات : ${state.data} هللة",
                      color: MyColors.white.withOpacity(.8),
                      size: 12,
                    );
                  },
                ),
                Divider(
                  color: MyColors.grey,
                )
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                MyText(
                  title: "ارفع قيمة مشاهدة اعلانك",
                  size: 14,
                  color: MyColors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                MyText(
                  title:
                  "التكلفة تساوي الحد الادني لرصيد المشاهدات والتي سيتم تحوليها الي محفظة العملاء المستهدفين بعد اتمام وقت المشاهدة ويمكنك رفع قيمه المشاهدة الواحدة حتي 500 ريال ",
                  size: 11,
                  color: MyColors.white,
                ),
                LabelTextField(
                  hint: "برجاء ادخال المبلغ",
                  controller: compBrochureSubscribeData.extraCost,
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  action: TextInputAction.next,
                  type: TextInputType.emailAddress,
                  onChange: (value) => compBrochureSubscribeData.getExtraCostSubscribe(
                      context, int.parse(value)),
                  validate: (value) => value!.validateEmpty(context),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
