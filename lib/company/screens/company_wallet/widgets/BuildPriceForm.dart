part of 'CompWalletWidgetsImports.dart';

class BuildPriceForm extends StatelessWidget {
  final CompanyWalletData companyWalletData;
  final CompWalletModel compWalletModel;

  BuildPriceForm(
      {required this.companyWalletData, required this.compWalletModel});

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
        Form(
          key: companyWalletData.formKey,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: BlocConsumer<GenericCubit<String>, GenericState<String>>(
                  bloc: companyWalletData.brochureCubit,
                  listener: (_, state) {
                    companyWalletData.brochure.text = BrochureDropDownModel()
                        .brochure
                        .firstWhere((e) => e.id == state.data)
                        .name!;
                  },
                  builder: (_, state) {
                    return InkWellTextField(
                      icon: Icon(Icons.arrow_drop_down),
                      controller: companyWalletData.brochure,
                      validate: (value) => value!.validateEmpty(context),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      onTab: () => DownBottomSheet(
                        context: context,
                        title: '',
                        onTab: (name, id) =>
                            companyWalletData.selectType(id, context),
                        data: BrochureDropDownModel().brochure,
                      ).show(),
                      hint: 'شحن رصيد البروشور',
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: ()=>companyWalletData.shareWalletPoint(context),
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
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: MyText(
            title: "${compWalletModel.cost} ريال سعودي",
            size: 11,
            color: MyColors.primary,
          ),
        ),
      ],
    );
  }
}
