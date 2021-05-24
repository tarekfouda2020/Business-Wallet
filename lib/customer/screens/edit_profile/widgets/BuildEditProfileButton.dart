part of'EditProfileWidgetsImports.dart';
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
          // onTap: (){},
          color: MyColors.white,
          borderRadius: BorderRadius.circular(20),
          borderColor: MyColors.blackOpacity,
          textColor: MyColors.grey,
          // margin: const EdgeInsets.symmetric(vertical: 10),
        ),
        LoadingButton(
          btnKey: editProfileData.btnKey,
          title: "حفظ التعديلات",
          onTap: (){},
          // onTap: () => AutoRouter.of(context).push(HomeRoute()),
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: 20,
          // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ],
    );
  }
}
