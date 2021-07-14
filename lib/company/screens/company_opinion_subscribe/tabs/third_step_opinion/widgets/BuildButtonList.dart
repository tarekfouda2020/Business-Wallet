part of 'ThirdStepOpinionWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildButtonList({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          color: MyColors.white,
          textColor: MyColors.blackOpacity,
          borderRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          title: "حفظ كملف PDF",
          onTap: () => compOpinionSubscribeData.savePdf(context),
        ),
        DefaultButton(
          color: MyColors.primary,
          textColor: MyColors.blackOpacity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: BorderRadius.circular(30),
          title: "التالي",
          onTap: () => compOpinionSubscribeData.moveNext(context),
        ),
        DefaultButton(
          color: MyColors.white,
          textColor: MyColors.blackOpacity,
          borderRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          title: "السابق",
          onTap: () => compOpinionSubscribeData.moveBack(),
        )
      ],
    );
  }
}
