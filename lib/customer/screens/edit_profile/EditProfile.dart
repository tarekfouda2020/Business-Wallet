part of'EditProfileImports.dart';
class EditProfile extends StatelessWidget {
  final EditProfileData editProfileData = new EditProfileData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "حسابي",
      ),
      body:  BuildEditProfilePageView(editProfileData: editProfileData,),
    );
  }
}
