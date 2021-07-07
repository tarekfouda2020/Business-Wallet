part of 'ForgetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildButton({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: forgerPasswordData.showEmail,
      builder: (BuildContext context, state) {
        return   LoadingButton(
          btnKey: forgerPasswordData.btnKey,
          title: tr(context, "send"),
          onTap: () =>
              forgerPasswordData.onForgetPasswordByEmail(context),
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: 20,
          margin: const EdgeInsets.symmetric(vertical: 30),
        );
      },
    );
  }
}
