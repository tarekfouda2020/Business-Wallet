part of 'CompWalletWidgetsImports.dart';

class BuildWalletDetails extends StatelessWidget {
  final CompWalletModel compWalletModel;

  const BuildWalletDetails({required this.compWalletModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildPointsItem(
          title: "ارباح الدعوات التجارية",
          desc: compWalletModel.pointsEarned.toString(),
        ),
        BuildPointsItem(
          title: "ارباح الصفقات",
          desc: compWalletModel.points.toString(),
          showButton: true,
        ),
        BuildPointsItem(
          title: "ارباح المشاركة",
          desc: compWalletModel.chargingPoints.toString(),
        ),
        BuildPointsItem(
          title: "ارباح سوف تفقد بتاريخ",
          desc: compWalletModel.pointMonth.toString(),
          subTitle: compWalletModel.nameDate.toString(),
          showText: true,
        ),
      ],
    );
  }
}
