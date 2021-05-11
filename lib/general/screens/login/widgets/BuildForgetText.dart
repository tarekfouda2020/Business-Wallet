part of 'LoginWidgetsImports.dart';

class BuildForgetText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () => AutoRouter.of(context).push(ForgetPasswordEmailRoute()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyText(
              title: tr(context, "forgetPassword"),
              size: 13,
              color: MyColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
