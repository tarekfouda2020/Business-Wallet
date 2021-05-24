part of 'WalletWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final WalletData walletData;

  const BuildFormInputs({required this.walletData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Form(
        key: walletData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "مشاركه رصيد المحفظه",
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: "أدخل رقم محفظه المستفيد",
              controller: walletData.wallet,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.done,
              type: TextInputType.name,
              validate: (value) => value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
