part of 'ForgetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildButton({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: forgerPasswordData.showEmail,
      builder: (BuildContext context, state) {
        return Visibility(
          visible: state.data,
          child: Column(
            children: [
              LoadingButton(
                btnKey: forgerPasswordData.btnKey,
                title: tr(context, "send"),
                onTap: () =>
                    forgerPasswordData.onForgetPasswordByEmail(context),
                color: MyColors.primary,
                textColor: MyColors.black,
                borderRadius: 20,
                margin: const EdgeInsets.symmetric(vertical: 30),
              ),
              DefaultButton(
                title: "استعادة عبر البريد الالكتروني",
                onTap: () =>
                    forgerPasswordData.showEmail.onUpdateData(!state.data),
                color: MyColors.white,
                textColor: MyColors.black,
                borderRadius: BorderRadius.circular(20),
                margin: EdgeInsets.zero,
              )
            ],
          ),
          replacement: Column(
            children: [
              LoadingButton(
                btnKey: forgerPasswordData.btnKey,
                title: tr(context, "send"),
                onTap: () => forgerPasswordData.onForgetPassword(context),
                color: MyColors.primary,
                textColor: MyColors.black,
                borderRadius: 20,
                margin: const EdgeInsets.symmetric(vertical: 30),
              ),
              DefaultButton(
                title: "استعادة عبر الهاتف",
                onTap: () =>
                    forgerPasswordData.showEmail.onUpdateData(!state.data),
                color: MyColors.white,
                borderRadius: BorderRadius.circular(20),
                textColor: MyColors.black,
                margin: EdgeInsets.zero,
              )
            ],
          ),
        );
      },
    );
  }
}
