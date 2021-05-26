part of 'SecondStepWidgetsImports.dart';

class BuildPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
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
              borderRadius: BorderRadius.circular(10),),
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
          Divider(color: MyColors.grey,)
        ],
      ),
    );
  }
}
