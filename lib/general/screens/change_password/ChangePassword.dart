part of 'ChangePasswordImports.dart';

class ChangePassword extends StatefulWidget {
  final String userId;

  const ChangePassword({required this.userId});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ChangePasswordData changePasswordData = new ChangePasswordData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(title: 'تغيير كلمة المرور'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          BuildChangeForm(changePasswordData: changePasswordData),
          BuildSaveButton(
            changePasswordData: changePasswordData,
            userId: widget.userId,
          ),
        ],
      ),
    );
  }
}
