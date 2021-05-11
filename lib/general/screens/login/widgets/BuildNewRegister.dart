part of 'LoginWidgetsImports.dart';

class BuildNewRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () => AutoRouter.of(context).push(SelectUserRoute()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                title: tr(context, "don'tHaveAccount"),
                size: 12,
                alien: TextAlign.center,
                color: MyColors.grey,
              ),
              MyText(
                title: "اضغط هنا",
                size: 12,
                alien: TextAlign.center,
                color: MyColors.primary,
              ),
            ],
          ),
        ));
  }
}
