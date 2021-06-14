part of 'EditProfileWidgetsImports.dart';

class BuildEditProfileButton extends StatelessWidget {
  final EditProfileData editProfileData;

  const BuildEditProfileButton({required this.editProfileData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultButton(
          title: "تغيير كلمه المرور",
          onTap: () => AutoRouter.of(context).push(ChangePasswordRoute()),
          color: MyColors.white,
          borderRadius: BorderRadius.circular(20),
          borderColor: MyColors.blackOpacity,
          textColor: MyColors.blackOpacity,
          // margin: const EdgeInsets.symmetric(vertical: 10),
        ),
        LoadingButton(
          btnKey: editProfileData.btnKey,
          title: "حفظ التعديلات",
          onTap: () {
            editProfileData.updateUserData(context);
          },
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: 20,
        ),
      ],
    );
  }
}
