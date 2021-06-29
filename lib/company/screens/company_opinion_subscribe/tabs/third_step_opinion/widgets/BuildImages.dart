part of 'ThirdStepOpinionWidgetsImports.dart';

class BuildImages extends StatelessWidget {
  final CompOpinionSubscribeData companySubscribeData;

  const BuildImages({required this.companySubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "الصور",
          size: 11,
          color: MyColors.primary,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: List.generate(
            companySubscribeData.imageCubit.state.data.length,
            (index) => Container(
              alignment: Alignment.topLeft,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(
                    companySubscribeData.imageCubit.state.data[index],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
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
