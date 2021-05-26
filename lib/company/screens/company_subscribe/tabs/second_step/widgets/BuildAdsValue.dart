part of 'SecondStepWidgetsImports.dart';

class BuildAdsValue extends StatelessWidget {
  final SecondStepData secondStepData;

  BuildAdsValue({required this.secondStepData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            controller: secondStepData.value,
            margin: const EdgeInsets.symmetric(vertical: 25),
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            validate: (value) => value!.validateEmpty(context),
          ),
        ],
      ),
    );
  }
}
