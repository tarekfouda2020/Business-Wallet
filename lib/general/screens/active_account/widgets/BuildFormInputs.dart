part of 'ActiveAccountWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ActiveAccountData activeAccountData;

  const BuildFormInputs({required this.activeAccountData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: activeAccountData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LabelTextField(
            hint: "كود التفعيل",
            margin: const EdgeInsets.symmetric(vertical: 10),
            controller: activeAccountData.code,
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
