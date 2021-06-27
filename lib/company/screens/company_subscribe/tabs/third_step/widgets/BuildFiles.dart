part of 'ThirdStepWidgetsImports.dart';

class BuildFiles extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;

  const BuildFiles({required this.companySubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "الملفات",
          size: 11,
          color: MyColors.primary,
        ),
        Visibility(
          visible: companySubscribeData.fileCubit.state.data == null,
          replacement: MyText(
            title: "fdfdf",
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: companySubscribeData.addSubscribeModel.fileName!,
                size: 13,
                color: MyColors.white,
              ),
            ],
          ),
        ),
        Divider(
          color: MyColors.grey,
          height: 30,
        )
      ],
    );
  }
}
