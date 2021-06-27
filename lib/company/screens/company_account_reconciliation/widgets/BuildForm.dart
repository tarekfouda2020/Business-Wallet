part of 'CompAccountWidgetsImports.dart';

class BuildForm extends StatelessWidget {
  final CompAccountReconciliationData compAccountReconciliationData;

  const BuildForm({required this.compAccountReconciliationData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: compAccountReconciliationData.formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: MyText(
                title: "الاسم ثلاثي",
              ),
            ),
            LabelTextField(
              hint: "الاسم ثلاثي",
              controller: compAccountReconciliationData.name,
              validate: (value) => value!.validateName(context),
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: MyText(
                title: "اسماء البنوك",
              ),
            ),
            DropdownTextField<DropDownModel>(
              dropKey: compAccountReconciliationData.bank,
              label: "اسماء البنوك",
              margin: const EdgeInsets.symmetric(vertical: 10),
              validate: (DropDownModel value) =>
                  value.validateDropDown(context),
              onChange: compAccountReconciliationData.onSelectBank,
              useName: true,
              finData: (filter) async =>
                  await CustomerRepository(context).getBank(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: MyText(
                title: "رقم الايبان",
              ),
            ),
            LabelTextField(
              hint: "رقم الايبان",
              controller: compAccountReconciliationData.wallet,
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
