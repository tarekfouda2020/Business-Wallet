part of 'InvDetailsWidgetsImports.dart';

class BuildInvPic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50, width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: MyColors.primary)
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 40, width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(Res.pic),
                fit: BoxFit.fill
            )
        ),
      ),
    );
  }
}
