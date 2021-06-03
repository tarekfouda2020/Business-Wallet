part of 'CompActiveAccountWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final CompActiveAccountData compActiveAccountData;

  const BuildFormInputs({required this.compActiveAccountData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: compActiveAccountData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LabelTextField(
            hint: "كود التفعيل",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: compActiveAccountData.code,
            action: TextInputAction.done,
            validate: (value) => value!.validateEmpty(context),
          ),
          MyText(
            title: "إعادة إرسال الكود",
            color: MyColors.grey,
          )
        ],
      ),
    );
  }
}
