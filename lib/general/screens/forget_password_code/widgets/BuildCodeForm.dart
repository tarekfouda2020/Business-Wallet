part of 'ForgetPassCodeWidgetsImports.dart';

class BuildCodeForm extends StatelessWidget {
  final ForgetPasswordCodeData forgetPasswordCodeData;

  BuildCodeForm({required this.forgetPasswordCodeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: forgetPasswordCodeData.formKey,
        child: LabelTextField(
          hint: "كود التحقق",
          controller: forgetPasswordCodeData.code,
          action: TextInputAction.next,
          type: TextInputType.number,
          validate: (value) => value!.validateEmpty(context),
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}
