part of 'WalletWidgetsImports.dart';

class BuildWalletPageView extends StatelessWidget {
  final WalletData walletData;

  const BuildWalletPageView({required this.walletData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        BuildHelpText(),
        BuildTopText(),
        BuildItemText(
          text: "أرباح الدعوات التجاريه",
          title: "300",
        ),
        BuildItemText(
          text: "أرباح الصفقات",
          title: "0",
          showButton: true,
        ),
        BuildItemText(
          text: "أرباح المشاركه",
          title: "0",
        ),
        BuildItemText(
          text: "أرباح سوف تفقد بتاريخ",
          title: "0",
          showText: true,
        ),
        SizedBox(height: 10,),
        BuildTextSalary(),
        BuildFormInputs(walletData: walletData,),
        BuildWalletButton(walletData: walletData,),
      ],
    );
  }
}
