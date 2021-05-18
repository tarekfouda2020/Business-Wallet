part of 'CompAccountWidgetsImports.dart';

class BuildLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: MyColors.greyWhite,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.power_settings_new,
            color: MyColors.primary,
          ),
          MyText(
            title: "تسجيل خروج",
            size: 12,
            color: MyColors.primary,
          )
        ],
      ),
    );
  }
}
