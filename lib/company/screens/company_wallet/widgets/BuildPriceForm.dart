part of 'CompWalletWidgetsImports.dart';

class BuildPriceForm extends StatelessWidget {
  final CompanyWalletData companyWalletData;

  BuildPriceForm({required this.companyWalletData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MyText(
            title: "شحن رصيد البروشور",
            size: 11,
            color: MyColors.white,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: IconTextFiled(
                hint: "شحن رصيد البروشور",
                controller: companyWalletData.brochure,
                margin: const EdgeInsets.symmetric(vertical: 5),
                action: TextInputAction.next,
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                ),
                type: TextInputType.emailAddress,
                validate: (value) => value!.validateEmpty(context),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 30,
                      maxHeight: 50,
                      minWidth: double.infinity,
                      maxWidth: double.infinity),
                  child: MyText(
                    alien: TextAlign.center,
                    title: "تأكيد",
                    color: MyColors.blackOpacity,
                    size: 12,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MyText(
            title: "0.0 ريال سعودي",
            size: 11,
            color: MyColors.primary,
          ),
        ),
      ],
    );
  }
}
