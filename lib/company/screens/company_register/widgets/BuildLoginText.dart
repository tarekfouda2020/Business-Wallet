part of 'CompRegisterWidgetsImport.dart';

class BuildLoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          title: tr(context, "haveAccount"),
          size: 14,
          color: MyColors.offWhite,
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () => AutoRouter.of(context).push(LoginRoute()),
          child: MyText(
            title: tr(context, "login"),
            size: 14,
            color: MyColors.primary,
          ),
        ),
      ],
    );
  }
}
