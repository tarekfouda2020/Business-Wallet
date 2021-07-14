part of 'FirstStepBrochureWidgetsImports.dart';

class BuildServices extends StatelessWidget {
  final List<CompServiceModel>? serviceModel;

  const BuildServices({required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "الخدمات"),
        Visibility(
          // visible: serviceModel.isEmpty,
          visible: serviceModel == null || serviceModel?.length == 0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: MyText(
              title: "لا يوجد خدمات ",
              size: 12,
              color: MyColors.white,
            ),
          ),
          replacement: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: serviceModel?.length ?? 0,
            itemBuilder: (_, index) => BuildServiceItem(
              title: serviceModel![index].name,
              price: "${serviceModel![index].price} ريال ",
            ),
          ),
        )
      ],
    );
  }
}
