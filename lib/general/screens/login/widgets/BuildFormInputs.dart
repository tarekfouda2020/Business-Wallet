part of 'LoginWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final LoginData loginData;

  const BuildFormInputs({required this.loginData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 20),
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
              controller: loginData.email,
              margin: const EdgeInsets.symmetric(vertical: 10),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
              validate: (value) => value!.validateEmpty(context),
            ),
            MyText(
              title: tr(context, "password"),
              size: 11,
              color: MyColors.white,
            ),
            IconTextFiled(
              hint: tr(context, "password"),
              controller: loginData.password,
              validate: (value) => value!.validateEmpty(context),
              isPassword: true,
              action: TextInputAction.done,
              suffixIcon: Icon(Icons.remove_red_eye, color: MyColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
