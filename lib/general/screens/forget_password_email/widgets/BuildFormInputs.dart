part of 'ForgetPassEmailWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ForgetPassEmailData forgetPassEmailData;

  const BuildFormInputs({required this.forgetPassEmailData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: forgetPassEmailData.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: tr(context, "mail"),
              size: 11,
              color: MyColors.white,
            ),
            LabelTextField(
              hint: tr(context, "mail"),
              controller: forgetPassEmailData.email,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              validate: (value) => value!.validateEmpty(context),
            ),
          ],
        ),
      ),
    );
  }
}
