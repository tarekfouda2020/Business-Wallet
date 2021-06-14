part of 'EditProfileImports.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final EditProfileData editProfileData = new EditProfileData();

  @override
  void initState() {
    editProfileData.seInitialData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "حسابي",
      ),
      body: BuildEditProfilePageView(
        editProfileData: editProfileData,
      ),
    );
  }
}
