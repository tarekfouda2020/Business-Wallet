part of 'InvDetailsWidgetsImports.dart';

class BuildInvAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Image.asset(
        Res.bgheader,
        fit: BoxFit.fill,
      ),
      title: MyText(
        title: "تفاصيل الإعلان",
      ),
      backgroundColor: MyColors.darken,
      elevation: 0,
      leadingWidth: 10,
      actions: [
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            size: 25,
            color: MyColors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
