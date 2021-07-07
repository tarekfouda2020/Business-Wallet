part of 'ResetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String userId;

  const BuildFormInputs(
      {required this.resetPasswordData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: resetPasswordData.showPass,
            builder: (context, state) {
              return IconTextFiled(
                hint: "كلمة المرور",
                controller: resetPasswordData.newPassword,
                validate: (value) => value!.validatePassword(context),
                action: TextInputAction.next,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_rounded),
                  onPressed: () =>
                      resetPasswordData.showPass.onUpdateData(!state.data),
                ),
                isPassword: state.data,
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
            bloc: resetPasswordData.showConfirmPass,
            builder: (context, state) {
              return IconTextFiled(
                hint: "تأكيد كلمة المرور",
                controller: resetPasswordData.confirmNewPassword,
                action: TextInputAction.done,
                isPassword: state.data,
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_rounded),
                  onPressed: () => resetPasswordData.showConfirmPass
                      .onUpdateData(!state.data),
                ),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: resetPasswordData.newPassword.text),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
        ],
      ),
    );
  }
}
