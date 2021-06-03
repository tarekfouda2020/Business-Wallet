part of 'RegisterCommercialWidgetsImports.dart';

class BuildCommercialForm extends StatelessWidget {
  final CompanyRegisterCommercialData companyRegisterCommercialData;

  BuildCommercialForm({required this.companyRegisterCommercialData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Form(
        key: companyRegisterCommercialData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildFormText(text: "رقم السجل التجاري"),
            LabelTextField(
              hint: "رقم السجل التجاري ",
              controller: companyRegisterCommercialData.commercialNumb,
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              margin: const EdgeInsets.symmetric(vertical: 10),
              validate: (value) => value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
