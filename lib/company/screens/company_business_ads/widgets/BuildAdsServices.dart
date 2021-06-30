part of 'CompBussinessAdsWidgetsImports.dart';

class BuildAdsServices extends StatelessWidget {
  final List<CompServiceModel> serviceModel;

  const BuildAdsServices({required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "الخدمات"),
        Visibility(
          visible: serviceModel.isEmpty,
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
            itemCount: serviceModel.length,
            itemBuilder: (_, index) => BuildServiceItem(
              title: serviceModel[index].name,
              price: "${serviceModel[index].price} ريال ",
            ),
          ),
        )
      ],
    );
  }
}
