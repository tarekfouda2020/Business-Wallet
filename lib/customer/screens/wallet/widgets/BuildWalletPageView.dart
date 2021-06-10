part of 'WalletWidgetsImports.dart';

class BuildWalletPageView extends StatelessWidget {
  final WalletData walletData;
  final WalletModel? walletModel;

  const BuildWalletPageView(
      {required this.walletData, required this.walletModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BuildHelpText(),
        BuildTopText(),
        BuildItemText(
          text: "أرباح الدعوات التجاريه",
          title: walletModel!.pointsEarned.toString(),
        ),
        BuildItemText(
          text: "أرباح الصفقات",
          title: walletModel!.points.toString(),
          showButton: true,
        ),
        BuildItemText(
          text: "أرباح المشاركه",
          title: walletModel!.mainPoket.toString(),
        ),
        BuildItemText(
          text: "أرباح سوف تفقد بتاريخ",
          title: walletModel!.pointMonth.toString(),
          desc: walletModel!.descriptionPointMonth,
          showText: true,
        ),
        SizedBox(height: 20),
        BuildTextSalary(walletModel: walletModel),
        BuildFormInputs(walletData: walletData),
        BuildWalletButton(
          walletData: walletData,
          walletModel: walletModel,
        ),
      ],
    );
  }
}
