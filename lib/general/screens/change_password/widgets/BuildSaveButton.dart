part of 'ChangePassWidgetsImports.dart';

class BuildSaveButton extends StatelessWidget {

  final ChangePasswordData changePasswordData;

  const BuildSaveButton({required this.changePasswordData});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: changePasswordData.btnKey,
      title: 'حفظ التعديلات',
      textColor: MyColors.black,
      color: MyColors.primary,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      onTap: () => changePasswordData.setChangePassword(context),
    );
  }
}
