part of 'ThirdStepWidgetsImports.dart';
class BuildButtonList extends StatelessWidget {
final CompanySubscribeData companySubscribeData;

  const BuildButtonList({required this.companySubscribeData}) ;
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
          onTap: () => companySubscribeData.savePdf(context),
        ),
        DefaultButton(
          color: MyColors.primary,
          textColor: MyColors.blackOpacity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: BorderRadius.circular(30),
          title: "التالي",
          onTap: () => companySubscribeData.moveNext(),
        ),
        DefaultButton(
          color: MyColors.white,
          textColor: MyColors.blackOpacity,
          borderRadius: BorderRadius.circular(30),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          title: "السابق",
          onTap: () => companySubscribeData.moveBack(),
        )
      ],
    );
  }
}
