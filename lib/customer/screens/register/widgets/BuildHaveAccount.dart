part of 'RegisterWidgetsImports.dart';

class BuildHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: "لديك حساب بالفعل",
            color: MyColors.grey,
          ),
          SizedBox(width: 10,),
          InkWell(
            onTap: ()=> AutoRouter.of(context)
                .popUntilRouteWithName(LoginRoute.name),
            child: MyText(
              title: "تسجيل دخول",
              color: MyColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
