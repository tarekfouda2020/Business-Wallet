part of 'CompActiveAccountImports.dart';

class CompActiveAccount extends StatefulWidget {
  final String userId;

  const CompActiveAccount({required this.userId});

  @override
  _CompActiveAccountState createState() => _CompActiveAccountState();
}

class _CompActiveAccountState extends State<CompActiveAccount> {
  final CompActiveAccountData compActiveAccountData =
      new CompActiveAccountData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          BuildText(),
          BuildFormInputs(
            compActiveAccountData: compActiveAccountData,
          ),
          BuildButtonList(
            compActiveAccountData: compActiveAccountData,
            userId: widget.userId,
          )
        ],
      ),
    );
  }
}
