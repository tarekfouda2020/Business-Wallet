part of 'SecStepBrochureWidgetsImports.dart';

class BuildViewPrice extends StatelessWidget {
  final SecondStepBrochureData secondStepBrochureData;

  const BuildViewPrice({required this.secondStepBrochureData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Column(
        children: [
          MyText(
            title: "التكلفة",
            color: MyColors.primary,
            size: 14,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MyText(
              title: "0.0 ريال",
              color: MyColors.primary,
              size: 12,
            ),
          ),
          MyText(
            title: "رصيد المشاهدات : 0 هللة",
            color: MyColors.white.withOpacity(.8),
            size: 12,
          ),
          MyText(
            title: "ارفع قيمة مشاهدة اعلانك",
            color: MyColors.primary.withOpacity(.8),
            size: 12,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15 ),

            child: MyText(
              title: "التكلفة تساوي الحد الادنى لرصيد المشاهدات والتي سيتم تحويلها الى محفظة العملاء المستهدفين بعد إتمام وقت المشاهدة ويمكنك رفع قيمة المشاهدة الواحدة حتى 500ريال ",
              color: MyColors.white,
              size: 10,
            ),
          ),
          LabelTextField(
            hint: "المبلغ الاضافي",
            controller: secondStepBrochureData.extraNum,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            action: TextInputAction.next,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
          ),
        ],
      ),
    );
  }
}
