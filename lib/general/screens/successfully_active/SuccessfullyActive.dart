part of 'SuccessfullyActiveImports.dart';

class SuccessfullyActive extends StatefulWidget {
  @override
  _SuccessfullyActiveState createState() => _SuccessfullyActiveState();
}

class _SuccessfullyActiveState extends State<SuccessfullyActive> {
  final SuccessfullyActiveData successfullyActiveData= new SuccessfullyActiveData();
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
          BuildConfirmPay(successfullyActiveData: successfullyActiveData,),
          DefaultButton(
            title: "الدفع ماستر كارد/ فيزا",
            onTap: () {},
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
          ),
          DefaultButton(
            title: "الدفع مدي",
            onTap: () {},
            color: MyColors.white,
            textColor: MyColors.blackOpacity,
          )
        ],
      ),
    );
  }
}
