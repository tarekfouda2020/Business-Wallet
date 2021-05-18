part of 'ProfileWidgetsImports.dart';

class BuildProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.primary,
          ),
          shape: BoxShape.circle),
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(
                  Res.on3,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
