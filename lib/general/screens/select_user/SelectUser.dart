part of 'SelectUserImports.dart';

class SelectUser extends StatefulWidget {
  final IntroModel? introModel;

  SelectUser({this.introModel});

  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  @override
  void initState() {
    print("_______%%%%_____${widget.introModel?.kayanFour}");

    super.initState();
  }

  SelectUserData selectUserData = SelectUserData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Res.logo,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          BuildButtonList(
            introModel: widget.introModel,
          ),
        ],
      ),
    );
  }
}
