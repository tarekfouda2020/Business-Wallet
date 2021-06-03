part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  final IntroModel? introModel;

  BuildNewRegister({this.introModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => AutoRouter.of(context)
            .push(SelectUserRoute(introModel: introModel)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              title: tr(context, "don'tHaveAccount"),
              size: 13,
              alien: TextAlign.center,
              color: MyColors.grey,
            ),
            MyText(
              title: "  اضغط هنا",
              size: 13,
              alien: TextAlign.center,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
