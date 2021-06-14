part of 'ReconciliationWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final AccountReconciliationData accountReconciliationData;

  const BuildForm({required this.accountReconciliationData}) ;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: accountReconciliationData.formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: MyText(
                title: "الاسم ثلاثي",
              ),
            ),
            LabelTextField(
              hint: "الاسم ثلاثي",
              controller: accountReconciliationData.name,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: MyText(
                title: "اسماء البنوك",
              ),
            ),
            DropdownTextField<DropDownModel>(
              dropKey: accountReconciliationData.bank,
              label: "اسماء البنوك",
              margin: const EdgeInsets.symmetric(vertical: 10),
              validate: (DropDownModel value) =>
                  value.validateDropDown(context),
              onChange: accountReconciliationData.onSelectBank,
              useName: true,
              finData: (filter) async =>
              await CustomerRepository(context).getBank(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: MyText(
                title: "رقم الايبان",
              ),
            ),
            LabelTextField(
              hint: "رقم الايبان",
              controller: accountReconciliationData.wallet,
              validate: (value) => value!.validateEmpty(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
            ),
          ],
        ),
      ),
    );
  }
}
