part of 'ProfileImports.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "حسابي",
        showLeading: false,
      ),
      body: Column(
        children: [
          BuildProfileHeader(
            buttonText: "الصفحة الشخصية",
            onTap: ()=> AutoRouter.of(context).push(ProfilePageRoute()),
          ),
          BuildProfileView()
        ],
      ),
    );
  }
}
