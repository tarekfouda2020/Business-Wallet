part of 'SecStepSpecialWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const BuildButtonList({required this.compSpecialSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          color: MyColors.white,
          textColor: MyColors.primary,
          borderRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          title: "حفظ كملف",
          onTap: () => compSpecialSubscribeData.savePdf(context),
        ),
        DefaultButton(
          color: MyColors.primary,
          textColor: MyColors.blackOpacity,
          borderRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          title: "التالي",
          onTap: () => compSpecialSubscribeData.moveNext(context),
        ),
        DefaultButton(
          color: MyColors.white,
          textColor: MyColors.primary,
          borderRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          title: "السابق",
          onTap: () => compSpecialSubscribeData.moveBack(),
        )
      ],
    );
  }
}
