part of 'EditProfileWidgetsImports.dart';

class BuildEditProfilePageView extends StatelessWidget {
  final EditProfileData editProfileData;
  const BuildEditProfilePageView({required this.editProfileData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()
      ),
      children: [
        BuildEditProfileHeader(editProfileData: editProfileData,),
        BuildEditProfileFormInputs(editProfileData: editProfileData),
        BuildEditProfileButton(editProfileData: editProfileData),
      ],
    );

  }
}
