part of'WalletWidgetsImports.dart';
class BuildWalletButton extends StatelessWidget {
  final WalletData walletData;

  const BuildWalletButton({required this.walletData});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: "تأكيد",
          onTap: (){},
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: BorderRadius.circular(25),
          margin: const EdgeInsets.symmetric(horizontal: 100),
        ),
        BuildCheckTerms(walletData: walletData,),
        Divider(thickness: 2,),
        LoadingButton(
          title: "تصفيه المحفظه",
          onTap: (){},
          btnKey: walletData.btnKey,
          borderRadius: 20,
          color: MyColors.primary,
          textColor: MyColors.black,
        ),
      ],
    );
  }
}

