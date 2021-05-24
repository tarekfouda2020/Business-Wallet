part of 'CompWalletNumbWidgetsImports.dart';

class BuildCopyText extends StatelessWidget {
  final CompanyWalletNumbData companyWalletNumbData;

  BuildCopyText({required this.companyWalletNumbData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: MyColors.greyWhite,
              borderRadius: BorderRadius.circular(10)),
          child: MyText(
            title: "MMMMMMMM",
            size: 30,
            color: MyColors.grey,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: MyColors.primary),
          child: IconButton(
            icon: Icon(
              Icons.copy,
              color: MyColors.darken,
            ),
            onPressed: () => Utils.copToClipboard(
                text: "text", scaffold: companyWalletNumbData.scaffold),
          ),
        )
      ],
    );
  }
}
